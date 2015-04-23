----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Patrick Stolc
-- 
-- Create Date:    
-- Design Name: 
-- Module Name:    sr5 - behavioral
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
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity sr5 is
	port (
		clk_i : in std_logic;
		bit_i : in std_logic;
		bit_o : out std_logic
	);
end sr5;

architecture behavioral of sr5 is
	signal sreg : std_logic_vector(4 downto 0);
begin

	process(clk_i)	
	begin
		if rising_edge(clk_i) then
			for i in 0 to 3 loop
				sreg(i+1) <= sreg(i);
			end loop;
			sreg(0) <= bit_i;
		end if;
	end process;
	bit_o <= sreg(4);
	
end architecture ; -- behavioral