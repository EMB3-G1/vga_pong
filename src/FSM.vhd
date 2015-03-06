----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:54:20 02/19/2015 
-- Design Name: 
-- Module Name:    FSM - Behavioral 
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity LEDs_blink is
Port (
		clk_200M_i				: in  STD_LOGIC;
        BUTTON   			    : in  STD_LOGIC;
        RESET                   : in  STD_LOGIC;
		LED_1					: out STD_LOGIC;
		LED_2					: out STD_LOGIC;
		LED_3					: out STD_LOGIC;
		LED_4_ON                : out STD_LOGIC
	  );
end LEDs_blink;

architecture Behavioral of LEDs_blink is

    type state_type is (LED_1_ON, LED_2_ON, LED_3_ON, LED_4_ON);
    signal next_state: state_type := LED_1_ON;
    signal current_state: state_type := LED_1_ON;
	signal button_sign 	: std_logic;
		 
	begin
    process(current_state, BUTTON, RESET)
    begin
        case current_state is
            when LED_1_ON =>
                if( BUTTON = '1') then
                    next_state <= LED_2_ON;
                else
                    next_state <= LED_1_ON;
                    LED_1 <= '1';
                end if;
            when LED_2_ON =>
                if( BUTTON = '1') then
                    next_state <= LED_3_ON;
                else
                    next_state <= LED_2_ON;
                    LED_2 <= '1';
                end if;
            when LED_3_ON =>
                if( BUTTON = '1') then
                    next_state <= LED_4_ON;
                else
                    next_state <= LED_3_ON;
                    LED_3 <= '1';
                end if;
            when LED_4_ON =>
                if( BUTTON = '1') then
                    next_state <= LED_1_ON;
                else
                    next_state <= LED_4_ON;
                    LED_4 <= '1';
                end if;
            end case;
    end process;
	 
	 process (clk_200M_i)
	 begin
		if(clk_200M_i'event AND clk_200M_i='1') then
			current_state<= next_state;
		end if;
	end process;
	 
end Behavioral;