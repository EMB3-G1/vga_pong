----------------------------------------------------------------------------------
-- Company: University of Southern Denmark
-- Engineer: Anders Blaabjerg Lange
-- 
-- Create Date:    10:51:02 02/10/2014 
-- Design Name: 
-- Module Name:    detector - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity detector is
	generic(
		G_COLOR_WIDTH  : integer := 10
		--G_PXL_CLK_PRD	: time := 39721946 fs
	);
	port ( 

		clk_i : in std_logic;

		r_i  : in std_logic_vector (G_COLOR_WIDTH-1 downto 0);
		g_i  : in std_logic_vector (G_COLOR_WIDTH-1 downto 0);
		b_i  : in std_logic_vector (G_COLOR_WIDTH-1 downto 0);
		hs_i : in std_logic;
		vs_i : in std_logic
		
		--left_bar_Y : out std_logic_vector (9 downto 0);
		--right_bar_Y : out std_logic_vector (9 downto 0);
		--ballX : out std_logic_vector (9 downto 0);
		--ballY : out std_logic_vector (9 downto 0)
	);
end detector;

architecture Behavioral of detector is

	-- Element coordinates
	signal ballX : integer range 0 to 800 := 320;
	signal ballY : integer range 0 to 515 := 240;

	constant left_bar_X : integer := 20;
	signal left_bar_Y : integer range 35 to 515 := 240;
	constant right_bar_X : integer := 600;
	signal right_bar_Y : integer range 35 to 515 := 240;

	constant BAT_WIDHT : integer := 20;


	-- if we count pixels from the falling edge of the HS then there is 144 blank pixels before the first visible pixel
		
	signal C_H_FP : integer := 16;
	signal C_H_SP : integer := 96;
	signal C_H_BP : integer := 48;
	signal C_H_PX : integer := 640;
	
	signal C_HS_OFFSET : integer := C_H_SP+C_H_BP;	
	signal C_PIXEL_PR_LINE : integer := C_H_FP+C_H_SP+C_H_BP+C_H_PX;
	
	
	-- if we count lines from the falling edge of the VS then there is 35 blank lines before the first visible line.
	
	signal C_V_FP : integer := 10;
	signal C_V_SP : integer := 2;
	signal C_V_BP : integer := 33;
	signal C_V_LN : integer := 480;
	
	signal C_VS_OFFSET : integer := C_V_SP+C_V_BP;	
	signal C_LINES_PR_FRAME : integer := C_V_FP+C_V_SP+C_V_BP+C_V_LN;	
	
	signal pxl_clk	: std_logic;
	
	signal pixel_cnt_reg : unsigned(9 downto 0) := (others=>'0');
	signal pixel_cnt_nxt : unsigned(9 downto 0);
	
	
	signal line_cnt_reg : unsigned(9 downto 0) := (others=>'0');
	signal line_cnt_nxt : unsigned(9 downto 0);
	
	signal right_not_yet : std_logic := '0';
	signal left_not_yet : std_logic := '0';
	signal ball_not_yet : std_logic := '0';


begin

	process(pxl_clk, hs_i, vs_i)
		variable h_counter : integer range 0 to 784 := 0;
		variable v_counter : integer range 0 to 784 := 0;
	begin	
		if (hs_i'event and hs_i='1') then
			h_counter:=h_counter+1;
			v_counter:=v_counter+1;
		end if;

		if (vs_i'event and vs_i='1') then
			v_counter:= '0';
			ball_not_yet := '0';
			left_not_yet := '0';
			right_not_yet := '0';
		end if;

		if (pxl_clk'event and pxl_clk='1') then
			h_counter:=h_counter+1;

			if(r_i='1' and g_i='1' and b_i='1') then
				if(h_counter=left_bar_X+C_H_BP and left_not_yet='0') then
					left_bar_Y <= v_counter;
					left_not_yet := 1;

				elsif (h_counter=right_bar_X+C_H_BP and right_not_yet='0') then
					right_bar_Y=v_counter;
					right_not_yet := 1;
					
				elsif (h_counter>left_bar_X+BAT_WIDHT and h_counter<right_bar_X and ball_not_yet='0') then
					ballX <= h_counter;
					ballY <= v_counter;
					ball_not_yet := 1; 
				end if;
			end if;
		end if;
	end process;

end Behavioral;
