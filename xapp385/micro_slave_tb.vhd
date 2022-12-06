-- micro_slave_tb.vhd
--
-- Created: 6/3/99 ALS
--	This file emulates the uC that interfaces to the I2C design. This testbench
--	will interface to an instantiation of the I2C design and configure this design as 
--	a slave.
-- Revised:  12-12-02 JRH

library IEEE;
use IEEE.std_logic_1164.all;

entity micro_slave_tb is
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

end micro_slave_tb;

architecture RTL of micro_slave_tb is

-- ************************************* Constant Declarations **************************
constant RESET_ACTIVE : STD_LOGIC := '0';
constant CLK_PERIOD   : time := 500 nS;


-- register addresses
constant SLAVE_MBASE	: STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000"; -- Base Address (addr_bus[23:8])
constant MADR_ADDR 	: STD_LOGIC_VECTOR(7 downto 0) := "10001101"; -- Address Register (MBASE + 141h)
constant MBCR_ADDR 	: STD_LOGIC_VECTOR(7 downto 0) := "10010001"; -- Control Register (MBASE + 145h)
constant MBSR_ADDR 	: STD_LOGIC_VECTOR(7 downto 0) := "10010011"; -- Status Register (MBASE + 147h)
constant MBDR_ADDR 	: STD_LOGIC_VECTOR(7 downto 0) := "10010101"; -- Data I/O Register (MBASE + 149h)

-- data words
constant ALL_ONES	  : std_logic_vector(7 downto 0) := "11111111";
constant ALL_ZEROS  : std_logic_vector(7 downto 0) := "00000000";
constant SLAVE_ADDR : std_logic_vector(7 downto 0) := "00001110";
constant SLAVE_MBCR : std_logic_vector(7 downto 0) := "11000000";
constant DE		  : std_logic_vector(7 downto 0) := "11011110";
constant AD		  : std_logic_vector(7 downto 0) := "10101101";
constant BE		  : std_logic_vector(7 downto 0) := "10111110";
constant EF		  : std_logic_vector(7 downto 0) := "11101111";
constant FA		  : std_logic_vector(7 downto 0) := "11111010";
constant CE		  : std_logic_vector(7 downto 0) := "11001110";

constant LOGIC_DELAY	: time := 4 nS;

-- test data
type TEST_DATA is array (0 to 14) of std_logic_vector (7 downto 0);

constant TST_DATA_OUT : TEST_DATA := (
						(SLAVE_ADDR),	-- write slave's I2C address
						(SLAVE_MBCR),	-- enable the slave
						(ALL_ONES),		-- dummy for status register read
						(DE),			-- write the data to the slave
						(AD),
						(BE),
						(EF),
						(FA),			
						(DE),
					--beginning of repeat start test 
						(AD),			-- write the data to the slave
						(BE),
						(EF),
						(FA),			
						(DE),
						(AD)
						);


 type TEST_ADDR is array (0 to 14) of std_logic_vector( 23 downto 0);

 constant TST_ADDR_OUT : TEST_ADDR := (
						(SLAVE_MBASE & MADR_ADDR), -- write slave's I2C address
						(SLAVE_MBASE & MBCR_ADDR), -- enable the slave
						(SLAVE_MBASE & MBSR_ADDR),   -- read Slave's status register
						(SLAVE_MBASE & MBDR_ADDR),  -- write data to the slave
						(SLAVE_MBASE & MBDR_ADDR),  
						(SLAVE_MBASE & MBDR_ADDR),
						(SLAVE_MBASE & MBDR_ADDR),  
						(SLAVE_MBASE & MBDR_ADDR),  
						(SLAVE_MBASE & MBDR_ADDR),  	-- write last data word
					--beginning of repeat start test 
						(SLAVE_MBASE & MBDR_ADDR),  -- write data to the slave
						(SLAVE_MBASE & MBDR_ADDR),  
						(SLAVE_MBASE & MBDR_ADDR),
						(SLAVE_MBASE & MBDR_ADDR),  
						(SLAVE_MBASE & MBDR_ADDR),  
						(SLAVE_MBASE & MBDR_ADDR)  	-- write last data word 						
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
-- Function:  Create 200 ns clock
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

		-- The loop below writes the slave's I2C address and enables the slave 
		write <= '1';
		for i in 0 to 1 loop	
			cycle <= i;	-- cycle = 0 - 1
			go <= '1';
			wait until clk'event and clk ='1';
			wait until clk'event and clk = '1';
			go <= '0';
			wait until done = '1';
		end loop;

		-- wait for MCF to indicate that transfer of the header and the data is complete
		-- this loop counts Master data word transfers
		for i in 1 to 7 loop
			wait until mcf'event and mcf = '1';
		end loop;

		-- now read the status register
		write <= '0';
		cycle <= cycle + 1;	-- cycle = 2
		go <= '1';
		wait until clk'event and clk = '1';
		wait until clk'event and clk = '1';
		go <= '0';
		wait until done = '1';

		
		-- wait for MCF to indicate that transfer of the header is complete
		-- then write data to to slave's data register for transfer over I2C
		wait until mcf'event and mcf = '1'; 
		write <= '1';
		for i in 1 to 6 loop
			cycle <= cycle + 1;	-- cycle = 3 - 8
			wait until mcf'event and mcf = '1';
			go <= '1';
			wait until clk'event and clk = '1';
			wait until clk'event and clk = '1';
			go <= '0';
			wait until done = '1';
		end loop;
		
		-- beginning of repeated start test
		-- wait for MCF to indicate that transfer of the header is complete
		-- then wait for another MCF to indicate that the Master data transfer is complete
		-- Master will then generate a repeated start and transfer a new header, wait
		-- for one more MCF to indicate that the transfer of this header is complete
		for i in 1 to 3 loop
			wait until mcf'event and mcf = '1';
		end loop;
		
		-- now write data to to slave's data register for transfer over I2C
		write <= '1';
		for i in 1 to 6 loop
			cycle <= cycle + 1;	-- cycle = 9 - 14
			wait until mcf'event and mcf = '1';
			go <= '1';
			wait until clk'event and clk = '1';
			wait until clk'event and clk = '1';
			go <= '0';
			wait until done = '1';
		end loop;
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
		        as <= '1' after 5 ns;
		        ds <= '1' after 5 ns;
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
			
		      as <= '0' after 5 ns;
			ds <= '0' after 5 ns;
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

		        as <= '1' after 5 ns;
			  ds <= '1' after 5 ns;
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
