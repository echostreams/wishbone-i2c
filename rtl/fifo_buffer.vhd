-----------------------------------------------------------------------------
-- ETF BL
-- Widhbone I2C
-----------------------------------------------------------------------------
--
--    unit    name:                        fifo_buffer
--
--    description:
--
--              Design for FIFO buffer.
--
-----------------------------------------------------------------------------
--    Copyright    (c)    ETF BL
-----------------------------------------------------------------------------
--    LICENSE    NAME     MIT License
-----------------------------------------------------------------------------
--    LICENSE    NOTICE
-----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity fifo_buffer is
  generic
  (
     g_WIDTH : natural := 8;
     g_DEPTH : natural := 16
  );
  port
  (
     clk_i        : in  std_logic;
     rst_i        : in  std_logic;
     wr_en_i      : in  std_logic;
     rd_en_i      : in  std_logic;
     data_i       : in  std_logic_vector((g_WIDTH - 1) downto 0);
     data_o       : out std_logic_vector((g_WIDTH - 1) downto 0);
     buff_full_o  : out std_logic;
     buff_empty_o : out std_logic
  );
end fifo_buffer;

architecture arch of fifo_buffer is

  type t_fifo_array is array (0 to (g_DEPTH - 1)) of std_logic_vector((g_WIDTH - 1) downto 0);
  signal data_array : t_fifo_array := (others => (others => '0'));

  signal write_index : integer range 0 to (g_DEPTH - 1) := 0;
  signal read_index  : integer range 0 to (g_DEPTH - 1) := 0;

  signal data_count  : integer range 0 to g_DEPTH := 0;

  signal buff_full   : std_logic;
  signal buff_empty  : std_logic;

begin

  -- control process
  process (rst_i, clk_i)
  begin

    if rst_i = '1' then

      write_index <= 0;
      read_index <= 0;

    elsif rising_edge(clk_i) then

      if wr_en_i = '1' and buff_full = '0' then
        data_array(write_index) <= data_i;
      end if;

      if rd_en_i = '1' and buff_empty = '0' then
        data_o <= data_array(read_index);
      end if;

      if wr_en_i = '1' and rd_en_i = '0' and buff_full = '0' then
        data_count <= data_count + 1;
      elsif wr_en_i = '0' and rd_en_i = '1' and buff_empty = '0' then
        data_count <= data_count - 1;
      end if;

      if wr_en_i = '1' and buff_full = '0' then
        if write_index = g_DEPTH - 1 then
          write_index <= 0;
        else
          write_index <= write_index + 1;
        end if;
      end if;

      if rd_en_i = '1' and buff_empty = '0' then
        if read_index = g_DEPTH - 1 then
          read_index <= 0;
        else
          read_index <= read_index + 1;
        end if;
      end if;
    end if;
  end process;

  buff_full <= '1' when data_count = g_DEPTH else '0';
  buff_empty <= '1' when data_count = 0 else '0';

  buff_full_o <= buff_full;
  buff_empty_o <= buff_empty;

end arch;
