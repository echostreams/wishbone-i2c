-- C:\CNT4\UPCNT4_TB.VHD
-- VHDL Test Bench created by
-- Visual Software Solution's HDL Bencher 1.02.x4
-- Product info/updates: www.testbench.com
-- Support: support@testbench.com
-- Sales: sales@testbench.com / call (954) 370-9030
-- Mon Mar 13 08:12:06 2000

LIBRARY  IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_arith.all;

LIBRARY ieee;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE testbench_arch OF testbench IS
-- If you get a compiler error on the following line,
-- from the menu do Options->Configuration select VHDL 93
FILE RESULTS: TEXT IS OUT "results.txt";
	COMPONENT upcnt4
		PORT (
			data : in  STD_LOGIC_VECTOR (3 DOWNTO 0);
			cnt_en : in  STD_LOGIC;
			load : in  STD_LOGIC;
			clr : in  STD_LOGIC;
			clk : in  STD_LOGIC;
			qout : inout  STD_LOGIC_VECTOR (3 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL data : STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL cnt_en : STD_LOGIC;
	SIGNAL load : STD_LOGIC;
	SIGNAL clr : STD_LOGIC;
	SIGNAL clk : STD_LOGIC;
	SIGNAL qout : STD_LOGIC_VECTOR (3 DOWNTO 0);

BEGIN
	UUT : upcnt4
	PORT MAP (
		data => data,
		cnt_en => cnt_en,
		load => load,
		clr => clr,
		clk => clk,
		qout => qout
	);

	PROCESS
		VARIABLE TX_OUT : LINE;
		VARIABLE TX_ERROR : INTEGER := 0;

		PROCEDURE CHECK_qout(
			next_qout : STD_LOGIC_VECTOR (3 DOWNTO 0);
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 512);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (qout /= next_qout) THEN 
				write(TX_LOC,string'("Error at time="));
				write(TX_LOC, TX_TIME);
				write(TX_LOC,string'("ns qout="));
				write(TX_LOC, qout);
				write(TX_LOC, string'(", Expected = "));
				write(TX_LOC, next_qout);
				write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				writeline(results, TX_LOC);
				Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		BEGIN
		-- --------------------
		clk <= transport '0';
		data <= transport STD_LOGIC_VECTOR'("1110"); --E
		cnt_en <= transport '0';
		load <= transport '0';
		clr <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=100 ns
		-- --------------------
		WAIT FOR 5 ns; -- Time=105 ns
		clk <= transport '1';
		-- --------------------
		WAIT FOR 5 ns; -- Time=110 ns
		-- --------------------
		WAIT FOR 15 ns; -- Time=125 ns
		clk <= transport '0';
		-- --------------------
		WAIT FOR 10 ns; -- Time=135 ns
		data <= transport STD_LOGIC_VECTOR'("1110"); --E
		cnt_en <= transport '1';
		-- --------------------
		WAIT FOR 10 ns; -- Time=145 ns
		clk <= transport '1';
		-- --------------------
		WAIT FOR 5 ns; -- Time=150 ns
		CHECK_qout("0000",50); --0
		-- --------------------
		WAIT FOR 15 ns; -- Time=165 ns
		clk <= transport '0';
		-- --------------------
		WAIT FOR 10 ns; -- Time=175 ns
		clr <= transport '1';
		-- --------------------
		WAIT FOR 10 ns; -- Time=185 ns
		clk <= transport '1';
		-- --------------------
		WAIT FOR 5 ns; -- Time=190 ns
		CHECK_qout("0001",90); --1
		-- --------------------
		WAIT FOR 15 ns; -- Time=205 ns
		clk <= transport '0';
		-- --------------------
		WAIT FOR 15 ns; -- Time=220 ns
		-- --------------------
		WAIT FOR 5 ns; -- Time=225 ns
		clk <= transport '1';
		-- --------------------
		WAIT FOR 5 ns; -- Time=230 ns
		CHECK_qout("0010",130); --2
		-- --------------------
		WAIT FOR 15 ns; -- Time=245 ns
		clk <= transport '0';
		-- --------------------
		WAIT FOR 15 ns; -- Time=260 ns
		load <= transport '1';
		-- --------------------
		WAIT FOR 5 ns; -- Time=265 ns
		clk <= transport '1';
		-- --------------------
		WAIT FOR 5 ns; -- Time=270 ns
		CHECK_qout("1110",170); --E
		-- --------------------
		WAIT FOR 15 ns; -- Time=285 ns
		clk <= transport '0';
		-- --------------------
		WAIT FOR 15 ns; -- Time=300 ns
		load <= transport '0';
		-- --------------------
		WAIT FOR 5 ns; -- Time=305 ns
		clk <= transport '1';
		-- --------------------
		WAIT FOR 5 ns; -- Time=310 ns
		CHECK_qout("1111",210); --F
		-- --------------------
		WAIT FOR 15 ns; -- Time=325 ns
		clk <= transport '0';
		-- --------------------
		WAIT FOR 15 ns; -- Time=340 ns
		-- --------------------
		WAIT FOR 5 ns; -- Time=345 ns
		clk <= transport '1';
		-- --------------------
		WAIT FOR 5 ns; -- Time=350 ns
		CHECK_qout("0000",250); --0
		-- --------------------
		WAIT FOR 15 ns; -- Time=365 ns
		-- --------------------

		IF (TX_ERROR = 0) THEN 
			write(TX_OUT,string'("No errors or warnings"));
			writeline(results, TX_OUT);
			ASSERT (FALSE) REPORT
				"Simulation successful.  No problems detected."
				SEVERITY NOTE;
		ELSE
			write(TX_OUT, TX_ERROR);
			write(TX_OUT, string'(
				" errors found in simulation"));
			writeline(results, TX_OUT);
			ASSERT (FALSE) REPORT
				"Errors found during simulation"
				SEVERITY FAILURE;
		END IF;
	END PROCESS;
END testbench_arch;

CONFIGURATION upcnt4_cfg OF testbench IS
	FOR testbench_arch
	END FOR;
END upcnt4_cfg;

