-----------------------------------------------------------------------------
-- ETF BL
-- Wishbone I2C
-----------------------------------------------------------------------------
--
--    unit name:interrupt_generator
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

entity interrupt_generator is
  port
   (
      clk_i        : in  std_logic;
      int_enbl_i   : in  std_logic;
      int_ack_i    : in  std_logic;
      arlo_i       : in  std_logic;
      int_clr_i    : in  std_logic;
      int_o        : out std_logic
   );
end interrupt_generator;

architecture arch of interrupt_generator is

  signal tmp     : std_logic := '0';
  signal int_reg : std_logic := '0';
  signal is_int  : std_logic;

begin

  -- Process
  process(clk_i)
  begin
    if rising_edge (clk_i) then
      if int_clr_i = '1' then
        int_reg <= '0';
      else
        int_reg <= tmp;
      end if;
    end if;
  end process;

  is_int <= arlo_i or int_ack_i or int_reg;
  tmp <= (is_int and int_enbl_i);
  int_o <= int_reg;

end arch;
