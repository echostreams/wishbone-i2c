-----------------------------------------------------------------------------
-- ETF BL
-- Wishbone I2C
-----------------------------------------------------------------------------
--
--    unit name:transaction_controller
--
-----------------------------------------------------------------------------
--    Copyright    (c)    ETF BL
-----------------------------------------------------------------------------
--    LICENSE    MIT License
-----------------------------------------------------------------------------
--    LICENSE    NOTICE
-----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity transaction_controller is
  port
  (
    clk_i          : in    std_logic;
    rst_i          : in    std_logic;
    enbl_i         : in    std_logic;
    rep_strt_i     : in    std_logic;
    slv_addr_len_i : in    std_logic;
    msl_sel_i      : in    std_logic;
    scl_i          : in    std_logic;
    tx_buff_e_i    : in    std_logic;
    rx_buff_f_i    : in    std_logic;
    i2c_start_i    : in    std_logic;
    slv_addr_i     : in    std_logic_vector(9 downto 0);
    tx_data_i      : in    std_logic_vector(7 downto 0);
    mode_i         : in    std_logic_vector(1 downto 0);
    sysclk_i       : in    std_logic_vector(31 downto 0);
    sda_b          : inout std_logic;
    tx_rd_enbl_o   : out   std_logic;
    rx_wr_enbl_o   : out   std_logic;
    rx_data_o      : out   std_logic_vector(7 downto 0);
    busy_flg_o     : out   std_logic;
    ack_flg_o      : out   std_logic;
    clk_enbl_o     : out   std_logic;
    arb_lost_flg_o : out   std_logic
   );
end transaction_controller;

architecture arch of transaction_controller is

  constant c_STANDARD_MODE  : integer := 100_000;
  constant c_FAST_MODE      : integer := 400_000;
  constant c_FAST_MODE_PLUS : integer := 1_000_000;
  constant c_HZ_MULT        : integer := 1;
  constant c_KHZ_MULT       : integer := 1000;
  constant c_MHZ_MULT       : integer := 1_000_000;
  constant c_GHZ_MULT       : integer := 1_000_000_000;

  type t_state is
  (
    off_state, idle, enbl_tx_size, wait_tx_size, load_tx_size, ready,
    enbl_tx_addr, wait_tx_addr, load_tx_addr,
    sda_low, scl_low, sda_high_stop, scl_high_stop,
    sda_high_rep, scl_high_rep, addr_op, wait_ack_addr,
    enbl_tx_data, wait_tx_data, load_tx_data, write_op, wait_stop, wait_rep,
    wait_ack_data, read_op, send_ack, store, ack_intr, arb_intr,
    --------------------------------------------------------------------
    sda_low_slave, scl_low_slave, shift_addr_slave, check_addr_slave,
    generate_ack_slave_ok, generate_ack_slave_nok, write_slave, send_ack_slave, store_slave,
    enbl_tx_slave, wait_tx_slave, load_tx_slave, read_op_slave, wait_ack_slave,
    wait_stop_slave, sda_high_slave

  );
  signal state_reg, state_next : t_state;

  signal data_clk      : std_logic;
  signal data_clk_prev : std_logic;
  signal data_sda      : std_logic;
  signal data_sda_prev : std_logic;
  signal rep_strt      : std_logic;
  signal rep_strt_prev : std_logic;
  signal low_delay     : std_logic;
  signal busy          : std_logic;
  signal ack           : std_logic := '0';
  signal rst_count     : std_logic := '0';
  signal arb_lost      : std_logic := '0';
  signal wait_done     : std_logic := '0';
  signal write_done    : std_logic := '0';
  signal read_done     : std_logic := '0';
  signal addr_check    : std_logic := '0';
  signal det_rep_st    : std_logic := '0';

  signal sysclk_val    : integer := 1;
  signal sig_mult      : integer := c_HZ_MULT;
  signal freq          : integer := c_STANDARD_MODE;
  signal clk_val       : integer := 1;
  signal divider       : integer := 1;
  signal byte_count    : integer := 0;
  signal count         : integer range 0 to 125;

  -- registers
  signal sda_reg, sda_next               : std_logic;
  signal rst_count_reg, rst_count_next   : std_logic;
  signal busy_reg, busy_next             : std_logic;
  signal byte_count_reg, byte_count_next : integer := 0;
  signal bit_count_reg, bit_count_next   : integer := 8;
  signal shift_reg, shift_next           : std_logic_vector(7 downto 0) := (others => '0');
  signal ten_bit_reg, ten_bit_next       : std_logic := '0';
  signal rw_reg, rw_next                 : std_logic := '0';
  signal rep_st_reg, rep_st_next         : std_logic := '0';
  signal rep_st_ld_reg, rep_st_ld_next   : std_logic := '0';

begin

  -- control path: state register
  process(clk_i, rst_i)
  begin

    if rst_i = '1' then
      state_reg <= idle;
      count <= 0;
    elsif rising_edge(clk_i) then

      data_clk_prev <= data_clk;
      data_clk <= scl_i;
      data_sda_prev <= data_sda;
      data_sda <= sda_b;
      rep_strt_prev <= rep_strt;
      rep_strt <= rep_strt_i;

      if rst_count = '1' then
        count <= 0;
        low_delay <= '0';
      elsif count = divider - 1 then
        count <= 0;
        low_delay <= '1';
      else
        count <= count + 1;
        low_delay <= '0';
      end if;

      state_reg <= state_next;

    end if;
  end process;

  -- control path: next-state
  process(state_reg, data_clk, data_clk_prev, enbl_i,
          rep_strt_i, read_done, i2c_start_i, tx_buff_e_i,
          msl_sel_i, byte_count, arb_lost, low_delay, det_rep_st,
          ack, rw_reg, write_done, addr_check, rep_st_ld_reg, rep_st_reg,
          data_sda_prev, data_sda, slv_addr_len_i, ten_bit_reg)
  begin
    case state_reg is

      when off_state =>
        if enbl_i = '1' then
          state_next <= idle;
        else
          state_next <= off_state;
        end if;

      when idle =>
        if enbl_i = '0' then
          state_next <= off_state;
        elsif i2c_start_i = '1' and tx_buff_e_i = '0' then
          state_next <= enbl_tx_size;
        else
          state_next <= idle;
        end if;

      when enbl_tx_size =>
        state_next <= wait_tx_size;

      when wait_tx_size =>
        state_next <= load_tx_size;

      when load_tx_size =>
        -- if rep_strt_i = '1' then
        if rep_st_ld_reg = '1' then
          state_next <= enbl_tx_addr;
        else
          state_next <= ready;
        end if;

      when ready =>
        if msl_sel_i = '0' then
          state_next <= enbl_tx_addr;
        else
          state_next <= sda_low_slave;
        end if;

      when enbl_tx_addr =>
        state_next <= wait_tx_addr;

      when wait_tx_addr =>
        state_next <= load_tx_addr;

      when load_tx_addr =>
        state_next <= sda_low;

      when sda_high_rep =>
        if low_delay = '1' then
          state_next <= scl_high_rep;
        else
          state_next <= sda_high_rep;
        end if;

      when scl_high_rep =>
        if low_delay = '1' then
          state_next <= enbl_tx_size;
        else
          state_next <= scl_high_rep;
        end if;

      when sda_low =>
        if low_delay = '1' then
          state_next <= scl_low;
        else
          state_next <= sda_low;
        end if;

      when scl_low =>
        state_next <= addr_op;

      when addr_op =>
        if arb_lost = '1' then
          state_next <= arb_intr;
        elsif write_done = '1' then
          state_next <= wait_ack_addr;
        else
          state_next <= addr_op;
        end if;

      when wait_ack_addr =>
        if data_clk_prev = '0' and (data_clk = '1' or data_clk = 'H') then
          if data_sda = '1' or data_sda = 'H' then
            state_next <= ack_intr;
          else
            if rw_reg = '0' then
              state_next <= enbl_tx_data;
            else
              state_next <= read_op;
            end if;
          end if;
        else
          state_next <= wait_ack_addr;
        end if;

      when ack_intr =>
        state_next <= idle;

      when arb_intr =>
        state_next <= idle;

      when enbl_tx_data =>
        state_next <= wait_tx_data;

      when wait_tx_data =>
        state_next <= load_tx_data;

      when load_tx_data =>
        state_next <= write_op;

      when write_op =>
        if arb_lost = '1' then
          state_next <= arb_intr;
        elsif write_done = '1' then
          state_next <= wait_ack_data;
        else
          state_next <= write_op;
        end if;

      when wait_ack_data =>
        if data_clk_prev = '0' and (data_clk = '1' or data_clk = 'H') then
          if data_sda = '1' or data_sda = 'H' then
            state_next <= ack_intr;
          elsif byte_count /= 0 then
            state_next <= enbl_tx_data;
          -- elsif rep_strt_i = '1' then
          elsif rep_st_reg = '1' then
            state_next <= wait_rep;
          else
            state_next <= wait_stop;
          end if;
        else
          state_next <= wait_ack_data;
        end if;

      when wait_rep =>
        if (data_clk_prev = '1' or data_clk_prev = 'H') and data_clk = '0' then
          state_next <= sda_high_rep;
        else
          state_next <= wait_rep;
        end if;

      when wait_stop =>
        if data_clk_prev = '0' and (data_clk = '1' or data_clk = 'H') then
          state_next <= scl_high_stop;
        else
          state_next <= wait_stop;
        end if;

      when scl_high_stop =>
        if low_delay = '1' then
          state_next <= sda_high_stop;
        else
          state_next <= scl_high_stop;
        end if;

      when sda_high_stop =>
        state_next <= idle;

      when read_op =>
        if read_done = '1' then
          state_next <= send_ack;
        else
          state_next <= read_op;
        end if;

      when send_ack =>
        if data_clk_prev = '0' and (data_clk = '1' or data_clk = 'H') then
          state_next <= store;
        else
          state_next <= send_ack;
        end if;

      when store =>
        if byte_count /= 0 then
          state_next <= read_op;
        -- elsif rep_strt_i = '1' then
        elsif rep_st_reg = '1' then
          state_next <= wait_rep;
        else
          state_next <= wait_stop;
        end if;

      -- slave part
      when sda_low_slave =>
        if (data_sda_prev = 'H' or data_sda_prev = '1') and data_sda = '0' then
          state_next <= scl_low_slave;
        else
          state_next <= sda_low_slave;
        end if;

      when scl_low_slave =>
        if (data_clk_prev = '1' or data_clk_prev = 'H') and data_clk = '0' then
          state_next <= shift_addr_slave;
        else
          state_next <= scl_low_slave;
        end if;

      when shift_addr_slave =>
        if read_done = '1' then
          state_next <= check_addr_slave;
        else
          state_next <= shift_addr_slave;
        end if;

      when check_addr_slave =>
        if addr_check = '1' then
          state_next <= generate_ack_slave_ok;
        elsif addr_check = '0' then
          state_next <= generate_ack_slave_nok;
        else
          state_next <= ready;
        end if;

      when generate_ack_slave_ok =>
        if data_clk_prev = '0' and (data_clk = '1' or data_clk = 'H') then
        -- if (data_clk_prev = 'H' or data_clk_prev = '1') and data_clk = '0' then
          if slv_addr_len_i = '0' then
            if rw_reg = '0' then
              state_next <= write_slave;
            else
              state_next <= enbl_tx_slave;
            end if;
          else
            if ten_bit_reg = '0' then
              if rw_reg = '0' then
                state_next <= shift_addr_slave;
              else
                state_next <= enbl_tx_slave;
              end if;
            else
              if rw_reg = '0' then
                state_next <= write_slave;
              else
                state_next <= enbl_tx_slave;
              end if;
            end if;
          end if;
        else
          state_next <= generate_ack_slave_ok;
        end if;

      when generate_ack_slave_nok =>
        -- if data_clk_prev = '0' and (data_clk = '1' or data_clk = 'H') then
        if (data_clk_prev = 'H' or data_clk_prev = '1') and data_clk = '0' then
          state_next <= ready;
        else
          state_next <= generate_ack_slave_nok;
        end if;

      when write_slave =>
        if read_done = '1' then
          state_next <= send_ack_slave;
        elsif det_rep_st = '1' then
          state_next <= shift_addr_slave;
        else
          state_next <= write_slave;
        end if;

      when send_ack_slave =>
        -- if data_clk_prev = '0' and (data_clk = '1' or data_clk = 'H') then
        if (data_clk_prev = 'H' or data_clk_prev = '1') and data_clk = '0' then
          state_next <= store_slave;
        else
          state_next <= send_ack_slave;
        end if;

      when store_slave =>
        if byte_count /= 0 then
          state_next <= write_slave;
        else
          state_next <= wait_stop_slave;
        end if;

      when wait_stop_slave =>
        if data_clk_prev = '0' and (data_clk = '1' or data_clk = 'H') then
          state_next <= sda_high_slave;
        else
          state_next <= wait_stop_slave;
        end if;

      when sda_high_slave =>
        if data_sda_prev = '0' and (data_sda = '1' or data_sda = 'H') then
          state_next <= idle;
        else
          state_next <= sda_high_slave;
        end if;

      when enbl_tx_slave =>
        state_next <= wait_tx_slave;

      when wait_tx_slave =>
        state_next <= load_tx_slave;

      when load_tx_slave =>
        state_next <= read_op_slave;

      when read_op_slave =>
        if write_done = '1' then
          state_next <= wait_ack_slave;
        else
          state_next <= read_op_slave;
        end if;

      when wait_ack_slave =>
        if data_clk_prev = '0' and (data_clk = '1' or data_clk = 'H') then
          if data_sda = '1' then
            state_next <= ack_intr;
          elsif byte_count /= 0 then
            state_next <= enbl_tx_slave;
          else
            state_next <= wait_stop_slave;
          end if;
        else
          state_next <= wait_ack_slave;
        end if;

      when others =>
        state_next <= idle;

    end case;
  end process;

  -- control path: output logic
  with state_reg select
    tx_rd_enbl_o <= '1' when enbl_tx_addr | enbl_tx_data | enbl_tx_size | enbl_tx_slave,
                    '0' when others;



  with state_reg select
    clk_enbl_o <= '0' when off_state | idle | enbl_tx_size | wait_tx_size | load_tx_size |
                           enbl_tx_addr | wait_tx_addr | load_tx_addr | sda_low |
                           scl_high_rep | scl_high_stop | sda_high_stop | ready |
                           ack_intr,
                  '1' when others;

  rx_wr_enbl_o   <= '1' when state_reg = store or state_reg = store_slave else '0';
  ack_flg_o      <= '1' when state_reg = ack_intr else '0';
  arb_lost_flg_o <= '1' when state_reg = arb_intr else '0';

  -- datapath: data register
  process(clk_i, rst_i)
  begin

    if rst_i = '1' then

      sda_reg        <= 'H';
      busy_reg       <= '0';
      byte_count_reg <= 0;
      bit_count_reg  <= 8;
      rst_count_reg  <= '1';
      shift_reg      <= (others => '0');
      ten_bit_reg    <= '0';
      rw_reg         <= '0';
      rep_st_reg     <= '0';
      rep_st_ld_reg  <= '0';

    elsif rising_edge(clk_i) then

      sda_reg        <= sda_next;
      busy_reg       <= busy_next;
      byte_count_reg <= byte_count_next;
      bit_count_reg  <= bit_count_next;
      rst_count_reg  <= rst_count_next;
      shift_reg      <= shift_next;
      ten_bit_reg    <= ten_bit_next;
      rw_reg         <= rw_next;
      rep_st_reg     <= rep_st_next;
      rep_st_ld_reg  <= rep_st_ld_next;

    end if;
  end process;

  -- datapath: routing multipexer
  process(state_reg, sda_reg, byte_count_reg, bit_count_reg, busy_reg, shift_reg, rep_st_reg, rep_st_ld_reg,
          rst_count_reg, data_clk_prev, data_clk, tx_data_i, sda_b, slv_addr_i, ten_bit_reg,
          slv_addr_len_i, rw_reg, rep_strt_prev, rep_strt)
  begin

    sda_next        <= 'H';
    busy_next       <= busy_reg;
    byte_count_next <= byte_count_reg;
    bit_count_next  <= 8;
    rst_count_next  <= '0';
    shift_next      <= shift_reg;
    read_done       <= '0';
    write_done      <= '0';
    arb_lost        <= '0';
    addr_check      <= '0';
    ten_bit_next    <= ten_bit_reg;
    rw_next         <= rw_reg;
    arb_lost        <= '0';
    rep_st_next     <= rep_st_reg;
    rep_st_ld_next  <= rep_st_ld_reg;
    det_rep_st      <= '0';

    if rep_strt_prev = '0' and rep_strt = '1' then
      rep_st_next <= '1';
    end if;

    -- logic
    case state_reg is

      when off_state =>
        busy_next <= '0';

      when load_tx_size =>
        byte_count_next <= to_integer(unsigned(tx_data_i));

--      when ready =>
--        sda_next <= '1';
--
      when enbl_tx_addr =>
        rep_st_ld_next <= '0';
--
--      when wait_tx_addr =>
--        sda_next <= '1';

      when load_tx_addr =>
        shift_next     <= tx_data_i;
        bit_count_next <= 8;
        rst_count_next <= '0';
        rw_next        <= tx_data_i(0);
        -- sda_next       <= '1';

      when sda_low =>
        sda_next <= '0';

      when scl_low =>
        sda_next <= '0';
        busy_next <= '1';

      when addr_op =>
        bit_count_next <= bit_count_reg;
        sda_next <= sda_reg;
        if (data_clk_prev = '1' or data_clk_prev = 'H') and data_clk = '0' then
          if bit_count_reg = 0 then
            write_done <= '1';
          else
            bit_count_next <= bit_count_reg - 1;
            -- sda_next <= 'H' when shift_reg(bit_count_reg - 1) = '1' else '0';
            if shift_reg(bit_count_reg - 1) = '1' then
              sda_next <= 'H';
            else
              sda_next <= '0';
            end if;
          end if;
        elsif data_clk_prev = '0' and (data_clk = '1' or data_clk = 'H') then
          -- if sda_b /= shift_reg(bit_count_reg) then
          if sda_b = '0' then
            if sda_b /= shift_reg(bit_count_reg) then
              arb_lost <= '1';
            end if;
          end if;
        end if;

      when wait_ack_addr =>
        sda_next <= 'H';
        write_done <= '0';

      when enbl_tx_data =>
        sda_next <= '0';

      when wait_tx_data =>
        sda_next <= '0';

      when load_tx_data =>
        sda_next       <= '0';
        shift_next     <= tx_data_i;
        bit_count_next <= 8;

      when write_op =>
        if (data_clk_prev = '1' or data_clk_prev = 'H') and data_clk = '0' then
          if bit_count_reg = 0 then
            write_done <= '1';
            byte_count_next <= byte_count_reg - 1;
            sda_next <= 'H';
          else
            bit_count_next <= bit_count_reg - 1;
            -- sda_next <= 'H' when shift_reg(bit_count_reg - 1) = '1' else '0';
            if shift_reg(bit_count_reg - 1) = '1' then
              sda_next <= 'H';
            else
              sda_next <= '0';
            end if;
          end if;
        else
          bit_count_next <= bit_count_reg;
          sda_next       <= sda_reg;
        end if;

      when wait_ack_data =>
        sda_next   <= 'H';
        write_done <= '0';

      when wait_rep =>
        sda_next <= '0';
        rep_st_next <= '0';
        rep_st_ld_next <= '1';

      when wait_stop =>
        sda_next <= '0';

      when scl_high_stop =>
        rst_count_next <= '0';
        busy_next      <= '0';
        sda_next       <= '0';

      when sda_high_stop =>
        -- sda_next <= '1';
        sda_next <= 'H';

      when read_op =>
        if data_clk_prev = '0' and (data_clk = '1' or data_clk = 'H') then
          bit_count_next <= bit_count_reg - 1;
          -- code change
          if sda_b = 'H' then
            shift_next(bit_count_reg - 1) <= '1';
          else
            shift_next(bit_count_reg - 1) <= sda_b;
          end if;
          -- end code change
          -- shift_next(bit_count_reg - 1) <= sda_b;
        elsif (data_clk_prev = '1' or data_clk_prev = 'H') and data_clk = '0' then
          if bit_count_reg = 0 then
            read_done <= '1';
            byte_count_next <= byte_count_reg - 1;
          else
            bit_count_next <= bit_count_reg;
          end if;
        else
          bit_count_next <= bit_count_reg;
        end if;

      when send_ack =>
        if byte_count_reg = 0 then
          -- sda_next <= '1';
          sda_next <= 'H';
        else
          sda_next <= '0';
        end if;

      when sda_high_rep =>
        if sda_b /= '0' then
          -- sda_next       <= '1';
          sda_next       <= 'H';
          rst_count_next <= '0';
        else
          rst_count_next <= '1';
        end if;

      when scl_high_rep =>
        -- sda_next       <= '1';
        sda_next       <= 'H';
        rst_count_next <= '0';

      -- slave part
      when scl_low_slave =>
        if (data_clk_prev = '1' or data_clk_prev = 'H') and data_clk = '0' then
          busy_next <= '1';
        end if;

      when shift_addr_slave =>
        if data_clk_prev = '0' and (data_clk = '1' or data_clk = 'H') then
          bit_count_next <= bit_count_reg - 1;
          -- shift_next(bit_count_reg - 1) <= '0' when sda_b = '0' else '1';
          if sda_b = '0' then
            shift_next(bit_count_reg - 1) <= '0';
          else
            shift_next(bit_count_reg - 1) <= '1';
          end if;
        elsif (data_clk_prev = '1' or data_clk_prev = 'H') and data_clk = '0' then
          if bit_count_reg = 0 then
            read_done <= '1';
          else
            bit_count_next <= bit_count_reg;
          end if;
        else
          bit_count_next <= bit_count_reg;
          sda_next <= sda_reg;
        end if;

      when check_addr_slave =>
        if slv_addr_len_i = '0' then
          if shift_reg(7 downto 1) = slv_addr_i(6 downto 0) then
            addr_check <= '1';
            rw_next    <= shift_reg(0);
          end if;
        else
          if ten_bit_reg = '0' then
            if shift_reg(7 downto 1) = ("11110" & slv_addr_i(9 downto 8)) then
              addr_check   <= '1';
              rw_next      <= shift_reg(0);
            end if;
          else
            if shift_reg = slv_addr_i(7 downto 0) then
              addr_check <= '1';
            end if;
          end if;
        end if;

      when generate_ack_slave_ok =>
        sda_next <= '0';
        if data_clk_prev = '0' and (data_clk = '1' or data_clk = 'H') then
          if slv_addr_len_i = '1' then
            if ten_bit_reg = '0' then
              ten_bit_next <= '1';
            else
              ten_bit_next <= '0';
            end if;
          end if;
        end if;

      when generate_ack_slave_nok =>
        -- sda_next <= '1';
        sda_next <= 'H';

      when write_slave =>
        if data_clk_prev = '0' and (data_clk = '1' or data_clk = 'H') then
          bit_count_next <= bit_count_reg - 1;
          -- code change
--          if sda_b = 'H' then
--            shift_next(bit_count_reg - 1) <= '1';
--          else
--            shift_next(bit_count_reg - 1) <= sda_b;
--          end if;
          -- end code change
          -- shift_next(bit_count_reg - 1) <= '0' when sda_b = '0' else '1';
          if sda_b = '0' then
            shift_next(bit_count_reg - 1) <= '0';
          else
            shift_next(bit_count_reg - 1) <= '1';
          end if;
        elsif (data_clk_prev = '1' or data_clk_prev = 'H') and data_clk = '0' then
          if bit_count_reg = 0 then
            read_done <= '1';
            byte_count_next <= byte_count_reg - 1;
          else
            bit_count_next <= bit_count_reg;
          end if;
          if bit_count_reg = 7 and shift_reg(7) = '1' and sda_b = '0' then
            det_rep_st <= '1';
            bit_count_next <= 8;
          end if;
        else
          bit_count_next <= bit_count_reg;
          sda_next <= sda_reg;
        end if;

      when send_ack_slave =>
        sda_next <= '0';

      when enbl_tx_slave =>
        sda_next <= '0';

      when wait_tx_slave =>
        sda_next <= '0';

      when load_tx_slave =>
        sda_next       <= '0';
        shift_next     <= tx_data_i;
        bit_count_next <= 8;

      when read_op_slave =>
        if (data_clk_prev = '1' or data_clk_prev = 'H') and data_clk = '0' then
          if bit_count_reg = 0 then
            write_done <= '1';
            byte_count_next <= byte_count_reg - 1;
            sda_next <= 'H';
          else
            bit_count_next <= bit_count_reg - 1;
            -- sda_next <= 'H' when shift_reg(bit_count_reg - 1) = '1' else '0';
            if shift_reg(bit_count_reg - 1) = '1' then
              sda_next <= 'H';
            else
              sda_next <= '0';
            end if;
          end if;
        else
          bit_count_next <= bit_count_reg;
          sda_next       <= sda_reg;
        end if;

      when sda_high_slave =>
        busy_next <= '0';

      when others =>
    end case;
  end process;

  -- data path: status
  byte_count <= byte_count_reg;
  rst_count  <= rst_count_reg;

  -- data path: functional unit
  -- ack <= sda_b;

  -- data path: output
  sda_b      <= sda_reg;
  rx_data_o  <= shift_reg when state_reg = store or state_reg = store_slave or state_reg = check_addr_slave else (others => '0');
  busy_flg_o <= busy_reg;

  sysclk_val <= to_integer(unsigned(sysclk_i(29 downto 0)));

  with sysclk_i(31 downto 30) select
    sig_mult <= c_HZ_MULT  when "00",
                c_KHZ_MULT when "01",
                c_MHZ_MULT when "10",
                c_GHZ_MULT when others;

  with mode_i select
    freq <= c_STANDARD_MODE when "00",
            c_FAST_MODE when "01",
            c_FAST_MODE_PLUS when others;

  clk_val <= (sysclk_val * sig_mult);

  divider <= (clk_val / freq) / 4;
end arch;
