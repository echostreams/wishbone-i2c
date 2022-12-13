-- File: shift.vhd
--
-- Author: Jennifer Jenkins
-- Philips Semiconductor
-- Purpose:  Serial in/serial out 8-bit parallel load/out shift
--           register component definition.  Must have shift_en
--           active to shift or load register.
--
-- Created:  5-3-99 JLJ
-- Revised:  5-5-99 JLJ

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_arith.all;

entity shift8 is
  port (
    clk       : in    std_logic;                    -- Clock
    clr       : in    std_logic;                    -- Active log clear
    data_ld   : in    std_logic;                    -- Data load enable
    data_in   : in    std_logic_vector(7 downto 0); -- 8-bit data to load in
    shift_in  : in    std_logic;                    -- Serial data in
    shift_en  : in    std_logic;                    -- Shift enable
    shift_out : out   std_logic;                    -- Bit to shift out
    data_out  : out   std_logic_vector(7 downto 0)  -- 8-bit parallel out
  );
end entity shift8;

architecture definition of shift8 is

  constant reset_active : std_logic := '0';
  signal   data_int     : std_logic_vector(7 downto 0);

begin

  main : process (clk, clr) is
  begin

    -- Clear output register
    if (clr = reset_active) then
      data_int <= (others => '0');
    -- On rising edge of clock, shift in data
    elsif (clk'event and clk = '1') then
      -- Load data
      if (data_ld = '1') then
        data_int <= data_in;
      -- If shift enable is high
      elsif (shift_en = '1') then
        -- Shift the data
        data_int <= data_int(6 downto 0) & shift_in;
      end if;
    end if;

  end process main;

  shift_out <= data_int(7);
  data_out  <= data_int;

end architecture definition;

