--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:38:53 04/24/2015
-- Design Name:   
-- Module Name:   /home/ignaciotb/Documents/Semester2/EMB3/VHDL/EMB3-PROJECT/emb3_board_test/interpreter_tb.vhd
-- Project Name:  emb3_board_test
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: interpreter
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
 
ENTITY interpreter_tb IS
	generic(
		G_COLOR_WIDTH  : integer := 10;
		G_CLK_DIV		: integer := 4
		);
END interpreter_tb;
 
ARCHITECTURE behavior OF interpreter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT interpreter
    PORT(
         clk_i : IN  std_logic;
         rst_i : IN  std_logic;
         h_sync_i : IN  std_logic;
         v_sync_i : IN  std_logic;
         rgb_i : IN  std_logic_vector(8 downto 0);
			
			col_counter : out std_logic_vector(9 downto 0);
			row_counter : out std_logic_vector(9 downto 0);
		
         bat_r_o : OUT  std_logic_vector(9 downto 0);
         bat_l_o : OUT  std_logic_vector(9 downto 0);
         ball_x_o : OUT  std_logic_vector(9 downto 0);
         ball_y_o : OUT  std_logic_vector(9 downto 0);
         ball_speed_o : OUT  std_logic_vector(9 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk_i : std_logic := '0';
   signal rst_i : std_logic := '1';
   signal h_sync_i : std_logic := '0';
   signal v_sync_i : std_logic := '0';
   signal rgb_i : std_logic_vector(8 downto 0) := (others => '0');
	
 	--Outputs
   signal bat_r_o : std_logic_vector(9 downto 0):= (others => '0');
   signal bat_l_o : std_logic_vector(9 downto 0):= (others => '0');
   signal ball_x_o : std_logic_vector(9 downto 0):= (others => '0');
   signal ball_y_o : std_logic_vector(9 downto 0):= (others => '0');
   signal ball_speed_o : std_logic_vector(9 downto 0):= (others => '0');

   -- Clock period definitions
   constant clk_i_period : time := 40 ns;
		
	signal C_H_FP : integer := 16;
	signal C_H_SP : integer := 96;
	signal C_H_BP : integer := 48;
	signal C_H_PX : integer := 640;
	
	signal C_HS_OFFSET : integer := C_H_SP+C_H_BP;	
	signal C_PIXEL_PR_LINE : integer := C_H_FP+C_H_SP+C_H_BP+C_H_PX;
	
	
	--
	-- if we count lines from the falling edge of the VS then there is 35 blank lines before the first visible line.
	
	signal C_V_FP : integer := 10;
	signal C_V_SP : integer := 2;
	signal C_V_BP : integer := 33;
	signal C_V_LN : integer := 480;
	
	signal C_VS_OFFSET : integer := C_V_SP+C_V_BP;	
	signal C_LINES_PR_FRAME : integer := C_V_FP+C_V_SP+C_V_BP+C_V_LN;	
	
	signal r	: std_logic_vector (G_COLOR_WIDTH-1 downto 0) := (others=>'0');
	signal g	: std_logic_vector (G_COLOR_WIDTH-1 downto 0) := (others=>'0');
	signal b	: std_logic_vector (G_COLOR_WIDTH-1 downto 0) := (others=>'0');
	
	signal pixel_cnt_reg : unsigned(9 downto 0) := (others=>'0');
	signal pixel_cnt_nxt : unsigned(9 downto 0);
	signal line_cnt_reg : unsigned(9 downto 0) := (others=>'0');
	signal line_cnt_nxt : unsigned(9 downto 0);

	-- Left bat: 20x100 pixels, centered in the left visible part of the screen at x=20
	--
	-- top-left corner @(20,189)     -> plus offset -> (164,224) 
	-- top-right corner @(39,189)    -> plus offset -> (183,224) 
	-- bottom-left corner @(20,288)  -> plus offset -> (164,323) 
	-- bottom-right corner @(39,288) -> plus offset -> (183,323)
	constant C_LBAT_X1 : integer := 20;
	constant C_LBAT_X2 : integer := 39;
	constant C_LBAT_Y1 : integer := 189;
	constant C_LBAT_Y2 : integer := 288;

	-- Ball: 20x20 pixels, centered in the visible part of the screen
	--
	-- top-left corner @(310,230)     -> plus offset -> (454,265) 
	-- top-right corner @(329,230)    -> plus offset -> (473,265) 
	-- bottom-left corner @(310,249)  -> plus offset -> (454,284) 
	-- bottom-right corner @(329,249) -> plus offset -> (473,284)
	constant C_BALL_X1 : integer := 410;
	constant C_BALL_X2 : integer := 429;
	constant C_BALL_Y1 : integer := 230;
	constant C_BALL_Y2 : integer := 249;

	-- Right bat: 20x100 pixels, centered in the right visible part of the screen at x=640-40 = 600
	--
	-- top-left corner @(600,189)     -> plus offset -> (744,224) 
	-- top-right corner @(619,189)    -> plus offset -> (763,224) 
	-- bottom-left corner @(600,288)  -> plus offset -> (744,323) 
	-- bottom-right corner @(619,288) -> plus offset -> (763,323)
	constant C_RBAT_X1 : integer := 600;
	constant C_RBAT_X2 : integer := 619;
	constant C_RBAT_Y1 : integer := 189;
	constant C_RBAT_Y2 : integer := 288;

	signal col_counter1 : std_logic_vector(9 downto 0);
	signal row_counter1 : std_logic_vector(9 downto 0);		
	
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: interpreter PORT MAP (
          clk_i => clk_i,
          rst_i => rst_i,
          h_sync_i => h_sync_i,
          v_sync_i => v_sync_i,
          rgb_i => r(9 downto 7) & g(9 downto 7) & b(9 downto 7),
			 
			 col_counter => col_counter1,
			 row_counter => row_counter1,
		
          bat_r_o => bat_r_o,
          bat_l_o => bat_l_o,
          ball_x_o => ball_x_o,
          ball_y_o => ball_y_o,
          ball_speed_o => ball_speed_o
        );

   -- Clock process definitions: 25MHz
   clk_i_process :process
   begin
		clk_i <= '0';
		wait for clk_i_period/2;
		clk_i <= '1';
		wait for clk_i_period/2;
   end process;
	
		
	-- HS and VS generator
	HS_VS_procces: process(clk_i)
	begin
		if rising_edge(clk_i) then
			pixel_cnt_reg <= pixel_cnt_nxt;
			line_cnt_reg <= line_cnt_nxt;

			rgb_i <= r(9 downto 7) & g(9 downto 7) & b(9 downto 7);
		end if;
	end process;
	
	pixel_cnt_nxt <= pixel_cnt_reg+1 when pixel_cnt_reg<C_PIXEL_PR_LINE-1 else (others=>'0');
	line_cnt_nxt <= line_cnt_reg+1 when pixel_cnt_reg=C_PIXEL_PR_LINE-1 and line_cnt_reg<C_LINES_PR_FRAME-1 else 
						 (others=>'0')  when pixel_cnt_reg=C_PIXEL_PR_LINE-1 else
						 line_cnt_reg;
	
	h_sync_i <= '0' when pixel_cnt_reg < C_H_SP else '1';
	v_sync_i <= '0' when line_cnt_reg < C_V_SP else '1';
	
	-- OUTPUTS IN B&W (in a horrible way)
	r <= (others=>'1') when (pixel_cnt_reg >= (C_LBAT_X1+C_HS_OFFSET) and 
									 pixel_cnt_reg <= (C_LBAT_X2+C_HS_OFFSET) and 
									 line_cnt_reg  >= (C_LBAT_Y1+C_VS_OFFSET) and 
									 line_cnt_reg  <= (C_LBAT_Y2+C_VS_OFFSET)) or
									 (pixel_cnt_reg >= (C_BALL_X1+C_HS_OFFSET) and 
									 pixel_cnt_reg <= (C_BALL_X2+C_HS_OFFSET) and 
									 line_cnt_reg  >= (C_BALL_Y1+C_VS_OFFSET) and 
									 line_cnt_reg  <= (C_BALL_Y2+C_VS_OFFSET)) or
									 (pixel_cnt_reg >= (C_RBAT_X1+C_HS_OFFSET) and 
									 pixel_cnt_reg <= (C_RBAT_X2+C_HS_OFFSET) and 
									 line_cnt_reg  >= (C_RBAT_Y1+C_VS_OFFSET) and 
									 line_cnt_reg  <= (C_RBAT_Y2+C_VS_OFFSET)) else
		  (others=>'0');

	g <= (others=>'1') when (pixel_cnt_reg >= (C_LBAT_X1+C_HS_OFFSET) and 
									 pixel_cnt_reg <= (C_LBAT_X2+C_HS_OFFSET) and 
									 line_cnt_reg  >= (C_LBAT_Y1+C_VS_OFFSET) and 
									 line_cnt_reg  <= (C_LBAT_Y2+C_VS_OFFSET)) or
									 (pixel_cnt_reg >= (C_BALL_X1+C_HS_OFFSET) and 
									 pixel_cnt_reg <= (C_BALL_X2+C_HS_OFFSET) and 
									 line_cnt_reg  >= (C_BALL_Y1+C_VS_OFFSET) and 
									 line_cnt_reg  <= (C_BALL_Y2+C_VS_OFFSET)) or
									 (pixel_cnt_reg >= (C_RBAT_X1+C_HS_OFFSET) and 
									 pixel_cnt_reg <= (C_RBAT_X2+C_HS_OFFSET) and 
									 line_cnt_reg  >= (C_RBAT_Y1+C_VS_OFFSET) and 
									 line_cnt_reg  <= (C_RBAT_Y2+C_VS_OFFSET)) else
		  (others=>'0');
		
	b <= (others=>'1') when (pixel_cnt_reg >= (C_LBAT_X1+C_HS_OFFSET) and 
									 pixel_cnt_reg <= (C_LBAT_X2+C_HS_OFFSET) and 
									 line_cnt_reg  >= (C_LBAT_Y1+C_VS_OFFSET) and 
									 line_cnt_reg  <= (C_LBAT_Y2+C_VS_OFFSET)) or
									 (pixel_cnt_reg >= (C_BALL_X1+C_HS_OFFSET) and 
									 pixel_cnt_reg <= (C_BALL_X2+C_HS_OFFSET) and 
									 line_cnt_reg  >= (C_BALL_Y1+C_VS_OFFSET) and 
									 line_cnt_reg  <= (C_BALL_Y2+C_VS_OFFSET)) or
									 (pixel_cnt_reg >= (C_RBAT_X1+C_HS_OFFSET) and 
									 pixel_cnt_reg <= (C_RBAT_X2+C_HS_OFFSET) and 
									 line_cnt_reg  >= (C_RBAT_Y1+C_VS_OFFSET) and 
									 line_cnt_reg  <= (C_RBAT_Y2+C_VS_OFFSET)) else
		  (others=>'0');


END;
