----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    
-- Design Name: 
-- Module Name:    
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
use work.common.all;


entity bs is
	port (
		clk_i	:	in std_logic; 						-- frame clock 25.17 MHz
		rst_i 	:	in std_logic;
		pos_x_i : 	in std_logic_vector(OBJ_POS_WIDTH-1 downto 0);
		pos_y_i : 	in std_logic_vector(OBJ_POS_WIDTH-1 downto 0);
		eof_i 	: 	in std_logic;
		vel_o	:	out std_logic_vector(9 downto 0)
	);
end bs;

architecture Behavioral of bs is

	signal prev_pos_x : std_logic_vector(9 downto 0) := (others=>'0');
	signal prev_pos_y : std_logic_vector(9 downto 0) := (others=>'0');

begin

	process(clk_i,rst_i)
	begin
		if rising_edge(clk_i) then
			if rst_i = '0' then
				prev_pos_x <= (others => '0');
				prev_pos_y <= (others => '0');
			else
				-- compute manhattan distance as positional displacement
				vel_o <= std_logic_vector(abs(signed(pos_x_i) - signed(prev_pos_x)) + abs(signed(pos_y_i) - signed(prev_pos_y)));
				-- assert end of frame
				if(eof_i = '1') then
					prev_pos_x <= pos_x_i;
					prev_pos_y <= pos_y_i;
				end if;
			end if;
		end if;
	end process;

end architecture ; -- Behavioral







