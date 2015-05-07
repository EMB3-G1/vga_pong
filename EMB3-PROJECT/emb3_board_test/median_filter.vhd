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
		COL_DATA_WIDTH : integer := 10
		);
	port(
		clk_100M_i : in std_logic;
		rst_i		: in std_logic;
		
		red_i		: in std_logic_vector (COL_DATA_WIDTH-1 downto 0);
		green_i	: in std_logic_vector (COL_DATA_WIDTH-1 downto 0);
		blue_i	: in std_logic_vector (COL_DATA_WIDTH-1 downto 0);
		
		red_o		: out std_logic_vector (COL_DATA_WIDTH-1 downto 0);
		blue_o	: out std_logic_vector (COL_DATA_WIDTH-1 downto 0);
		green_o	: out std_logic_vector (COL_DATA_WIDTH-1 downto 0)
	);
end median_filter;

architecture Behavioral of median_filter is 

	COMPONENT sliding_average is
	port (	
		filter_clk 			: in	std_logic;
		filter_reset		: in	std_logic;
		adc_i					: in	std_logic_vector(9 downto 0);
		dac_o					: out	std_logic_vector(9 downto 0);
		adc_clk_o			: out	std_logic;
		dac_clk_o			: out	std_logic		
		);
	END COMPONENT;

begin

	-- RED FILTER
	filter_inst_red: sliding_average
	port map (
		filter_clk 			=> clk_100M_i,
		filter_reset		=> rst_i,
		adc_i				=> red_i,		
		dac_o				=> red_o,
		adc_clk_o			=> open,				
		dac_clk_o			=> open
	);
	
	-- GREEN FILTER
	filter_inst_green: sliding_average
	port map (
		filter_clk 			=> clk_100M_i,
		filter_reset		=> rst_i,
		adc_i				=> green_i,	
		dac_o				=> green_o,
		adc_clk_o			=> open,
		dac_clk_o			=> open
	);
	
	-- BLUE FILTER
	filter_inst_blue: sliding_average
	port map (
		filter_clk 			=> clk_100M_i,
		filter_reset		=> rst_i,
		adc_i				=> blue_i,	
		dac_o				=> blue_o,
		adc_clk_o			=> open,
		dac_clk_o			=> open
	);

end Behavioral;
