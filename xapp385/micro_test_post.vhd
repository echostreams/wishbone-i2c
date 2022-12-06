--***********************************************************************************************
-- micro_test_post.vhd
--
-- Created: 3/13/00 ALS
--	This file is the top level testbench that instantiates two VHDL components that emulate the
--	micro-controller and instantiates two I2C CPLD designs. One of the I2C CPLD designs acts as 
--	I2C Master, the other as the I2C Slave.
--
-- Revised: 10/10/00 ALS
-- 	New WebPACK release supports vectors in post-route VHDL model. Made changes in this file to 
--	reflect changes in the post-route model.
-- Revised:  12-12-02 JRH
--***********************************************************************************************
library IEEE;
use IEEE.std_logic_1164.all;
 

entity MICRO_TEST_POST is
end MICRO_TEST_POST;

architecture archMICRO_TEST_POST of MICRO_TEST_POST is

--********************************** Component Declarations **************************
-- I2C Component    
    component i2c
	    port(as, clk, ds, r_w, reset: in std_logic;
	         addr_bus: in std_logic_vector(23 downto 0);
	         dtack, irq, mcf: out std_logic;
	         scl, sda: inout std_logic;
	         data_bus: inout std_logic_vector(7 downto 0)
	         );
    end component;

-- Pull-up Component        
    component pullup
        port(v101: out std_logic);
    end component;
    
-- Micro that configures Master I2C        
    component micro_master_tb
        port(dtack: in std_logic;
             irq: in std_logic;
             mcf: in std_logic;
             as: out std_logic;
             ds: out std_logic;
             r_w: out std_logic;
             address: out std_logic_vector(23 downto 0);
             reset: inout std_logic;
             clk: inout std_logic;
             data_match: out std_logic;
             data_bus: inout std_logic_vector(7 downto 0));
    end component;
    
-- Micro that configures Slave I2C       
    component micro_slave_tb
        port(dtack: in std_logic;
             irq: in std_logic;
             mcf: in std_logic;
             as: out std_logic;
             ds: out std_logic;
             r_w: out std_logic;
             address: out std_logic_vector(23 downto 0);
             reset: inout std_logic;
             clk: inout std_logic;
             data_match: out std_logic;
             data_bus: inout std_logic_vector(7 downto 0));
    end component;

--********************************** Signal Declarations **************************
-- Master I2C - micro Interface
    signal m_address		: std_logic_vector(23 downto 0);	-- master address bus
    signal m_data_bus		: std_logic_vector(7 downto 0);		-- master data bus
    signal master_dtack		: std_logic;				-- master dtack
    signal m_as			: std_logic;				-- master address strobe
    signal m_ds			: std_logic;				-- master data strobe
    signal m_r_w		: std_logic;				-- master read/write
    signal m_reset		: std_logic;				-- master reset
    signal master_mcf		: std_logic;				-- indicates master xfer is done
    signal master_irq		: std_logic;				-- master interrup rqst
    signal m_clk		: std_logic;				-- master clock
    signal m_data_match		: std_logic;				-- master data match
    
-- Slave I2C - micro Interface
    signal s_address		: std_logic_vector(23 downto 0);	-- slave address bus
    signal s_data_bus		: std_logic_vector(7 downto 0);		-- slave data bus
    signal slave_dtack		: std_logic;				-- slave dtack signal
    signal s_as			: std_logic;				-- slave address strobe
    signal s_ds			: std_logic;				-- slave data strobe
    signal s_r_w		: std_logic;				-- slave read/write
    signal s_reset		: std_logic;				-- slave reset
    signal slave_mcf		: std_logic;				-- indicates slave xfer is done
    signal slave_irq		: std_logic;				-- slave interrupt rqst
    signal s_clk		: std_logic;				-- slave clock
    signal s_data_match		: std_logic;				-- slave data match

-- I2C Bus Signals
    signal sda			: std_logic;				-- I2C SDA signal
    signal scl			: std_logic;				-- I2C SCL signal


    
begin

--********************************** Component Instantiations **************************
-- Instantiate the Master I2C component
    i2c_post_master: i2c
        port map(
             as		=> m_as,
             clk	=> m_clk,
             ds		=> m_ds, 
             r_w	=> m_r_w,
             reset	=> m_reset,
             addr_bus	=> m_address,
             dtack	=> master_dtack,
             irq	=> master_irq, 
             mcf	=> master_mcf,
             scl	=> scl,
             sda	=> sda,
             data_bus	=> m_data_bus
             );

-- Instantiate the Slave I2C component
    i2c_post_slave: i2c
            port map(
                 as		=> s_as,
                 clk		=> s_clk,
                 ds		=> s_ds, 
                 r_w		=> s_r_w,
                 reset		=> s_reset,
                 addr_bus	=> s_address,
                 dtack		=> slave_dtack,
                 irq		=> slave_irq, 
                 mcf		=> slave_mcf,
                 scl		=> scl,
                 sda		=> sda,
                 data_bus	=> s_data_bus
                 );
                 
-- Instantiate the Micro that configures the Master I2C component                 
    micro_master: micro_master_tb
        port map(
        	 dtack 		=> master_dtack,
                 irq 		=> master_irq,
                 mcf 		=> master_mcf,
                 as 		=> m_as,
                 ds 		=> m_ds,
                 r_w 		=> m_r_w,
                 address 	=> m_address,
                 reset 		=> m_reset,
                 clk 		=> m_clk,
                 data_match 	=> m_data_match,
                 data_bus 	=> m_data_bus);

-- Instantiate the Micro that configures the Slave I2C component                 
    micro_slave: micro_slave_tb
        port map(dtack => slave_dtack,
                 irq => slave_irq,
                 mcf => slave_mcf,
                 as => s_as,
                 ds => s_ds,
                 r_w => s_r_w,
                 address => s_address,
                 reset => s_reset,
                 clk => s_clk,
                 data_match => s_data_match,
                 data_bus => s_data_bus);
                 
-- Instantiate the necessary pull-ups               
    v112: pullup
        port map(v101 => scl);
    
    v113: pullup
        port map(v101 => sda);
       
    v114: pullup
        port map(v101 => slave_irq);
    
    v115: pullup
        port map(v101 => slave_dtack);
    
    v116: pullup
        port map(v101 => master_dtack);
    
    v117: pullup
        port map(v101 => master_irq);
    
    
end archMICRO_TEST_POST;
