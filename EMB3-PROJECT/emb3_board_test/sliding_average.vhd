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
	-- constant declarations
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
		signal sum_sig 					: unsigned(13 downto 0 );
		signal division_dividend		: unsigned(13 downto 0);
		signal division_quotient		: unsigned(13 downto 0);
		signal division_quotient_slv	: std_logic_vector(13 downto 0);
	----------------------------------------------------------------
	
	----------------------------------------------------------------
	-- component declarations
	----------------------------------------------------------------
		component divider
			port (
			clk: in std_logic;
			rfd: out std_logic;
			dividend: in std_logic_vector(13 downto 0);
			divisor: in std_logic_vector(3 downto 0);
			quotient: out std_logic_vector(13 downto 0);
			fractional: out std_logic_vector(3 downto 0));
		end component;
	----------------------------------------------------------------
	
begin

	----------------------------------------------------------------
	-- Clock outputs for ADC and DAC
	----------------------------------------------------------------
		adc_clk_o <= filter_clk;
		--dac_clk_o <= filter_clk;
	----------------------------------------------------------------
	
	----------------------------------------------------------------
	-- Divider core
	----------------------------------------------------------------	
		divider_inst : divider
		port map (
			clk 			=> filter_clk,
			rfd 			=> open,
			dividend 	=> std_logic_vector(division_dividend),
			divisor 		=> std_logic_vector(to_unsigned(C_DATA_CNT,4)),
			quotient 	=> division_quotient_slv,
			fractional 	=> open
			);		
		
		division_quotient <= unsigned(division_quotient_slv);
	----------------------------------------------------------------
	
	----------------------------------------------------------------
	-- Sliding Average logic 
	----------------------------------------------------------------
		process(filter_clk)
			--variable sum	: unsigned(13 downto 0) := (others => '0');
			variable counter_black : integer range 0 to C_DATA_CNT+1:=C_DATA_CNT;
			variable counter_white : integer range 0 to C_DATA_CNT+1:=0;

		begin
			if rising_edge(filter_clk) then
				if(filter_reset = '1') then
					sum_sig <= (others => '0');
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
		
		division_dividend <= unsigned(sum_sig);
	----------------------------------------------------------------

end Behavioral;