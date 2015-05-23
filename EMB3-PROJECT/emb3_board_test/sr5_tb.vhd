--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:30:01 05/23/2015
-- Design Name:   
-- Module Name:   /home/ignaciotb/Documents/Semester2/EMB3/VHDL/EMB3-PROJECT/emb3_board_test/sr5_tb.vhd
-- Project Name:  emb3_board_test
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sr5
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY sr5_tb IS
END sr5_tb;
 
ARCHITECTURE behavior OF sr5_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sr5
    PORT(
         clk_i : IN  std_logic;
         bit_i : IN  std_logic;
         bit_o : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk_i : std_logic := '0';
   signal bit_i : std_logic := '0';

 	--Outputs
   signal bit_o : std_logic;

   -- Clock period definitions
   constant clk_i_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sr5 PORT MAP (
          clk_i => clk_i,
          bit_i => bit_i,
          bit_o => bit_o
        );

   -- Clock process definitions
   clk_i_process :process
   begin
		clk_i <= '0';
		wait for clk_i_period/2;
		clk_i <= '1';
		wait for clk_i_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process (clk_i)
	variable cnt : integer range 0 to 2;
   begin		
		-- insert stimulus here 
		if (clk_i'event and clk_i='1') then
			 cnt := cnt+1;
			 if(cnt = 2) then
					bit_i <= '1';
					cnt:=0;
			 else
					bit_i <= '0';
			 end if;
		end if;
   end process;

END;
