library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity i2c_master is
  generic(
   GC_SYSTEM_CLK   	: integer := 50000000;
	GC_I2C_CLK 			: integer  := 2_000_000); 

port(
clk       		: in  STD_LOGIC;   	   -- system clock
rst_n   			: in  STD_LOGIC;       	-- synchronous active low reset
valid   			: in  STD_LOGIC;         -- module enable
addr   			: in  std_logic_vector(6 downto 0); -- address of target slave
rnw   			: in  std_logic;   -- Read/nWrite command ('0'=write)
data_wr 			: in  std_logic_vector(7 downto 0);   -- data to be written to slave
data_rd  		: out std_logic_vector(7 downto 0); -- data read from slave
busy   			: out std_logic := '0';   -- indicates transaction in progress
ack_error 		: out std_logic;   -- flagged if no acknowledge from slave
scl_clk_test	: out std_logic;
state_ena_test	: out std_logic;
scl_high_ena_test : out std_logic;
sda     			: inout STD_LOGIC;    -- bidirectional serial i2c data
scl  				: inout std_logic);   -- bidirectional serial i2c clock
end i2c_master;

architecture i2c_master_arc of i2c_master is

-- internal signal declarations 
type state_type is (sIDLE, sStart, sADDR, sACK1, sWRITE, sREAD, sACK2, sMACK, sSTOP);
signal state   		: state_type;      -- state machine signal

signal state_ena  	: std_logic;     -- enables state transition (duration 1 system clk cycle)
signal scl_high_ena  : std_logic;     -- enable signal used for START and STOP conditions,data sample, and acknowledge (duration 1 system clk cycle)
signal scl_clk  		: std_logic := '0';      -- internal continuous running i2c clk signal
signal scl_oe  		: std_logic;     -- output enable for scl
signal ack_error_i	: std_logic := '0';     -- Internal ack. error flag (ack_error <= ack_error_i)
signal sda_i  			: std_logic;     -- interal sda signal
signal addr_rnw_i 	: std_logic_vector(7 downto 0);   -- internally stored value of address and Read/nWrite bit
signal data_tx  		: std_logic_vector(7 downto 0);   -- internally stored data to be sent to slave
signal data_rx  		: std_logic_vector(7 downto 0);   -- internally stored data from slave
signal bit_cnt  		: integer range 0 to 7;     -- counter to keep track of data bit

constant C_SCL_PERIOD  		: integer := GC_SYSTEM_CLK/GC_I2C_CLK; 
constant C_SCL_HALF_PERIOD : integer := C_SCL_PERIOD/2;
constant C_STATE_TRIGGER  	: integer := C_SCL_PERIOD/4; 
constant C_SCL_TRIGGER  	: integer := C_SCL_PERIOD*3/4;

alias rnw_i : std_logic is addr_rnw_i(0);
begin -- architecture begin

p_sclk : process(clk, rst_n) -- system clock divider to generate scl clock
variable cnt : integer range 0 to C_SCL_PERIOD := 0;
begin

	if rising_edge(clk) then
		if rst_n = '0' then
		cnt := 0;
		else 
			cnt := cnt + 1;
			if cnt = C_SCL_HALF_PERIOD then -- 5.000.000 / 200.000 = 25 
				scl_clk <= not scl_clk;
				cnt := 0;
			end if;
		end if;
	end if;
end process p_sclk;

scl_clk_test <= scl_clk;

p_ctrl : process(clk, rst_n)    -- scl high enable control
variable cnt : integer range 0 to C_SCL_PERIOD := 0;
begin

if rising_edge(clk) then
	
	if rst_n = '0' then
		cnt := 0;
	else
		cnt := cnt + 1;
		if cnt = C_SCL_PERIOD then
			cnt := 0;
		elsif cnt = C_SCL_TRIGGER then 
			scl_high_ena <= '1';
		elsif cnt = C_STATE_TRIGGER then
			state_ena <= '1';
		else
			scl_high_ena <= '0';
			state_ena <= '0';
		end if;
	end if;
end if;
end process p_ctrl;

scl_high_ena_test <= scl_high_ena;
state_ena_test <= state_ena;


p_state : process(clk)
begin
if rising_edge(clk) then


case state is
	
	when sIDLE =>
		busy <= '0';
		sda_i <= '1';
		if valid = '1' then
			addr_rnw_i <= addr & rnw;
			data_tx <= data_wr;
			ack_error_i <= '0';
			bit_cnt <= 7;
			if state_ena = '1' then
				busy <= '1';
				state <= sSTART;
			end if;
		end if;
	
	when sSTART =>
		busy <= '1';
		if scl_high_ena = '1' then
			sda_i <= '0';
		end if;
		
		if state_ena = '1' then
			state <= sADDR;
		end if;
	
	when sADDR =>
		busy <= '1';
		sda_i <= addr_rnw_i(bit_cnt);
		if state_ena = '1' then 
			if bit_cnt = 0 then
				bit_cnt <= 7;
				state <= sACK1;
			else
				bit_cnt <= bit_cnt - 1;
			end if;
		end if;
		
	when sACK1 =>
		busy <= '1';
		if sda <= '0' then sda_i <= '1';
		end if;
		if state_ena = '1' then 
			if rnw_i = '0' then
				state <= sWRITE;
			elsif rnw_i = '1' then 
				state <= sREAD;
			end if;
		elsif scl_high_ena = '1' then	
			if sda /= '0' then
			ack_error_i <= '1';
			else
			ack_error_i <= '0';
			end if;
		end if;
	
	when sWRITE =>
		busy <= '1';
		sda_i <= data_tx(bit_cnt);
		if state_ena = '1' then
			if bit_cnt = 0 then 
				bit_cnt <= 7;
				state <= sACK2;
			else
				bit_cnt <= bit_cnt - 1;
			end if;
		end if;
				
	when sACK2 =>
		busy <= '0';
		sda_i <= '1';	
		if valid = '1' and rnw = '0' then
			data_tx <= data_wr;
			if state_ena = '1' then
				state <= sWRITE;
			end if;
		elsif valid = '1' and rnw = '1' then
			addr_rnw_i <= addr & rnw;
			if state_ena = '1' then	
				state <= sStart;
			end if;
		elsif valid = '0' then
			if state_ena = '1' then
				sda_i <= '0';
				state <= sSTOP;
			end if;
		end if;
		
		if scl_high_ena = '1' then
			if sda /= '0' then
				ack_error_i <= '1';
			else 
				ack_error_i <= '0';
			end if;
		end if;
		
	when sREAD =>
		busy <= '1';
		sda_i <= '1';
		if scl_high_ena = '1' then
			data_rx(bit_cnt) <= sda;
		end if;
		
		if state_ena = '1' then
			if bit_cnt = 0 then
				bit_cnt <= 7;
				data_rd <= data_rx;
				state <= sMACK;
			else 
				bit_cnt <= bit_cnt - 1;
			end if;
		end if;	
		
		
		
	when sMACK =>
		sda_i <= '1';
		busy <= '0';
		
	if state_ena = '1' then
		if valid = '1' then
			if rnw = '0' then
				data_tx <= data_wr;
				addr_rnw_i <= addr & rnw;
				state <= sSTART;
			else 
				state <= sREAD;
			end if;
		end if;
	end if;
					
	if valid = '1' then
		sda_i <= '0';
	elsif valid = '0' and state_ena = '1' then
		sda_i <= '0';
		state <= sSTOP;	
	end if;
					
		
	when sSTOP =>
		busy <= '1';
		if scl_high_ena = '1' then
			sda_i <=  '1';
		end if;
		if state_ena = '1' then
			state <= sIDLE;
		end if;
	when others =>
		state <= sIDLE;
end case;
end if;
end process p_state;

scl <= '0' when scl_clk = '0' and scl_oe = '1' else 'Z';
scl_oe <= '1' when state /= sIDLE else '0';
sda <= 'Z' when sda_i = '1' else '0';

end i2c_master_arc;