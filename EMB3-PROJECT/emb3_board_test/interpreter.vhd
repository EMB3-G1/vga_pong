----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Patrick Stolc
-- 
-- Create Date:    
-- Design Name: 
-- Module Name:    bs - Behavioral
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


entity interpreter is
	port (
		clk_i : in std_logic;
		rst_i : in std_logic;
		h_sync_i : in std_logic;
		v_sync_i : in std_logic;
		rgb_i : in std_logic_vector(8 downto 0);
		
		col_counter : out std_logic_vector(9 downto 0);
		row_counter : out std_logic_vector(9 downto 0);
		
		bat_r_o : out std_logic_vector(9 downto 0);
		bat_l_o : out std_logic_vector(9 downto 0);
		ball_x_o : out std_logic_vector(9 downto 0);
		ball_y_o : out std_logic_vector(9 downto 0);
		ball_speed_o : out std_logic_vector(9 downto 0)
	);
end interpreter;

architecture Behavioral of interpreter is

	signal col_ptr : unsigned(COL_DATA_WIDTH-1 downto 0) := (others=>'0');
	signal row_ptr : unsigned(ROW_DATA_WIDTH-1 downto 0) := (others=>'0');
	signal ball_x_reg : std_logic_vector(9 downto 0) := (others => '0');
	signal ball_y_reg : std_logic_vector(9 downto 0) := (others => '0');
	signal eof : std_logic := '0';
	
	signal hs_dff0, hs_dff1 : std_logic;
	signal vs_dff0, vs_dff1 : std_logic;
	signal rgb_dff0, rgb_dff1 : std_logic_vector(8 downto 0);

begin

	ball_x_o <= ball_x_reg;
	ball_y_o <= ball_y_reg;
	
	process(clk_i)
	begin
		if(rising_edge(clk_i)) then
			hs_dff0 <= h_sync_i;
			vs_dff0 <= v_sync_i;
			rgb_dff0 <= rgb_i;
			hs_dff1 <= hs_dff0;
			vs_dff1 <= vs_dff0;
			rgb_dff1 <= rgb_dff0;
		end if;
	end process;
	
	pixel_ptr_inst : entity work.pixel_ptr
	port map (
		clk_i => clk_i,
		rst_i => rst_i,
		h_sync_i => hs_dff1,
		v_sync_i => vs_dff1,
		cptr_o => col_ptr,
		rptr_o => row_ptr
	);
	object_tracker_instance : entity work.ot
	port map (
		clk_i => clk_i,
		rst_i => rst_i,
		rgb_i => rgb_dff1,
		c_row_i => row_ptr,
		c_col_i => col_ptr,
		bat_r_y_o => bat_r_o,
		bat_l_y_o => bat_l_o,
		ball_x_o => ball_x_reg,
		ball_y_o => ball_y_reg
	);
	ball_speed_instance : entity work.bs
	port map (
		clk_i	=> clk_i,
		rst_i 	=> rst_i,
		pos_x_i => ball_x_reg,
		pos_y_i => ball_y_reg,
		eof_i 	=> eof,
		vel_o	=> ball_speed_o
	);
	-- end of frame signal
	eof <= '1' when col_ptr = 639 and row_ptr = 479 else '0';
	-- Outputs for the color_adder
	col_counter <= std_logic_vector(resize(unsigned(col_ptr), 10));
	row_counter <= std_logic_vector(resize(unsigned(row_ptr), 10));

end architecture ; -- Behavioral