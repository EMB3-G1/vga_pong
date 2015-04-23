--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:36:24 04/22/2015
-- Design Name:   
-- Module Name:   /home/ignaciotb/Documents/Semester2/EMB3/VHDL/EMB3-PROJECT/emb3_board_test/SlidingAverage.vhd
-- Project Name:  emb3_board_test
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sliding_average
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY SlidingAverage IS
END SlidingAverage;
 
ARCHITECTURE behavior OF SlidingAverage IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sliding_average
    PORT(
         filter_clk : IN  std_logic;
         filter_reset : IN  std_logic;
         adc_i : IN  std_logic_vector(9 downto 0);
         dac_o : OUT  std_logic_vector(9 downto 0);
         adc_clk_o : OUT  std_logic;
         dac_clk_o : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal filter_clk : std_logic := '0';
   signal filter_reset : std_logic := '0';
   signal adc_i : std_logic_vector(9 downto 0) := (others => '0');

 	--Outputs
   signal dac_o : std_logic_vector(9 downto 0);
   signal adc_clk_o : std_logic;
   signal dac_clk_o : std_logic;

   -- Clock period definitions
   constant filter_clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sliding_average PORT MAP (
          filter_clk => filter_clk,
          filter_reset => filter_reset,
          adc_i => adc_i,
          dac_o => dac_o,
          adc_clk_o => adc_clk_o,
          dac_clk_o => dac_clk_o
        );

   -- Clock process definitions
   filter_clk_process :process
   begin
		filter_clk <= '0';
		wait for filter_clk_period/2;
		filter_clk <= '1';
		wait for filter_clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for filter_clk_period*10;

      -- insert stimulus here 
		filter_reset <= '0';
		wait for filter_clk_period;
		for i in 0 to 300 loop  
			adc_i <= std_logic_vector(to_unsigned(1024,adc_i'length));
			wait for filter_clk_period;
			adc_i <= std_logic_vector(to_unsigned(0,adc_i'length));
			wait for filter_clk_period;
			adc_i <= std_logic_vector(to_unsigned(1024,adc_i'length));
			wait for filter_clk_period;
			adc_i <= std_logic_vector(to_unsigned(1024,adc_i'length));
			wait for filter_clk_period;
			adc_i <= std_logic_vector(to_unsigned(1024,adc_i'length));
			wait for filter_clk_period;
			adc_i <= std_logic_vector(to_unsigned(0,adc_i'length));
			wait for filter_clk_period;
			adc_i <= std_logic_vector(to_unsigned(1024,adc_i'length));
			wait for filter_clk_period;
			adc_i <= std_logic_vector(to_unsigned(1024,adc_i'length));
			wait for filter_clk_period;
			adc_i <= std_logic_vector(to_unsigned(1024,adc_i'length));
			wait for filter_clk_period;
			adc_i <= std_logic_vector(to_unsigned(0,adc_i'length));
			wait for filter_clk_period;
			adc_i <= std_logic_vector(to_unsigned(1024,adc_i'length));
			wait for filter_clk_period;
		end loop;
       wait;
   end process;

END;
