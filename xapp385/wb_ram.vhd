----------------------------------------------------------------------------------------------------
-- This is a single-ported RAM module with the following properties:
--   * Wishbone B4 pipelined interface (see: https://cdn.opencores.org/downloads/wbspec_b4.pdf)
--   * Configurable size.
--   * Configurable data width.
--   * Configurable word granularity (for the SEL signal).
--   * Byte enable / select for write operations.
--   * Single cycle read/write operation.
--   * Synthesizes to BRAM.
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity wb_ram is
  generic(
    ADR_WIDTH   : positive := 10;  -- Determines the size of the RAM (num. of words = 2**ADR_WIDTH)
    DAT_WIDTH   : positive := 32;  -- Must be a multiple of GRANULARITY
    GRANULARITY : positive :=  8   -- Usually 8 (for byte granularity)
  );
  port(
    -- Wishbone SLAVE signals.
    i_rst   : in std_logic;
    i_clk   : in std_logic;
    i_adr   : in std_logic_vector(ADR_WIDTH-1 downto 0);
    i_dat   : in std_logic_vector(DAT_WIDTH-1 downto 0);
    i_we    : in std_logic;
    i_sel   : in std_logic_vector(DAT_WIDTH/GRANULARITY-1 downto 0);
    i_cyc   : in std_logic;
    i_stb   : in std_logic;
    o_dat   : out std_logic_vector(DAT_WIDTH-1 downto 0);
    o_ack   : out std_logic;
    o_stall : out std_logic;
    o_rty   : out std_logic;
    o_err   : out std_logic
  );
end wb_ram;

architecture rtl of wb_ram is
  constant C_NUM_WORDS : positive := 2**ADR_WIDTH;
  constant C_PARTS_PER_WORD : positive := DAT_WIDTH / GRANULARITY;

  subtype T_PART is std_logic_vector(GRANULARITY-1 downto 0);
  type T_PART_ARRAY is array (0 to C_NUM_WORDS-1) of T_PART;
  type T_MEM is array (0 to C_PARTS_PER_WORD-1) of T_PART_ARRAY;

  signal s_mem : T_MEM;

begin
  process(i_rst, i_clk)
    variable v_adr : integer range 0 to C_NUM_WORDS-1;
    variable v_req : std_logic;
  begin
    if i_rst = '1' then
      o_dat <= (others => '0');
      o_ack <= '0';
    elsif rising_edge(i_clk) then
      -- Is this a valid request for this Wishbone slave?
      v_req := i_cyc and i_stb;

      -- Get the address.
      v_adr := to_integer(unsigned(i_adr));

      -- Write?
      if v_req = '1' and i_we = '1' then
        for k in 0 to C_PARTS_PER_WORD-1 loop
          if i_sel(k) = '1' then
            s_mem(k)(v_adr) <= i_dat(GRANULARITY*(k+1)-1 downto GRANULARITY*k);
            report "Write " &
              to_hstring(i_dat(GRANULARITY*(k+1)-1 downto GRANULARITY*k)) & "h" &
              "to v_adr=" & integer'image(v_adr) &
              ", k=" & integer'image(k);
          end if;
        end loop;
      end if;

      -- read?
      if v_req = '1' then
        for k in 0 to C_PARTS_PER_WORD-1 loop
          o_dat(GRANULARITY*(k+1)-1 downto GRANULARITY*k) <= s_mem(k)(v_adr);
        end loop;
      end if;
      
      -- Ack that we have dealt with the request.
      o_ack <= v_req;
    end if;
  end process;

  -- Note: STALL, RTY and ERR are always deasserted, as we respond in one clock cycle and there is
  -- no risk of any errors.
  o_stall <= '0';
  o_rty <= '0';
  o_err <= '0';
  
end rtl;
