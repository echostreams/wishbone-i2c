----------------------------------------------------------------------------
-- ETF BL
-- Wishbone I2C
-----------------------------------------------------------------------------
--
--    unit    name:                        clock_generator
--
--    description:
--
--              This is top-level entity.
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

entity clock_generator is
  port
  (
    clk_i    : in  std_logic;
    rst_i    : in  std_logic;
    enb_i    : in  std_logic;
    sel_i    : in  std_logic_vector(1 downto 0);
    sysclk_i : in  std_logic_vector(31 downto 0);
    clk_o    : out std_logic
  );
end clock_generator;

architecture arch of clock_generator is

  constant c_STANDARD_MODE  : integer := 100_000;
  constant c_FAST_MODE      : integer := 400_000;
  constant c_FAST_MODE_PLUS : integer := 1_000_000;
  constant c_HZ_MULT        : integer := 1;
  constant c_KHZ_MULT       : integer := 1000;
  constant c_MHZ_MULT       : integer := 1_000_000;
  constant c_GHZ_MULT       : integer := 1_000_000_000;

  signal clk_val  : integer := 1;
  signal sig_mult : integer := c_HZ_MULT;
  signal col      : integer := 1;
  signal freq     : integer := c_STANDARD_MODE;

  -- Used for test on the board
  -- signal sysclk_i : std_logic_vector(31 downto 0) := "10000000000000000000000000110010";

  signal tmp      : std_logic := '0';

begin

  -- Count process
  process(clk_i, rst_i)
    variable count : integer := 0;
  begin
    if rst_i = '1' then
      count := 0;
      tmp <= '0';
    elsif rising_edge(clk_i) then
      if count /= col - 1 then
        count := count + 1;
        tmp <= tmp;
      else
        count := 0;
        if tmp = '0' then
          tmp <= 'H';
        else
          tmp <= '0';
        end if;
      end if;
    end if;
  end process;

  clk_val <= to_integer(unsigned(sysclk_i(29 downto 0)));

  with sysclk_i(31 downto 30) select
    sig_mult <= c_HZ_MULT when "00",
                c_KHZ_MULT when "01",
                c_MHZ_MULT when "10",
                c_GHZ_MULT when others;

  with sel_i select
    freq <= c_STANDARD_MODE when "00",
            c_FAST_MODE when "01",
            c_FAST_MODE_PLUS when others;

  col <= (clk_val * sig_mult) / (2 * freq);

  clk_o <= tmp when enb_i = '1' else
           'H';

end arch;
