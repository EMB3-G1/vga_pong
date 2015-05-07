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
--use work.common.all;

entity preprocessor is
	generic(
		constant COLOR_DATA_WIDTH : integer := 3;
		constant ADC_DATA_WIDTH : integer := 10
	); 
	port (
		-- general
		clk25M_i : in std_logic;
		clk100M_i : in std_logic;
		rst_i : in std_logic;
		-- color input
		r_i : in std_logic_vector(ADC_DATA_WIDTH-1 downto 0);
		g_i : in std_logic_vector(ADC_DATA_WIDTH-1 downto 0);
		b_i : in std_logic_vector(ADC_DATA_WIDTH-1 downto 0);
		-- sync input
		h_sync_i : in std_logic;
		v_sync_i : in std_logic;
		-- color output
		rgb_o : out std_logic_vector(3*COLOR_DATA_WIDTH-1 downto 0);
		-- sync output
		h_sync_o : out std_logic;
		v_sync_o : out std_logic
	);
end preprocessor;

architecture behavioral of preprocessor is

	signal rgb_reg : std_logic_vector(3*COLOR_DATA_WIDTH-1 downto 0);

begin
	h_sync_sr5_inst : entity work.sr5
	port map (
		clk_i => clk100M_i,
		bit_i => h_sync_i,
		bit_o => h_sync_o
	);
	v_sync_sr5_inst : entity work.sr5
	port map (
		clk_i => clk100M_i,
		bit_i => v_sync_i,
		bit_o => v_sync_o
	);
	
	process(clk25M_i)
	begin
		if(rising_edge(clk25M_i)) then
			rgb_reg <= r_i(9 downto 7) & g_i(9 downto 7) & b_i(9 downto 7);
			rgb_o <= rgb_reg;
		end if;
	end process;
	-- end sr5 v-sync instance
end behavioral; -- behavioral