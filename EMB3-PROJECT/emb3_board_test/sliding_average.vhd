----------------------------------------------------------------------------------
-- Company: University Of Southern Denmark
-- Engineer: Anders Blaabjerg Lange
-- 
-- Create Date:    11:10:00 06/02/2012 
-- Design Name: 
-- Module Name:    sliding-average - Behavioral 
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


entity sliding_average is 
	port (	
		filter_clk			: in	std_logic;
		filter_reset		: in	std_logic;
		adc_i					: in	std_logic_vector(9 downto 0);
		dac_o					: out	std_logic_vector(9 downto 0);
		adc_clk_o			: out	std_logic;
		dac_clk_o			: out	std_logic		
		);
end sliding_average;

architecture Behavioral of sliding_average is

	----------------------------------------------------------------
	-- constant declarations: length of the mask
	----------------------------------------------------------------
		constant C_DATA_CNT 	: integer := 21;
	----------------------------------------------------------------
	
	----------------------------------------------------------------
	-- type declarations
	----------------------------------------------------------------
		type slav_array_type is array(integer range <>) of unsigned(9 downto 0);
	----------------------------------------------------------------
	
	----------------------------------------------------------------
	-- signal declarations
	----------------------------------------------------------------
		signal slav_delay					: slav_array_type(0 to C_DATA_CNT-1) := (others=>(others=>'0'));
		
begin
	
	----------------------------------------------------------------
	-- Median average 
	----------------------------------------------------------------
		process(filter_clk)
			variable counter_black : integer range 0 to C_DATA_CNT+1:=C_DATA_CNT;
			variable counter_white : integer range 0 to C_DATA_CNT+1:=0;

		begin
			if rising_edge(filter_clk) then
				if(filter_reset = '1') then
					counter_black :=C_DATA_CNT;
					counter_white :=0;
				else
					
					slav_delay(0) <= unsigned(adc_i);
					
					if(slav_delay(0)>128) then
						counter_white:=counter_white+1;
					else 
						counter_black:= counter_black+1;
					end if;
					
					if(slav_delay(C_DATA_CNT-1)>128) then
						counter_white:=counter_white-1;
					else 
						counter_black:= counter_black-1;
					end if;
					
					for i in 1 to C_DATA_CNT-1 loop				
						slav_delay(i) <= slav_delay(i-1);
					end loop;
					
					if (counter_white>(C_DATA_CNT+1)/2 or counter_white=(C_DATA_CNT+1)/2) then
						dac_o <= "1111111111";
					else
						dac_o <= "0000000000";
					end if;									

				end if;
			end if;
		end process;

end Behavioral;