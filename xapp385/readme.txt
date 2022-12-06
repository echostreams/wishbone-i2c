******************************************************************************************************
Readme File for I2C Customer Pack

Revised: 10/10/00 ALS
Updated: 12/12/02 JRH
Updated: 12/20/02 JRH

******************************************************************************************************
******************************************************************************************************
DISCLAIMER
******************************************************************************************************
THIS DESIGN IS PROVIDED TO YOU "AS IS". XILINX MAKES AND YOU RECEIVE NO WARRANTIES OR CONDITIONS, 
EXPRESS, IMPLIED,  STATUTORY OR OTHERWISE, AND XILINX SPECIFICALLY DISCLAIMS ANY IMPLIED WARRANTIES 
OF MERCHANTABILITY, NON-INFRINGEMENT, OR FITNESS FOR A PARTICULAR PURPOSE. This design has not been 
verified on hardware (as opposed to simulations), and it should be used only as an example design, 
not as a fully functional core. XILINX does not warrant the performance, functionality, or operation 
of this Design will meet your requirements, or that the operation of the Design will be uninterrupted 
or error free, or that defects in the Design will be corrected. Furthermore, XILINX does not warrant 
or make any representations regarding use or the results of the use of the Design in terms of 
correctness, accuracy, reliability or otherwise. 

THIRD PARTIES INCLUDING PHILIPS MAY HAVE PATENTS ON THE INTER-INTEGRATED CIRCUIT ("I2C") BUS.  BY 
PROVIDING THIS HDL CODE AS ONE POSSIBLE IMPLEMENTATION OF THIS STANDARD, XILINX IS MAKING NO 
REPRESENTATION THAT THE PROVIDED IMPLEMENTATION OF THE I2C BUS IS FREE FROM ANY CLAIMS OF INFRINGEMENT 
BY ANY THIRD PARTY.  XILINX EXPRESSLY DISCLAIMS ANY WARRANTY OR CONDITIONS, EXPRESS, IMPLIED, 
STATUTORY OR OTHERWISE, AND XILINX SPECIFICALLY DISCLAIMS ANY IMPLIED WARRANTIES OF MERCHANTABILITY, 
NON-INFRINGEMENT, OR FITNESS FOR A PARTICULAR PURPOSE,  THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING 
BUT NOT LIMITED TO ANY  WARRANTY OR REPRESENTATION THAT THE IMPLEMENTATION IS FREE FROM CLAIMS OF ANY 
THIRD PARTY.  FURTHERMORE, XILINX IS PROVIDING THIS REFERENCE DESIGNS "AS IS" AS A COURTESY TO YOU. 
******************************************************************************************************
File Contents
******************************************************************************************************
This zip file contains the following folders:

	\work				-- XST and ModelSim compiled VHDL files

	-- VHDL Source Files:
		i2c.vhd			-- top level file
		i2c_control.vhd		-- control function for the I2C master/slave
		shift.vhd		-- shift register
		uc_interface.vhd	-- uC interface function for an 8-bit 68000-like uC
		upcnt4.vhd		-- 4-bit up counter
		i2c_timesim.vhd		-- post-route I2C simulation netlist
					
	--VHDL Testbench Files:	
		micro_test.vhd		-- top-level VHDL testbench for functional simulation that
					   instantiates micro_tb.vhd, pullup.vhd, and i2c.vhd.	
	
		micro_tb.vhd		-- VHDL functional simulation testbench that tests two 
					   instantiations of the I2C design. It configures
					   one as a master and one as a slave and then
					   the two I2C designs transfer data over I2C.

		micro_test_post.vhd	-- top-level VHDL testbench for post-route simulation that
					   instantiates micro_master_tb.vhd, micro_slave_tb.vhd,
					   pullup.vhd and the post-route VHDL model time_sim.vho
		micro_master_tb.vhd	
		micro_slave_tb.vhd	-- These two files test the post-fit VHDL files output from 
					   Project Navigator. Since in the post-fit VHDL the uC 
					   address is hard-coded,  both instantiations of the I2C 
					   design have the same uC address. Therefore separate
					   testbenches are needed to talk to the two instantiations
					   of the I2C design; one that configures one of the I2C 
					   designs as a Master, one that configures the other I2C
					   design as a Slave.
		pullup.vhd		-- models a pull-up resistor
		upcnt4_tb.vhd		-- functional testbench for upcnt4
		upcnt4_tb_post.vhd	-- post-route testbench for upcnt4

	-- ModelSim DO files:	
		micro_test.do		-- functional simulation script file that calls wave.do
		wave.do			-- configures wave window for functional simulation
		micro_test_post.do	-- post-route simulation script file that calls wave_post.do
		wave_post.do		-- configures wave window for post-route simulation

	-- Report Files
		i2c.rpt			-- Project Navigator fitter report file
		i2c.cxt			-- XPower input data file
	
	-- XST Files
		i2c.npl			-- Project Navigator project file
		i2c.jed			-- JEDEC programming file with I2C fit to a XC2C256-5-TQ144
					   device
		
******************************************************************************************************
Design Notes
******************************************************************************************************
The I2C design was designed from Section 7 - MBUS INTERFACE MODULE of the specification for the 
MC68307 uC. It contains the register structures defined in this document. Complete documentation for 
the design can be found in XAPP385 available for download from the Xilinx website.

All of the register addresses are defined as constants in the VHDL source files and can be easily 
customized for customer use. The MBASE address is defined as a generic and can also be easily changed 
and customized for customer use. In addition, this design outputs the MCF signal on a pin which can 
be used by the uC as a quick indication that the I2C transfer is complete.

This design is targeted to the xc2c256-5tq144 CoolRunner-II CPLD. This is a 1.8V core, 256 macrocell 
device in a 144TQFP package. The fitter was allowed to pick the pin-out for the device. 3.3V I/Os have 
been selected to be consistent with the I2C specification.  To match voltage levels of the target uC, 
the CoolRunner-II CPLD can be configured with several I/O voltage banks.

IMPORTANT NOTE: This design uses the I2C SCL signal as a clock. This requires that the SCL signal 
have clean, fast edges on both the rising and falling edges of this signal. Slow rise and fall times 
on this signal can show noise effects which can cause improper clocking of registers within the 
CoolRunner-II CPLD. If the loading of the SCL signal in the system is such that the rise and fall 
times are slow (>20nS), this signal will need to be buffered using the Schmitt Trigger inputs 
available on all CoolRunner-II I/Os.

Please also note that this design has been verified through simulations, but not on actual hardware.

******************************************************************************************************
Technical Support
******************************************************************************************************
Technical support for this design and any other CoolRunner-II CPLD issues can be obtained as follows:

North American Support
(Mon,Tues,Wed,Fri 6:30am-5pm  
  Thr 6:30am - 4:00pm Pacific Standard Time)
Hotline: 1-800-255-7778 
or (408) 879-5199 
Fax: (408) 879-4442 
Email: hotline@xilinx.com 
 
United Kingdom Support
(Mon,Tues,Wed,Thr 9:00am-12:00pm, 1:00-5:30pm
  Fri 9:00am-12:00pm, 1:00-3:30pm)    
Hotline: +44 1932 820821
Fax: +44 1932 828522 
Email : ukhelp@xilinx.com 
 
France Support
(Mon,Tues,Wed,Thr,Fri 9:30am-12:30pm, 2:00-5:30pm)
Hotline: +33 1 3463 0100 
Fax: +33 1 3463 0959
Email : frhelp@xilinx.com 
 
Germany Support
(Mon,Tues,Wed,Thr 8:00am-12:00pm, 1:00-5:00pm, 
   Fri  8:00am-12:00pm, 1:00pm-3:00pm)
Hotline: +49 89 991 54930 
Fax: +49 89 904 4748 
Email : dlhelp@xilinx.com 
 
Japan Support
(Mon,Tues,Thu,Fri  9:00am -5:00pm ()
 Wed    9:00am -4:00pm)
Hotline: (81)3-3297-9163
Fax:: (81)3-3297-0067
Email: jhotline@xilinx.com
