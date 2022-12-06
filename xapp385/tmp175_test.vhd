--***********************************************************************************************
-- tmp175_test.vhd
--
-- Created: 3/10/00 ALS
--	This file is the top level testbench that instantiates the VHDL component that emulates the
--	micro-controller and instantiates two I2C CPLD designs. One of the I2C CPLD designs acts as 
--	I2C Master, the other as the I2C Slave.
--***********************************************************************************************

library IEEE;
use IEEE.std_logic_1164.all;
 

entity TMP175_TEST is
end TMP175_TEST;

architecture archTMP175_TEST of TMP175_TEST is
    signal DATA_BUS: std_logic_vector(7 downto 0);
    signal DATA_MATCH: std_logic;
    signal ADDRESS: std_logic_vector(23 downto 0);
    signal MCF: std_logic;
    signal SDA: std_logic;
    signal CLK: std_logic;
    signal SCL: std_logic;
    signal IRQ: std_logic;
    signal AS: std_logic;
    signal DS: std_logic;
    signal DTACK: std_logic;
    signal R_W: std_logic;
    signal SLAVE_MCF: std_logic;
    signal RESET: std_logic;
    
    component TMP175_TB
        port(DTACK: IN STD_LOGIC;
             IRQ: IN STD_LOGIC;
             MCF: IN STD_LOGIC;
             AS: OUT STD_LOGIC;
             DS: OUT STD_LOGIC;
             R_W: OUT STD_LOGIC;
             ADDRESS: OUT STD_LOGIC_VECTOR(23 downto 0);
             RESET: INOUT STD_LOGIC;
             CLK: INOUT STD_LOGIC;
             DATA_MATCH: OUT STD_LOGIC;
             DATA_BUS: INOUT STD_LOGIC_VECTOR(7 downto 0));
    end component;

    component I2C
        generic(I2C_ADDRESS: std_logic_vector := "0000000000000000");
        port(SDA: INOUT STD_LOGIC;
             SCL: INOUT STD_LOGIC;
             ADDR_BUS: IN STD_LOGIC_VECTOR(23 downto 0);
             DATA_BUS: INOUT STD_LOGIC_VECTOR(7 downto 0);
             AS: IN STD_LOGIC;
             DS: IN STD_LOGIC;
             R_W: IN STD_LOGIC;
             DTACK: OUT STD_LOGIC;
             IRQ: OUT STD_LOGIC;
             MCF: INOUT STD_LOGIC;
             CLK: IN STD_LOGIC;
             RESET: IN STD_LOGIC);
    end component;

    component tmp175_simmodel
        generic(
          i2c_clk : integer := 200_000);      --i2c bus frequency in Hz
        port(      
          sda : inout std_logic;
          scl : inout std_logic);
      
    end component;
        
    component PULLUP
        port(v101: OUT std_logic);
    end component;
    
begin
    micro: TMP175_TB
        port map(DTACK => DTACK,
                 IRQ => IRQ,
                 MCF => MCF,
                 AS => AS,
                 DS => DS,
                 R_W => R_W,
                 ADDRESS => ADDRESS,
                 RESET => RESET,
                 CLK => CLK,
                 DATA_MATCH => DATA_MATCH,
                 DATA_BUS => DATA_BUS);
    
    MASTER: I2C
        generic map(I2C_ADDRESS => "0000000000001111")
        port map(SDA => SDA,
                 SCL => SCL,
                 ADDR_BUS => ADDRESS,
                 DATA_BUS => DATA_BUS,
                 AS => AS,
                 DS => DS,
                 R_W => R_W,
                 DTACK => DTACK,
                 IRQ => IRQ,
                 MCF => MCF,
                 CLK => CLK,
                 RESET => RESET);
    
    NC: I2C
        generic map(I2C_ADDRESS => "0000000000001101")
        port map(--SDA => SDA,
                 --SCL => SCL,
                 ADDR_BUS => ADDRESS,
                 DATA_BUS => DATA_BUS,
                 AS => AS,
                 DS => DS,
                 R_W => R_W,
                 DTACK => DTACK,
                 IRQ => IRQ,
                 MCF => SLAVE_MCF,
                 CLK => CLK,
                 RESET => RESET);

    SLAVE: tmp175_simmodel
        port map(sda => SDA,
                 scl => SCL);

    v109: PULLUP
        port map(v101 => SCL);
    
    v110: PULLUP
        port map(v101 => SDA);
    
    v111: PULLUP
        port map(v101 => DTACK);
    
    v112: PULLUP
        port map(v101 => IRQ);
    
    
end archTMP175_TEST;
