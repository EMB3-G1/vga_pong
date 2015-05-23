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

entity median_filter is
	generic(
		constant COLOR_DATA_WIDTH : integer := 3;
		constant COL_DATA_WIDTH : integer := 10
		);
	port(
		clk_i : in std_logic;
		rst_i		: in std_logic;
		rgb_i : in std_logic_vector (3*COLOR_DATA_WIDTH-1 downto 0);
		rgb_o : out std_logic_vector (3*COLOR_DATA_WIDTH-1 downto 0)
	);
end median_filter;

architecture Behavioral of median_filter is 

	signal rgb_i_reg : std_logic_vector (3*COLOR_DATA_WIDTH-1 downto 0);
	signal rgb_o_reg : std_logic_vector (3*COLOR_DATA_WIDTH-1 downto 0);
	signal r_o_reg : std_logic_vector (COLOR_DATA_WIDTH-1 downto 0);
	signal g_o_reg : std_logic_vector (COLOR_DATA_WIDTH-1 downto 0);
	signal b_o_reg : std_logic_vector (COLOR_DATA_WIDTH-1 downto 0);

	COMPONENT sliding_average is
	port (	
		filter_clk 			: in	std_logic;
		filter_reset		: in	std_logic;
		adc_i					: in	std_logic_vector(2 downto 0);
		dac_o					: out	std_logic_vector(2 downto 0);
		adc_clk_o			: out	std_logic;
		dac_clk_o			: out	std_logic		
		);
	END COMPONENT;

begin

	process (clk_i) 
	begin
		if rising_edge(clk_i) then
			rgb_i_reg <= rgb_i;
			rgb_o <= r_o_reg & g_o_reg & b_o_reg;
		end if;
	end process;

	-- RED FILTER
	filter_inst_red: sliding_average
	port map (
		filter_clk 			=> clk_i,
		filter_reset		=> rst_i,
		adc_i				=> rgb_i_reg (8 downto 6),		
		dac_o				=> r_o_reg,
		adc_clk_o			=> open,				
		dac_clk_o			=> open
	);
	
	-- GREEN FILTER
	filter_inst_green: sliding_average
	port map (
		filter_clk 			=> clk_i,
		filter_reset		=> rst_i,
		adc_i				=> rgb_i_reg (5 downto 3),	
		dac_o				=> g_o_reg,
		adc_clk_o			=> open,
		dac_clk_o			=> open
	);
	
	-- BLUE FILTER
	filter_inst_blue: sliding_average
	port map (
		filter_clk 			=> clk_i,
		filter_reset		=> rst_i,
		adc_i				=> rgb_i_reg (2 downto 0),	
		dac_o				=> b_o_reg,
		adc_clk_o			=> open,
		dac_clk_o			=> open
	);

end Behavioral;
