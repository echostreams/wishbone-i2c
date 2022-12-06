-- micro_tb.vhd
--
-- Created: 6/3/99 ALS
--	This file emulates the uC that interfaces to the I2C design. This testbench
--	will interface to two instantiations of the I2C design, one will be configured as 
--	a master, the other as a slave.
-- Revised: 6/8/99 ALS
--	Added a read of the status register at the end of the cycle
-- Revised: 6/11/99 ALS
--	Added code to have the slave transmit and the master receive the data words
-- Revised:	6/29/00 ALS
--	Added code to test repeated start

library IEEE;
use IEEE.std_logic_1164.all;

entity micro_tb is
   port (

	-- inputs
	dtack		: in		std_logic;
	irq		: in		std_logic;

	mcf		: in		std_logic;	-- indicates that I2C data transfer is complete

	-- outputs
	as		: out		std_logic;
	ds		: out		std_logic;
	r_w		: out		std_logic;
	address	: out	std_logic_vector(23 downto 0);
	
	reset		: inout		std_logic;
	clk		: inout		std_logic;

	data_match	: out		std_logic;

	
	-- bi-direct
	data_bus	: inout	std_logic_vector(7 downto 0)
     
       );

end micro_tb;

architecture RTL of micro_tb is

-- ************************************* Constant Declarations **************************
constant RESET_ACTIVE : STD_LOGIC := '0';
constant CLK_PERIOD   : time := 500 nS;


-- register addresses
constant MASTR_MBASE	: STD_LOGIC_VECTOR(15 downto 0) := "0000000000001111"; -- Base Address (addr_bus[23:8])
constant SLAVE_MBASE	: STD_LOGIC_VECTOR(15 downto 0) := "0000000000001101"; -- Base Address (addr_bus[23:8])
constant MADR_ADDR 	: STD_LOGIC_VECTOR(7 downto 0) := "10001101"; -- Address Register (MBASE + 141h)
constant MFDR_ADDR 	: STD_LOGIC_VECTOR(7 downto 0) := "10001111"; -- Frequency Divider Register (MBASE + 143h)
constant MBCR_ADDR 	: STD_LOGIC_VECTOR(7 downto 0) := "10010001"; -- Control Register (MBASE + 145h)
constant MBSR_ADDR 	: STD_LOGIC_VECTOR(7 downto 0) := "10010011"; -- Status Register (MBASE + 147h)
constant MBDR_ADDR 	: STD_LOGIC_VECTOR(7 downto 0) := "10010101"; -- Data I/O Register (MBASE + 149h)

-- data words
constant ALL_ONES	  : std_logic_vector(7 downto 0) := "11111111";
constant ALL_ZEROS  : std_logic_vector(7 downto 0) := "00000000";
constant MASTR_ADDR : std_logic_vector(7 downto 0) := "11110000";
constant SLAVE_ADDR : std_logic_vector(7 downto 0) := "00001110";
constant MASTR_MBCR_TX : std_logic_vector(7 downto 0) := "11010000";
constant MASTR_MBCR_RX : std_logic_vector(7 downto 0) := "11000000";
constant MASTR_MBCR_RX_REPEAT : std_logic_vector(7 downto 0) := "11100000";
constant SLAVE_MBCR : std_logic_vector(7 downto 0) := "11000000";
constant START_TX	  : std_logic_vector(7 downto 0) := "11110000";
constant START_RX	  : std_logic_vector(7 downto 0) := "11100000";
constant REPEAT_START_RX	  : std_logic_vector(7 downto 0) := "11100100";
constant NO_ACK	  : std_logic_vector(7 downto 0) := "11101000";
constant STOP_TX	  : std_logic_vector(7 downto 0) := "11010000";
constant STOP_RX	  : std_logic_vector(7 downto 0) := "11001000";
constant MFDR	  : std_logic_vector(7 downto 0) := "00000001";
constant TST_ADDR_OUT_HEADER : std_logic_vector(7 downto 0) := "00001110";
constant MASTR_RD_HEADER : std_logic_vector(7 downto 0) := "00001111";
constant DE		  : std_logic_vector(7 downto 0) := "11011110";
constant AD		  : std_logic_vector(7 downto 0) := "10101101";
constant BE		  : std_logic_vector(7 downto 0) := "10111110";
constant EF		  : std_logic_vector(7 downto 0) := "11101111";
constant FA		  : std_logic_vector(7 downto 0) := "11111010";
constant CE		  : std_logic_vector(7 downto 0) := "11001110";

-- number of words in the data packet
constant LAST_WORD	: integer := 4;

constant LOGIC_DELAY	: time := 4 nS;

-- test data
type TEST_DATA is array (0 to 44) of std_logic_vector (7 downto 0);

constant TST_DATA_OUT : TEST_DATA := (
						(MASTR_ADDR),	-- write master's I2C address
						(SLAVE_ADDR),	-- write slave's I2C address
						(MASTR_MBCR_TX),	-- enable the master to transmit
						(SLAVE_MBCR),	-- enable the slave
						(TST_ADDR_OUT_HEADER), -- write the header
						(START_TX),		-- generate START
						(DE),			-- write the data to the Master
						(AD),
						(BE),
						(EF),
						(FA),
						(DE),
						(STOP_TX),
						(ALL_ONES),
						(ALL_ONES),
						(ALL_ONES),		-- dummy for status register read
						(MASTR_MBCR_RX),	-- enable the master to receive
						(MASTR_RD_HEADER), -- write the header with slave to transmit
						(START_RX),		-- generate START
						(DE),			-- write the data to the slave
						(AD),
						(BE),
						(EF),
						(FA),			
						(DE),
						(NO_ACK),		-- turn off Master's acknowledge to end cycle
						(STOP_RX),		-- generate STOP
					--beginning of repeat start test 
						(ALL_ONES),
						(ALL_ONES),
						(ALL_ONES),		-- dummy for status register read
						(MASTR_MBCR_TX),	-- enable the master to transmit
						(TST_ADDR_OUT_HEADER), -- write the header
						(START_TX),		-- generate START
						(BE),			-- write the data to the Master
						(MASTR_MBCR_RX_REPEAT),	-- enable the master to receive
						(MASTR_RD_HEADER), -- write the header with slave to transmit
						(REPEAT_START_RX),	-- generate repeated START
						(AD),			-- write the data to the slave
						(BE),
						(EF),
						(FA),			
						(DE),
						(AD),
						(NO_ACK),		-- turn off Master's acknowledge to end cycle
						(STOP_RX)		-- generate STOP
						);


 type TEST_ADDR is array (0 to 44) of std_logic_vector( 23 downto 0);

 -- VHDL_VERSION >= "2008"

 --constant TST_ADDR_OUT : TEST_ADDR := (
 --   0 => (MASTR_MBASE & MADR_ADDR),
 --   others => "000000000000000000000000"
 --);

 -- VHDL'93
 constant TST_ADDR_OUT : TEST_ADDR := (
						0 => (MASTR_MBASE & MADR_ADDR), -- write master's I2C address
						1 => (SLAVE_MBASE & MADR_ADDR), -- write slave's I2C address
						2 => (MASTR_MBASE & MBCR_ADDR), -- enable the master to transmit
						3 => (SLAVE_MBASE & MBCR_ADDR), -- enable the slave
						4 => (MASTR_MBASE & MBDR_ADDR), -- write the i2c header
						5 => (MASTR_MBASE & MBCR_ADDR), -- generate start
						6 => (MASTR_MBASE & MBDR_ADDR), -- write the data
						7 => (MASTR_MBASE & MBDR_ADDR), -- write the data
						8 => (MASTR_MBASE & MBDR_ADDR), -- write the data
						9 => (MASTR_MBASE & MBDR_ADDR), -- write the data
						10=> (MASTR_MBASE & MBDR_ADDR), -- write the data
						11=> (MASTR_MBASE & MBDR_ADDR), -- write the data
						12=> (MASTR_MBASE & MBCR_ADDR),  -- generate stop
						13=> (MASTR_MBASE & MBSR_ADDR),  -- read Master's status register
						14=> (SLAVE_MBASE & MBSR_ADDR),   -- read Slave's status register
						15=> (MASTR_MBASE & MADR_ADDR),  -- read Master's address register
						16=> (MASTR_MBASE & MBCR_ADDR),  -- enable Master to receive
						17=> (MASTR_MBASE & MBDR_ADDR),  -- write the header for slave to transmit
						18=> (MASTR_MBASE & MBCR_ADDR),  -- generate START
						19=> (SLAVE_MBASE & MBDR_ADDR),  -- write data to the slave
						20=> (SLAVE_MBASE & MBDR_ADDR),  
						21=> (SLAVE_MBASE & MBDR_ADDR),
						22=> (SLAVE_MBASE & MBDR_ADDR),  
						23=> (SLAVE_MBASE & MBDR_ADDR),  
						24=> (SLAVE_MBASE & MBDR_ADDR),  	-- write last data word
						25=> (MASTR_MBASE & MBCR_ADDR), 	-- turn off Master's ACK
						26=> (MASTR_MBASE & MBCR_ADDR),	-- generate STOP 
					--beginning of repeat start test 
						27=> (MASTR_MBASE & MBSR_ADDR),  -- read Master's status register
						28=> (SLAVE_MBASE & MBSR_ADDR),   -- read Slave's status register
						29=> (MASTR_MBASE & MADR_ADDR),  -- read Master's address register
						30=> (MASTR_MBASE & MBCR_ADDR),  -- enable Master to transmit
						31=> (MASTR_MBASE & MBDR_ADDR),  -- write the header with slave's address
						32=> (MASTR_MBASE & MBCR_ADDR),  -- generate START
						33=> (MASTR_MBASE & MBDR_ADDR),  -- write data to the master
						34=> (MASTR_MBASE & MBCR_ADDR),  -- enable Master to receive
						35=> (MASTR_MBASE & MBDR_ADDR),  -- write the header with slave's address
						36=> (MASTR_MBASE & MBCR_ADDR),  -- generate repeated START
						37=> (SLAVE_MBASE & MBDR_ADDR),  -- write data to the slave
						38=> (SLAVE_MBASE & MBDR_ADDR),  
						39=> (SLAVE_MBASE & MBDR_ADDR),
						40=> (SLAVE_MBASE & MBDR_ADDR),  
						41=> (SLAVE_MBASE & MBDR_ADDR),  
						42=> (SLAVE_MBASE & MBDR_ADDR),  	-- write last data word
						43=> (MASTR_MBASE & MBCR_ADDR), 	-- turn off Master's ACK
						44=> (MASTR_MBASE & MBCR_ADDR)	-- generate STOP  
						);


-- Declare state names for target state machine
type STATE_TYPE is (IDLE, WAIT_DTACK, DATA_TRS);

-- Signal Declarations
signal state, next_state : STATE_TYPE; 
signal data_out,data_in		: std_logic_vector(7 downto 0);
signal write			: std_logic;	-- write signal
signal go, done			: std_logic;	-- handshake signals to  state machine
signal cycle			: integer;		-- index into data and address array

   
begin

   -- Define the bi-directional data bus 
   -- use pulldowns when tri-stated
   data_bus <= data_out when write = '1' 
		else (others => 'L');

   -- Define the read_write line
   r_w <= not(write);


-- ************************************ Clock Process *************************************
-- Process:  CREATE_CLK
-- Function:  Create 2Mhz clock
CREATE_CLK: process
	begin
	      clk <= '0';
		wait for CLK_PERIOD/2;
		clk <= '1';
		wait for CLK_PERIOD/2;

	end process;


-- *********************************** Main Control Process *********************************
-- define the main controlling process that triggers the state machines
   main : process
   
   variable i	: integer := 0;

   begin
		-- initialize control signals
		cycle <= 0;
		go <= '0';
		write <= '0';

		-- assert RESET for two clocks
		reset <= RESET_ACTIVE;
		wait until clk'event and clk = '1';
		wait until clk'event and clk = '1';
		reset <= not(RESET_ACTIVE);

		-- start the process to have the Master transmit data
		-- First have to call the state machine to write registers
		-- in both master and slave devices, then write to the Master
		-- control register to generate the START signal
		-- Then write data to the Master's MBCR_MICRO register. Use the signal MCF to determine
		-- when a data transfer is complete

		-- the cycle signal will index the state machines to the right address and data 
		-- to be output - The loop below writes the registers, sets the I2C header and 
		-- generates the START  signal
		write <= '1';
		for i in 0 to 5 loop
			cycle <= i;
			go <= '1';
			wait until clk'event and clk ='1';
			wait until clk'event and clk = '1';
			go <= '0';
			wait until done = '1';
		end loop;

		-- wait for MCF to indicate that transfer is complete
		-- then write data to to Masters data register for transfer over I2C
		for i in 1 to 6 loop
			cycle <= cycle + 1;
			wait until mcf = '1';
			go <= '1';
			wait until clk'event and clk = '1';
			wait until clk'event and clk = '1';
			go <= '0';
			wait until done = '1';
		end loop;

		-- generate stop once tranfer is complete
		cycle <= cycle + 1;
		wait until mcf = '1';		
		go <= '1';
		wait until clk'event and clk = '1';
		wait until clk'event and clk = '1';
		go <= '0';
		wait until done = '1';

		-- now read the status registers
		write <= '0';
		for i in 0 to 2 loop
			cycle <= cycle + 1;
			go <= '1';
			wait until clk'event and clk = '1';
			wait until clk'event and clk = '1';
			go <= '0';
			wait until done = '1';
		end loop;

		-- The loop below writes the registers, sets the I2C header and 
		-- generates the START  signal for a slave transmit/master receive cycle
		write <= '1';
		for i in 0 to 2 loop
			cycle <= cycle + 1;
			go <= '1';
			wait until clk'event and clk ='1';
			wait until clk'event and clk = '1';
			go <= '0';
			wait until done = '1';
		end loop;
		
		-- wait for MCF to indicate that transfer is complete
		-- then write data to to slave's data register for transfer over I2C
		for i in 1 to 6 loop
			cycle <= cycle + 1;
			wait until mcf = '1';
			go <= '1';
			wait until clk'event and clk = '1';
			wait until clk'event and clk = '1';
			go <= '0';
			wait until done = '1';
		end loop;

		-- turn off Master's ACK 
		-- wait for MCF to negate again to insure no longer in ACK state
		wait until mcf = '0';
		cycle <= cycle + 1;		
		go <= '1';
		wait until clk'event and clk = '1';
		wait until clk'event and clk = '1';
		go <= '0';
		wait until done = '1';
		
		-- generate STOP
		cycle <= cycle + 1;
		wait until mcf = '1';		
		go <= '1';
		wait until clk'event and clk = '1';
		wait until clk'event and clk = '1';
		go <= '0';
		wait until done = '1';

-- Beginning of Repeated START test

		-- now read the status registers
		write <= '0';
		for i in 0 to 2 loop
			cycle <= cycle + 1;
			go <= '1';
			wait until clk'event and clk = '1';
			wait until clk'event and clk = '1';
			go <= '0';
			wait until done = '1';
		end loop;


		-- The loop below writes the registers, sets the SMBUS header and 
		-- generates the START  signal for a master transmit/slave receive cycle
		write <= '1';
		for i in 0 to 2 loop
			cycle <= cycle + 1;
			go <= '1';
			wait until clk'event and clk ='1';
			wait until clk'event and clk = '1';
			go <= '0';
			wait until done = '1';
		end loop;

		-- wait for MCF to indicate that transfer is complete
		-- then write one data byte to master's data register for transfer over SMBUS
		cycle <= cycle + 1;
		wait until mcf = '1';
		go <= '1';
		wait until clk'event and clk = '1';
		wait until clk'event and clk = '1';
		go <= '0';
		wait until done = '1';

		-- wait for MCF to indicate that transfer is complete
		-- then set the SMBUS header indicating slave read and 
		-- generates the REPEATED START  signal for a slave transmit/master receive cycle
		wait until mcf = '1';
		for i in 0 to 2 loop
			cycle <= cycle + 1;
			go <= '1';
			wait until clk'event and clk = '1';
			wait until clk'event and clk = '1';
			go <= '0';
			wait until done = '1';
		end loop;

		-- wait for MCF to indicate that transfer is complete
		-- then write data to to slave's data register for transfer over SMBUS
		for i in 1 to 6 loop
			cycle <= cycle + 1;
			wait until mcf = '1';
			go <= '1';
			wait until clk'event and clk = '1';
			wait until clk'event and clk = '1';
			go <= '0';
			wait until done = '1';
		end loop;

		-- turn off Master's ACK 
		-- wait for MCF to negate again to insure no longer in ACK state
		wait until mcf = '0';
		cycle <= cycle + 1;		
		go <= '1';
		wait until clk'event and clk = '1';
		wait until clk'event and clk = '1';
		go <= '0';
		wait until done = '1';
		
		-- generate STOP
		cycle <= cycle + 1;
		wait until mcf = '1';		
		go <= '1';
		wait until clk'event and clk = '1';
		wait until clk'event and clk = '1';
		go <= '0';
		wait until done = '1';



wait;

end process;

-- *********************************** Write State Machine Processes *********************************

   -- Define the synchronous process of the state machines
   -- the outputs get the value from the state machine that is active
ffs: process(reset, clk)
  begin
	if reset = RESET_ACTIVE then
		state <= IDLE;
		
	elsif clk'event and (clk = '1') then
		state <= next_state;
			
	end if;

 end process;


--  Synthesize uProc write protocol
	write_sm: process(state, dtack, go)
begin

	next_state <= state;
	done <= '1';
	
	case state is

	         -------------- IDLE State -----------------
	         when IDLE =>

		        address <= (others => '0');
			  data_out <= (others => '0');
		        as <= '1';
		        ds <= '1';
			  data_in <= (others => '0');
			
			  if go = '1' then
		        	next_state <= WAIT_DTACK;
				address <= TST_ADDR_OUT(cycle);
				if write = '1' then
					data_out <= TST_DATA_OUT(cycle);
				end if;
				done <= '0';
			  else
				next_state <= IDLE;
			  end if;

		 ----------- WAIT_DTACK State --------------
	         when WAIT_DTACK =>
			
		      as <= '0';
			ds <= '0';
			address <= TST_ADDR_OUT(cycle);
			if write = '1' then
				data_out <= TST_DATA_OUT(cycle);
			end if;	
			done <= '0';
			
			-- Wait for assertion on dtack
			if dtack /= '0' then
			        next_state <= WAIT_DTACK;

			-- When dtack is asserted, transfer data
			else
			        next_state <= DATA_TRS;
		     
			end if;


		 ------------ DATA_TRS State ---------------
	         when DATA_TRS =>

		        as <= '1';
			  ds <= '1';
			  address <= TST_ADDR_OUT(cycle);
			  if write = '1' then 
			  	data_out <= TST_DATA_OUT(cycle);
			  else
				data_in <= data_bus;
			  end if;	
		        done <= '0';			
			
                        -- Wait for de-assertion of dtack
			if dtack = '0' then
			  next_state <= DATA_TRS;
			else
			  next_state <= IDLE;
			end if;
	   
	         end case;
	
	end process;

end RTL;
