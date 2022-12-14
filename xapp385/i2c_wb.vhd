-- i2c.vhd
--
-- Created: 6/3/99 ALS
--
--	This code implements the control of the i2c bus with a MC68000 type interface. It is 
--	modeled from the M-bus component in certain Motorola uC.
--	The I2C control is done in the component i2c_control and the uC interface is implemented
--	in the component uC_interface. This file does not contain any logic descriptions, it simply
--	instantiates the two components and hooks them together.
--
-- Revised: 6/9/99 ALS
--	Removed MFDR since this design will only run at 100KHz.
--
-- Revised: 6/15/99 ALS
--	To insure that SCL_IN uses a global clock network, it will be assigned to a pin. Made the necessary
--	changes to the component I2C_CONTROL and to I2C.
--
-- Revised: 7/7/99 ALS
--	Because of slaves perhaps not obeying SDA hold times, will no longer clock off delayed
--	version of SCL, instead use SCL itself. Removed SCL_CLK_OUT.
--
-- Revised: 6/29/00 ALS
--	Modified code to support repeated start

library ieee;
  use ieee.std_logic_1164.all;

library work;
  use work.wishbone_types.all;


entity i2c_wb is 
  generic (I2C_ADDRESS	: std_logic_vector(15 downto 0):= "0000000000000000" );
  port (
		-- I2C bus signals
		sda	: inout	std_logic;		
		scl	: inout	std_logic;

		-- uC interface signals
		--addr_bus : in	 std_logic_vector(23 downto 0);
		--data_bus : inout std_logic_vector(7 downto 0);
		--as		 : in	 std_logic;	-- address strobe, active low
		--ds		 : in	 std_logic;	-- data strobe, active low
		--r_w		 : in	 std_logic;	-- read/write

		-- Wishbone ports:
		--wishbone_in  : in    wb_io_master_out;
		i_adr : in    std_logic_vector(29 downto 0); -- wishbone_addr_type;
        i_dat : in    std_logic_vector(31 downto 0); -- wishbone_data_type;
        --i_sel : in    wishbone_sel_type;
        i_cyc : in    std_ulogic;
        i_stb : in    std_ulogic;
        i_we  : in    std_ulogic;

		--wishbone_out : out   wb_io_slave_out;
		o_dat   : out   std_logic_vector(31 downto 0); -- wishbone_data_type;
        o_ack   : out   std_ulogic;
        --o_stall : out   std_ulogic;

		dtack	 : out   std_logic;	-- data transfer acknowledge
		irq		 : out   std_logic;	-- interrupt request	
		mcf		 : inout std_logic; -- temporary output for testing 


		-- clock and reset
		clk		 : in	 std_logic;
		reset	 : in    std_logic
	);
end entity i2c_wb;
		
architecture behave of i2c_wb is

-- ****************************** Component Definitions ****************************

-- Define the I2C Control logic
component i2c_control 
  port(
	-- I2C bus signals
	sda : inout std_logic;
    scl : inout std_logic;
	
	-- interface signals from uP interface
	txak		: in		std_logic;	-- value for acknowledge when xmit
	msta		: in		std_logic;	-- master/slave select
	msta_rst	: out		std_logic;	-- resets MSTA bit if arbitration is lost
	rsta		: in		std_logic;	-- repeated start 
	rsta_rst	: out		std_logic;	-- reset for repeated start bit in control register
	mtx		    : in		std_logic;	-- master read/write 
	mbdr_micro	: in		std_logic_vector(7 downto 0);	-- uP data to output on I2C bus
	madr		: in		std_logic_vector(7 downto 0); -- I2C slave address
	mbb		    : out		std_logic;	-- bus busy
	mcf		    : inout		std_logic;	-- data transfer
	maas		: inout		std_logic;	-- addressed as slave
	mal		    : inout		std_logic;	-- arbitration lost
	srw		    : inout		std_logic;	-- slave read/write
	mif		    : out		std_logic;	-- interrupt pending
	rxak		: out		std_logic;	-- received acknowledge
	mbdr_i2c	: inout		std_logic_vector(7 downto 0); -- I2C data for uP
	mbcr_wr		: in		std_logic;	-- indicates that MCBR register was written
	mif_bit_reset	: in	std_logic;	-- indicates that the MIF bit should be reset
	mal_bit_reset	: in	std_logic;	-- indicates that the MAL bit should be reset
	

    sys_clk	: in		std_logic;
	reset		: in		std_logic
  );
end component;

-- Define the wishbone interface
component wb_interface 
      generic (UC_ADDRESS : std_logic_vector(15 downto 0):= "0000000000000000" );
	port(
		-- 68000 parallel bus interface
		clk		: in std_logic;
		reset	: in std_logic;	 
		
		--addr_bus	: in std_logic_vector(23 downto 0);
		--data_bus	: inout std_logic_vector(7 downto 0);
		--as		: in STD_LOGIC;	-- Address strobe, active low	
		--ds		: in STD_LOGIC;	-- Data strobe, active low
		
		-- Directional pins
		--r_w		: in STD_LOGIC;	-- Active low write, 
							--  active high read
		-- Wishbone ports:
		 --wishbone_in  : in    wb_io_master_out;
		i_adr : in    std_logic_vector(29 downto 0); -- wishbone_addr_type;
        i_dat : in    std_logic_vector(31 downto 0); -- wishbone_data_type;
        --i_sel : in    wishbone_sel_type;
        i_cyc : in    std_ulogic;
        i_stb : in    std_ulogic;
        i_we  : in    std_ulogic;

		--wishbone_out : out   wb_io_slave_out;
		o_dat   : out   std_logic_vector(31 downto 0); -- wishbone_data_type;
        o_ack   : out   std_ulogic;
        --o_stall : out   std_ulogic;

		dtack	: out std_logic;	-- Data transfer acknowledge 
		irq		: out std_logic;	-- Interrupt request
	
		-- Internal I2C Bus Registers
		-- Address Register (Contains slave address)
		madr	      : inout std_logic_vector(7 downto 0);
   
                -- Control Register		
		men             : inout STD_LOGIC;  -- I2C Enable bit
		mien            : inout STD_LOGIC;	-- interrupt enable
		msta            : inout STD_LOGIC;	-- Master/Slave bit
		mtx             : inout STD_LOGIC;	-- Master read/write
		txak            : inout STD_LOGIC;	-- acknowledge bit
		rsta            : inout STD_LOGIC;	-- repeated start
	
		mbcr_wr         : out STD_LOGIC;	-- indicates that the control reg has been written
		rsta_rst	: in	STD_LOGIC;	-- reset for repeated start bit in control register

                -- Status Register
		mcf             : in STD_LOGIC;	-- end of data transfer
		maas            : in STD_LOGIC;	-- addressed as slave
		mbb             : in STD_LOGIC;	-- bus busy
		mal             : in STD_LOGIC;	-- arbitration lost
		srw             : in STD_LOGIC;	-- slave read/write
		mif             : in STD_LOGIC;	-- interrupt pending
		rxak            : in STD_LOGIC;	-- received acknowledge

		mal_bit_reset   : out STD_LOGIC;	-- indicates that the MAL bit should be reset
		mif_bit_reset   : out STD_LOGIC;	-- indicates that the MIF bit should be reset
		msta_rst	    : in STD_LOGIC;	-- resets the MSTA bit if arbitration is lost
		

                -- Data Register 
		mbdr_micro      : inout STD_LOGIC_VECTOR (7 downto 0);
		mbdr_i2c        : in STD_LOGIC_VECTOR (7 downto 0);

		mbdr_read       : out STD_LOGIC
		
		);
end component;

-- ****************************** Signal Declarations ****************************

-- control register
signal madr			: std_logic_vector(7 downto 0); -- I2C address
signal men			: std_logic;		-- i2c enable - used as i2c reset
signal mien			: std_logic;		-- interrupt enable
signal msta			: std_logic;		-- i2c master/slave select
signal mtx			: std_logic;		-- master read/write
signal txak			: std_logic;		-- value of acknowledge to be transmitted
signal rsta			: std_logic;		-- generate a repeated start
signal rsta_rst		: std_logic;		-- reset for repeated start bit

signal mbcr_wr		: std_logic;		-- indicates the uC has written the MBCR

-- status register
-- signal mcf		: std_logic;		-- indicates a completed data byte transfer
signal maas			: std_logic;		-- indicates the chip has been addressed as I2c slave
signal mbb			: std_logic;		-- indicates the i2c bus is busy
signal mal			: std_logic;		-- indicates that arbitration for the i2c bus is lost
signal srw			: std_logic;		-- slave read/write
signal mif			: std_logic;		-- interrupt pending
signal rxak			: std_logic;		-- value of received acknowledge

-- resets for certain status and control register bits
signal mal_bit_reset	: std_logic;		-- resets arbitration lost indicator 
signal mif_bit_reset	: std_logic;		-- resets interrupt pending bit
signal msta_rst		    : std_logic;		-- resets master/slave select when arbitration is lost

-- data registers
-- there are two data registers, one to hold the uC data when the chip is transmitting on I2C
-- and one to hold the I2C data when the chip is receiving. This allows the two registers to 
-- be clocked by different clocks
signal mbdr_micro	: std_logic_vector(7 downto 0); -- uC data register
signal mbdr_i2c		: std_logic_vector(7 downto 0); -- i2c data register

signal mbdr_read	: std_logic;		-- indicates the mbdr_i2c register has been
								-- read by the uC

begin

-- ****************************** Component Instantiations ****************************
 
-- Instantiate the I2C Controller and connect it

i2c_ctrl: i2c_control

	port map (
			-- I2C bus signals
			sda => sda,
		scl => scl,
	
			-- interface signals from uP interface
			txak		=> txak,
			msta		=> msta,
			msta_rst	=> msta_rst,
			rsta		=> rsta,
			rsta_rst	=> rsta_rst,
			mtx		    => mtx,
			mbdr_micro	=> mbdr_micro,
			madr		=> madr,
			mbb		    => mbb,
			mcf		    => mcf,
			maas		=> maas,
			mal		    => mal,
			srw		    => srw,
			mif		    => mif,
			rxak		=> rxak,
			mbdr_i2c	=> mbdr_i2c,
			mbcr_wr	    => mbcr_wr,
			mif_bit_reset => mif_bit_reset,
			mal_bit_reset => mal_bit_reset,

		sys_clk => clk,
			reset => men 
		);

-- Instantiate the uC interface and connect it
/*
wb_ctrl: wb_interface 
	generic map ( UC_ADDRESS => I2C_ADDRESS)
	port map(
		-- 68000 parallel bus interface
		clk		=> clk,
		reset		=> reset,	 
		
		--addr_bus	=> addr_bus,
		--data_bus	=> data_bus,
		--as		=> as,	
		--ds		=> ds,
		
		-- Directional pins
		--r_w		=> r_w, 
		--wishbone_in => wishbone_in,
		--wishbone_in  : in    wb_io_master_out;
		i_adr => i_adr,
        i_dat => i_dat,
        --i_sel : in    wishbone_sel_type;
        i_cyc => i_cyc,
        i_stb => i_stb,
        i_we  => i_we,

		--wishbone_out : out   wb_io_slave_out;
		--wishbone_out => wishbone_out,
		o_dat => o_dat,
        o_ack => o_ack,
        --o_stall : out   std_ulogic;
        

		dtack	=> dtack, 
		irq		=> irq,
	
		-- Internal I2C Bus Registers
		-- Address Register (Contains slave address)
		madr	=> madr,

        -- Control Register		
		men		=> men,
		mien        => mien,
		msta        => msta,
		mtx         => mtx,
		txak        => txak,
		rsta        => rsta,
	
		mbcr_wr     => mbcr_wr,
		rsta_rst    =>	rsta_rst,

        -- Status Register
		mcf             => mcf,
		maas            => maas,
		mbb             => mbb,
		mal             => mal,
		srw             => srw,
		mif             => mif,
		rxak            => rxak,

		mal_bit_reset   => mal_bit_reset,
		mif_bit_reset   => mif_bit_reset,
		msta_rst	    => msta_rst,
		

        -- Data Register 
		mbdr_micro      => mbdr_micro,
		mbdr_i2c        => mbdr_i2c,

		mbdr_read       => mbdr_read
		
		);
*/		

wb_ctrl: entity work.i2c_wishbone_controller 
generic map ( 
	UC_ADDRESS => I2C_ADDRESS,
	ADDR_WIDTH => 30
	)
port map(
	-- 68000 parallel bus interface
	clk_sys_i	=> clk,
	rst_n_i		=> reset,	 
	
	--addr_bus	=> addr_bus,
	--data_bus	=> data_bus,
	--as		=> as,	
	--ds		=> ds,
	
	-- Directional pins
	--r_w		=> r_w, 
	--wishbone_in => wishbone_in,
	--wishbone_in  : in    wb_io_master_out;
	wb_adr_i => i_adr,
	wb_dat_i => i_dat,
	wb_sel_i => "1111",
	wb_cyc_i => i_cyc,
	wb_stb_i => i_stb,
	wb_we_i  => i_we,

	--wishbone_out : out   wb_io_slave_out;
	--wishbone_out => wishbone_out,
	wb_dat_o => o_dat,
	wb_ack_o => o_ack,
	--o_stall : out   std_ulogic;
	

	dtack	=> dtack, 
	irq		=> irq,

	-- Internal I2C Bus Registers
	-- Address Register (Contains slave address)
	madr	=> madr,

	-- Control Register		
	men		=> men,
	mien        => mien,
	msta        => msta,
	mtx         => mtx,
	txak        => txak,
	rsta        => rsta,

	mbcr_wr     => mbcr_wr,
	rsta_rst    =>	rsta_rst,

	-- Status Register
	mcf             => mcf,
	maas            => maas,
	mbb             => mbb,
	mal             => mal,
	srw             => srw,
	mif             => mif,
	rxak            => rxak,

	mal_bit_reset   => mal_bit_reset,
	mif_bit_reset   => mif_bit_reset,
	msta_rst	    => msta_rst,
	

	-- Data Register 
	mbdr_micro      => mbdr_micro,
	mbdr_i2c        => mbdr_i2c,

	mbdr_read       => mbdr_read
	
	);

end behave;
