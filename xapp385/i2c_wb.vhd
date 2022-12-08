library IEEE;
use IEEE.std_logic_1164.all;

entity i2c_wb is
    generic (
        I2C_ADDRESS: std_logic_vector(15 downto 0):= "0000000000000000";
        ADR_WIDTH   : positive :=  24; -- Determines the size of the RAM (num. of words = 2**ADR_WIDTH)
        DAT_WIDTH   : positive :=  8;  -- Must be a multiple of GRANULARITY
        GRANULARITY : positive :=  8   -- Usually 8 (for byte granularity)
        );
    port (
        -- I2C bus signals
        sda	    : inout	std_logic;		
		scl	    : inout	std_logic; 
        irq		: out	std_logic;	-- interrupt request		
		mcf		: inout	std_logic;  -- temporary output for testing 

        -- Wishbone SLAVE signals.
        i_adr   : in    std_logic_vector(ADR_WIDTH-1 downto 0);
        i_dat   : in    std_logic_vector(DAT_WIDTH-1 downto 0);
        i_we    : in    std_logic;
        i_sel   : in    std_logic_vector(DAT_WIDTH/GRANULARITY-1 downto 0);
        i_cyc   : in    std_logic;
        i_stb   : in    std_logic;
        o_dat   : out   std_logic_vector(DAT_WIDTH-1 downto 0);
        o_ack   : out   std_logic;
        o_stall : out   std_logic;
        o_rty   : out   std_logic;
        o_err   : out   std_logic;


		-- clock and reset
		clk		: in	std_logic;
		reset	: in	std_logic
    );
end i2c_wb;

architecture behave of i2c_wb is

component i2c
  generic (
        I2C_ADDRESS	: std_logic_vector(15 downto 0):= "0000000000000000" 
        );
  port (
		-- I2C bus signals
		sda	        : inout	std_logic;		
		scl	        : inout	std_logic;

		-- uC interface signals
		addr_bus	: in	std_logic_vector(23 downto 0);
		data_bus	: inout	std_logic_vector(7 downto 0);
		as		    : in	std_logic;	-- address strobe, active low
		ds		    : in	std_logic;	-- data strobe, active low
		r_w		    : in	std_logic;	-- read/write
		dtack	    : out	std_logic;	-- data transfer acknowledge
		irq		    : out	std_logic;	-- interrupt request
		
		mcf		    : inout	std_logic;  -- temporary output for testing 


		-- clock and reset
		clk		    : in	std_logic;
		reset		: in	std_logic
	);
end component;
		
-- uC interface signals
signal i_addr_bus	: std_logic_vector(23 downto 0);
signal io_data_bus	: std_logic_vector(7 downto 0);
signal i_as		    : std_logic;	-- address strobe, active low
signal i_ds		    : std_logic;	-- data strobe, active low
signal i_r_w	    : std_logic;	-- read/write
signal o_dtack	    : std_logic;	-- data transfer acknowledge
signal io_mcf	    : std_logic;    -- temporary output for testing 

-- Base Address for I2C Module (addr_bus[23:8])
constant MBASE	: STD_LOGIC_VECTOR(15 downto 0) := I2C_ADDRESS;

begin

    i2c_core : i2c
  	generic map (
        I2C_ADDRESS => I2C_ADDRESS
  	)
  	port map (
  		reset       => reset,
  		clk         => clk,
        sda         => sda,
        scl         => scl,
        addr_bus    => i_addr_bus,
		data_bus    => io_data_bus,
		as		    => i_as,
		ds		    => i_ds,
		r_w		    => i_r_w,
		dtack	    => o_dtack,
		irq		    => irq,		
		mcf		    => io_mcf  		
  	);

    process(reset, clk)
    begin
        if reset = '1' then
            o_dat <= (others => '0');
            o_ack <= '0';
        elsif rising_edge(clk) then
    
          -- Get the address.
          if i_adr(23 downto 8) = MBASE then

            o_ack <= o_dtack;

            -- Write?
            if i_cyc = '1' and i_stb = '1' and i_we = '1' then
            
              i_addr_bus <= i_adr;
              io_data_bus <= i_dat;
              i_r_w <= '0'; -- '0' indicates a write
              i_as <= '0';
              i_ds <= '0';
              --  s_mem(k)(v_adr) <= i_dat(GRANULARITY*(k+1)-1 downto GRANULARITY*k);
              --  report "Write " &
              --    to_hstring(i_dat(GRANULARITY*(k+1)-1 downto GRANULARITY*k)) & "h" &
              --    " to v_adr=" & integer'image(v_adr) &
              --    ", k=" & integer'image(k);
              
            end if;
    
            -- read?
            if i_cyc = '1' and i_stb = '1' then
                i_addr_bus <= i_adr;                
              -- o_dat(GRANULARITY*(k+1)-1 downto GRANULARITY*k) <= s_mem(k)(v_adr);
                o_dat <= io_data_bus;
            end if;
          
            -- Ack that we have dealt with the request.
            o_ack <= i_cyc and i_stb;
            end if;
        end if;
      end process;

end behave;