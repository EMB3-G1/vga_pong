--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:28:31 04/30/2015
-- Design Name:   
-- Module Name:   /home/ignaciotb/Documents/Semester2/EMB3/VHDL/EMB3-PROJECT/emb3_board_test/color_adder_tb.vhd
-- Project Name:  emb3_board_test
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: color_adder
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
USE ieee.numeric_std.ALL;
 
ENTITY color_adder_tb IS
END color_adder_tb;
 
ARCHITECTURE behavior OF color_adder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT color_adder
    PORT(
         clk_i : IN  std_logic;
         rst_i : IN  std_logic;
         ball_x_i : IN  std_logic_vector(9 downto 0);
         ball_y_i : IN  std_logic_vector(9 downto 0);
         col_counter : IN  std_logic_vector(9 downto 0);
         row_counter : IN  std_logic_vector(9 downto 0);
         bat_r_i : IN  std_logic_vector(9 downto 0);
         bat_l_i : IN  std_logic_vector(9 downto 0);
         rgb_output : OUT  std_logic_vector(8 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk_i : std_logic := '0';
   signal rst_i : std_logic := '0';
   signal ball_x_i : std_logic_vector(9 downto 0) := (others => '0');
   signal ball_y_i : std_logic_vector(9 downto 0) := (others => '0');
   signal col_counter : std_logic_vector(9 downto 0) := (others => '0');
   signal row_counter : std_logic_vector(9 downto 0) := (others => '0');
   signal bat_r_i : std_logic_vector(9 downto 0) := (others => '0');
   signal bat_l_i : std_logic_vector(9 downto 0) := (others => '0');

 	--Outputs
   signal rgb_output : std_logic_vector(8 downto 0);
	
	-- Pixel pointer 
	signal hs_dff1 : std_logic := '0';
	signal vs_dff1 : std_logic := '0';
	signal col_count : unsigned (9 downto 0):= (others => '0');
	signal row_count : unsigned (9 downto 0):= (others => '0');
	
   -- Clock period definitions
   constant clk_i_period : time := 40 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: color_adder PORT MAP (
          clk_i => clk_i,
          rst_i => rst_i,
          ball_x_i => ball_x_i,
          ball_y_i => ball_y_i,
          col_counter => col_counter,
          row_counter => row_counter,
          bat_r_i => bat_r_i,
          bat_l_i => bat_l_i,
          rgb_output => rgb_output
        );
		  
	vga_generator_inst : entity work.vga_generator
	generic map(
		G_COLOR_WIDTH  => 3,
		G_CLK_DIV		=> 1		-- input clock is 100.7 MHz (4x faster than the desired pixel clock)
	)
	port map( 
		clk_i	=> clk_i,
		r_o   => open,
		g_o   => open,
		b_o   => open,
		hs_o  => hs_dff1,
		vs_o  => vs_dff1
	);
	
	pixel_ptr_inst : entity work.pixel_ptr
	port map (
		clk_i => clk_i,
		rst_i => rst_i,
		h_sync_i => hs_dff1,
		v_sync_i => vs_dff1,
		cptr_o => col_count,
		rptr_o => row_count
	);
 
	col_counter <= std_logic_vector(resize(unsigned(col_count),10));
	row_counter <= std_logic_vector(resize(unsigned(row_count),10));

   -- Clock process definitions
   clk_i_process :process
   begin
		clk_i <= '0';
		wait for clk_i_period/2;
		clk_i <= '1';
		wait for clk_i_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process(clk_i)
	variable counter : integer range 0 to 640 := 0;
   begin		
      if(rising_edge(clk_i)) then
			counter:= counter +1;		
		
      --wait;
		end if;
   end process;
	
	ball_x_i <= "0110011010";
	ball_y_i <= "0011100111";
	bat_r_i <=  "0010111101";
	bat_l_i <=  "0010111101";
	

END;
