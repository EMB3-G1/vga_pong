----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Patrick Stolc
-- 
-- Create Date:    
-- Design Name: 
-- Module Name:    ot - Behavioral
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
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.math_real.all;
use work.common.all;

entity ot is
	generic (
		ball_dim : integer := 20;
		bat_width : integer := 20;
		bat_height : integer := 100;
		left_bat_offset : integer := 20;
		right_bat_offset : integer := 600;
		OBJ_POS_WIDTH : integer := 10;
		COLOR_DATA_WIDTH : integer := 3
	);
	port(
		clk_i : in std_logic; -- sync to pixel clock
		rst_i : in std_logic;
		rgb_i : in std_logic_vector(3*COLOR_DATA_WIDTH-1 downto 0);
		c_row_i : in unsigned(OBJ_POS_WIDTH-1 downto 0);
		c_col_i : in unsigned(OBJ_POS_WIDTH-1 downto 0);

		bat_r_y_o : out std_logic_vector(OBJ_POS_WIDTH-1 downto 0);
		bat_l_y_o : out std_logic_vector(OBJ_POS_WIDTH-1 downto 0);
		ball_x_o : out std_logic_vector(OBJ_POS_WIDTH-1 downto 0);
		ball_y_o : out std_logic_vector(OBJ_POS_WIDTH-1 downto 0)
	);
end ot;

architecture Behavioral of ot is

	signal is_white : std_logic := '0';

	signal rgb_reg : std_logic_vector(3*COLOR_DATA_WIDTH-1 downto 0);
	signal rgb_nxt : std_logic_vector(3*COLOR_DATA_WIDTH-1 downto 0);
	
	type TRACKER_STATE is (
		IDLE,
		WAIT_WHITE,
		CONNECTED,
		ASSERT_FRAME
	);
	signal state_cur : TRACKER_STATE := IDLE;
	signal state_nxt : TRACKER_STATE;

begin
	
	track_reg : process(clk_i)
	begin
		if(rising_edge(clk_i)) then
			state_cur <= state_nxt;
			rgb_reg <= rgb_nxt;
		end if;
	end process;
	rgb_nxt <= rgb_i;
	
	obj_loc_proc : process(state_cur,rgb_reg,c_col_i,c_row_i)
		variable batr_found, batl_found, ball_found : std_logic := '0';
		begin
			state_nxt <= state_cur;
			
			case state_cur is
			when IDLE =>
				if(c_col_i = 0 and c_row_i = 0) then
					batr_found := '0';
					batl_found := '0';
					ball_found := '0';
					state_nxt <= WAIT_WHITE;
				end if;
			when WAIT_WHITE =>
				if(rgb_reg = "111111111") then
					state_nxt <= CONNECTED;
				elsif(c_col_i = 639 and c_row_i = 479) then
					state_nxt <= IDLE;
				end if;
			when CONNECTED =>
				if(rgb_reg = "111111111") then
					if(c_col_i <= left_bat_offset+5 and batl_found = '0') then
						batl_found := '1';
						bat_l_y_o <= std_logic_vector(c_row_i + 2);
						state_nxt <= ASSERT_FRAME;
					elsif(c_col_i >= right_bat_offset-5 and batr_found = '0') then
						batr_found := '1';
						bat_r_y_o <= std_logic_vector(c_row_i + 2);
						state_nxt <= ASSERT_FRAME;
					else
						if(c_col_i > 55 and c_col_i < right_bat_offset - 20 and ball_found = '0') then
							ball_found := '1';
							ball_x_o <= std_logic_vector(c_col_i-1);
							ball_y_o <= std_logic_vector(c_row_i+2);
						end if;
						state_nxt <= ASSERT_FRAME;
					end if;
				else
					state_nxt <= WAIT_WHITE;
				end if;
			when ASSERT_FRAME =>
				if(c_col_i = 639 and c_row_i = 479) then
					state_nxt <= IDLE;
				else
					state_nxt <= WAIT_WHITE;
				end if;
			end case;
	end process;
							
end architecture ; -- Behavioral