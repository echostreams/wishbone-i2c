library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------------------------------
-- UVVM Utility Library
-------------------------------------------------------------------------------
library STD;
use std.env.all;

library uvvm_util;
context uvvm_util.uvvm_util_context;

--library bitvis_vip_sbi;
--use bitvis_vip_sbi.sbi_bfm_pkg.all;
-------------------------------------------------------------------------------

entity tmp175_simmodel is
  generic(
    i2c_clk : integer := 200_000);      --i2c bus frequency in Hz
  port(
    sda : inout std_logic := 'Z';       --serial data output of i2c bus
    scl : inout std_logic := 'Z');      --serial clock output of i2c bus
end tmp175_simmodel;

architecture logic of tmp175_simmodel is

  type statetype is(sIDLE, sACK1, sACK2, sMACK, sREAD_ADDR, sREAD_POINTER, sREAD_DATA_FROM_MASTER, sWRITE_DATA_TO_MASTER);
  signal state     : statetype;
  type t_ctrl is (cSTART, cRESTART, cSTOP, cNONE);
  constant C_SCOPE : string := "TMP175 model";

  signal ctrl : t_ctrl := cNONE;


  signal addr                    : std_logic_vector(6 downto 0);
  signal rnw                     : std_logic;
  signal addr_rnw                : std_logic_vector(7 downto 0);
  signal pointer                 : std_logic_vector(7 downto 0);
  signal temperatureMSB          : std_logic_vector(7 downto 0) := x"a5";
  signal temperatureLSB          : std_logic_vector(7 downto 0) := x"5a";
  signal config                  : std_logic_vector(7 downto 0);
  signal tlowLSB, tlowMSB        : std_logic_vector(7 downto 0) := "00000000";
  signal thighLSB, thighMSB      : std_logic_vector(7 downto 0) := "00000000";
  signal logdata                 : std_logic_vector(7 downto 0);
  signal sda_in, sda_out, scl_in : std_logic;
  signal reset_ctrl : std_logic;
begin


  addr <= addr_rnw(7 downto 1);
  rnw  <= addr_rnw(0);

  scl <= 'Z';

  scl_in <= '1' when scl = 'Z' else '0';


  sda <= '0' when state = sACK1 else
         '0' when state = sACK2 else
         '0' when ((state = sWRITE_DATA_TO_MASTER) and (sda_out = '0')) else 'Z';

  sda_in <= '1' when sda = 'Z' else '0';


-------------------------------------------------------------------------------
-- Detect start and stop conditions
-------------------------------------------------------------------------------
  process(sda_in, scl_in,reset_ctrl)
  begin

    if sda_in'event and sda_in = '1' then
      if scl_in = '1' then
        ctrl <= cSTOP;
        log(ID_SEQUENCER_SUB, "STOP condition detected", C_SCOPE);
      end if;
    elsif sda_in'event and sda_in = '0' then
      if scl_in = '1' then
        if ctrl = cSTART or ctrl = cRESTART then
          ctrl <= cRESTART;
          log(ID_SEQUENCER_SUB, "RESTART condition detected", C_SCOPE);
        else
          ctrl <= cSTART;
          log(ID_SEQUENCER_SUB, "START condition detected", C_SCOPE);
        end if;
      end if;
    end if;
    if reset_ctrl = '1' then
      ctrl <= cNONE;
    end if;


  end process;

-------------------------------------------------------------------------------
-- Main control process
-------------------------------------------------------------------------------
  process(scl_in, ctrl)
    variable bit_count  : integer range 0 to 8 := 8;
    variable byte_count : integer range 0 to 1 := 1;  --keep track of
                                                      --temperature bytes
  begin

    --If stop detected return immediatly to sIDLE
    if ctrl = cSTOP then
      state      <= sIDLE;
      sda_out    <= '1';
      bit_count  := 8;
      byte_count := 1;

    end if;
    -- if restart condition detected return immediately to sIDLE.
    if ctrl'event and ctrl = cRESTART then
      state      <= sIDLE;
      sda_out    <= '1';
      bit_count  := 8;
      byte_count := 1;

    end if;

    --Do all the following operations on falling edge
    if falling_edge(scl_in) then
      case state is
-------------------------------------------------------------------------------
-- sIDLE
-------------------------------------------------------------------------------
        when sIDLE =>
          reset_ctrl <= '0';
          if ctrl = cSTART or ctrl = cRESTART then
            state <= sREAD_ADDR;
          end if;
          sda_out <= '1';
-------------------------------------------------------------------------------
-- sREAD_ADRR
-------------------------------------------------------------------------------
        when sREAD_ADDR =>
          sda_out             <= '1';
          bit_count           := bit_count - 1;
          addr_rnw(bit_count) <= sda_in;

          if bit_count = 0 then
            state   <= sACK1;
            sda_out <= '0';
          end if;
---------------------------------------
--sREAD_POINTER
---------------------------------------
        when sREAD_POINTER =>
          sda_out <= '1';

          bit_count          := bit_count - 1;
          pointer(bit_count) <= sda_in;

          if bit_count = 0 then
            state   <= sACK2;
            sda_out <= '0';
            log(ID_SEQUENCER_SUB, "Written: " & to_string(pointer(7 downto 1) & sda_in) & " to pointer reg.", C_SCOPE);
          end if;

-------------------------------------------------------------------------------
-- sACK1
-------------------------------------------------------------------------------
        when sACK1 =>

          sda_out   <= '0';
          bit_count := 8;

          if rnw = '0' then                  --continued write cmd from master
            state <= sREAD_POINTER;
          else
            state <= sWRITE_DATA_TO_MASTER;  --put first bit on bus
          end if;

          if addr /= "1001000" then
            state <= sIDLE;
            reset_ctrl <= '1';
          else
            log(ID_SEQUENCER_SUB, "Ack Address TMP175", C_SCOPE);
          end if;
-------------------------------------------------------------------------------
-- sACK2
-------------------------------------------------------------------------------
        when sACK2 =>

          log(ID_SEQUENCER_SUB, "Ack Data TMP175", C_SCOPE);
          sda_out   <= '0';
          state     <= sREAD_DATA_FROM_MASTER;  --continue to read data from master
          bit_count := 8;


-------------------------------------------------------------------------------
-- sREAD_DATA_FROM_MASTER
-------------------------------------------------------------------------------
        when sREAD_DATA_FROM_MASTER =>
          sda_out   <= '1';
          bit_count := bit_count - 1;
          if byte_count = 1 then
            if pointer = "00000000" then
              null;
            elsif pointer = "00000001" then
              config(bit_count) <= sda_in;
            elsif pointer = "00000010" then
              tlowMSB(bit_count) <= sda_in;
            elsif pointer = "00000011" then
              thighMSB(bit_count) <= sda_in;
            end if;
          elsif byte_count = 0 then
            if pointer = "00000010" then
              tlowLSB(bit_count) <= sda_in;
            elsif pointer = "00000011" then
              thighLSB(bit_count) <= sda_in;
            end if;
          end if;

          if bit_count = 0 then
            state   <= sACK2;
            sda_out <= '0';
            if pointer = "00000000" then
              alert(warning, "Temp. reg is read only!", C_SCOPE);
            elsif pointer = "00000001" then
              log(ID_SEQUENCER_SUB, "Updated Config .reg. to: " & to_string(config(7 downto 1) & sda_in), C_SCOPE);
            elsif pointer = "00000010" then
              if byte_count = 1 then
                log(ID_SEQUENCER_SUB, "Updated Tlow .reg. (MSB) to: " & to_string(tlowMSB(7 downto 1) & sda_in) & to_string(tlowLSB), C_SCOPE);
              else
                log(ID_SEQUENCER_SUB, "Updated Tlow .reg. (LSB) to: " & to_string(tlowMSB & tlowLSB(7 downto 1) & sda_in), C_SCOPE);
              end if;
            elsif pointer = "00000011" then
              if byte_count = 1 then
                log(ID_SEQUENCER_SUB, "Updated Thigh .reg. (MSB) to: " & to_string(thighMSB(7 downto 1) & sda_in) & to_string(thighLSB), C_SCOPE);
              else
                log(ID_SEQUENCER_SUB, "Updated Thigh .reg. (LSB) to: " & to_string(thighMSB & thighLSB(7 downto 1) & sda_in), C_SCOPE);
              end if;
            end if;
            byte_count := 0;
          end if;
-------------------------------------------------------------------------------
-- sWRITE_DATA_TO_MASTER
-------------------------------------------------------------------------------
        when sWRITE_DATA_TO_MASTER =>
          null;
-------------------------------------------------------------------------------
-- sMACK
-------------------------------------------------------------------------------
        when sMACK =>

          if sda_in /= '0' then
            log(ID_SEQUENCER_SUB, "Master NACK detected", C_SCOPE);
            state <= sIDLE;
          else
            state <= sWRITE_DATA_TO_MASTER;
            log(ID_SEQUENCER_SUB, "Master ACK detected", C_SCOPE);
          end if;
          bit_count := 8;
-------------------------------------------------------------------------------
-- others
-------------------------------------------------------------------------------
        when others =>
          sda_out <= '1';
        end case;
    end if;



    --The following code takes care of writing data to the I2C master.
    if falling_edge(scl_in) then

      if state = sWRITE_DATA_TO_MASTER or ((state = sACK1 or state = sMACK) and rnw = '1') then
        if bit_count = 0 then
          state <= sMACK;

          --logging
          if pointer = "00000000" then
            if byte_count = 1 then
              log(ID_SEQUENCER_SUB, "Read Temp. reg. (MSB) of value: " & to_string(temperatureMSB(7 downto 0)), C_SCOPE);
            else
              log(ID_SEQUENCER_SUB, "Read Temp. reg. (LSB) of value: " & to_string(temperatureLSB(7 downto 0)), C_SCOPE);
            end if;

          elsif pointer = "00000001" then
            log(ID_SEQUENCER_SUB, "Read Config .reg. of value: " & to_string(config(7 downto 0)), C_SCOPE);
          elsif pointer = "00000010" then
            if byte_count = 1 then
              log(ID_SEQUENCER_SUB, "Read Tlow .reg. (MSB) of value: " & to_string(tlowMSB(7 downto 0)), C_SCOPE);
            else
              log(ID_SEQUENCER_SUB, "Read Tlow .reg. (LSB) of value: " & to_string(tlowLSB(7 downto 0)), C_SCOPE);
            end if;
          elsif pointer = "00000011" then
            if byte_count = 1 then
              log(ID_SEQUENCER_SUB, "Read Thigh .reg. (MSB) of value: " & to_string(thighMSB(7 downto 0)), C_SCOPE);
            else
              log(ID_SEQUENCER_SUB, "Read Thigh .reg. (LSB) of value: " & to_string(thighLSB(7 downto 0)), C_SCOPE);
            end if;
          end if;
          byte_count := 0;

        else

          if pointer = x"00" then
            if byte_count = 1 then
              sda_out <= temperatureMSB(bit_count-1);
            else
              sda_out <= temperatureLSB(bit_count-1);
            end if;
          elsif pointer = "00000001" then
            sda_out <= config(bit_count-1);
          elsif pointer = "00000010" then
            if byte_count = 1 then
              sda_out <= tlowMSB(bit_count-1);
            else
              sda_out <= tlowLSB(bit_count-1);
            end if;
          elsif pointer = "00000011" then
            if byte_count = 1 then
              sda_out <= thighMSB(bit_count-1);
            else
              sda_out <= thighLSB(bit_count-1);
            end if;
          end if;
          bit_count := bit_count - 1;
        end if;
      end if;
    end if;

  end process;

end logic;