----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Patrick Stolc
-- 
-- Create Date:    
-- Design Name: 
-- Module Name:    common - Package
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
use ieee.math_real.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package common is    -- untested...
	-- SIMULATION & DEBUG
		constant SIMULATION : boolean := true;
	-- ARCHITECTURE
		type ARCH_TYPE is (
			PIPELINE,
			BUFFERED
		);
		constant ARCHITECTURE_TYPE : ARCH_TYPE := BUFFERED;
	-- peripherals
		-- ADC
		constant ADC_DATA_WIDTH : integer := 10;
		-- FLASH MEMORY
		constant flash_mem_word_size : natural := 8;
		constant flash_mem_addr_size : natural := 24;
		constant flash_mem_inst_size : natural := 8;
		constant flash_mem_dummy_clk : natural := 8;
		constant flash_mem_write_sr_size : natural := 16;
	-- end peripherals
	-- vga 
		-- IMAGE
		constant H_PIXELS : integer := 640;
		constant V_PIXELS : integer := 480;
		--
		constant COL_DATA_WIDTH : integer := 10;
		constant ROW_DATA_WIDTH : integer := 10;
		constant PIX_DATA_WIDTH : integer := 15;
		-- HORIZONTAL
		constant H_FRONT : integer := 16;
		constant H_BACK : integer := 48;
		constant H_SYNC : integer := 96;
		constant H_SYNC_OFFSET : integer := H_SYNC + H_BACK;
		constant H_LINE : integer := H_PIXELS + H_FRONT + H_BACK + H_SYNC;
		-- VERTICAL
		constant V_FRONT : integer := 10;
		constant V_BACK : integer := 33;
		constant V_SYNC : integer := 2;
		constant V_SYNC_OFFSET : integer := V_SYNC + V_BACK;
		constant V_LINE : integer := V_PIXELS + V_FRONT + V_BACK + V_SYNC;
		
	-- color
		-- DATA WIDTH
		constant COLOR_DATA_WIDTH : integer := 3;
		-- WHITE
		constant COLOR_WHITE_R : std_logic_vector(2 downto 0) := "111";
		constant COLOR_WHITE_G : std_logic_vector(2 downto 0) := "111";
		constant COLOR_WHITE_B : std_logic_vector(2 downto 0) := "111";
		-- BLACK
		constant COLOR_BLACK_R : std_logic_vector(2 downto 0) := "000";
		constant COLOR_BLACK_G : std_logic_vector(2 downto 0) := "000";
		constant COLOR_BLACK_B : std_logic_vector(2 downto 0) := "000";
	-- end color
	-- objects
		constant OBJ_POS_WIDTH : integer := 10;
		-- BALL
		constant BALL_HEIGHT : integer := 20;
		constant BALL_WIDTH : integer := 20;
		-- BAT
		constant BAT_LEFT_OFFSET_H_MIN : integer := 20;
		constant BAT_RIGHT_OFFSET_H_MIN : integer := 600;
		constant BAT_LEFT_OFFSET_H_MAX : integer := 39;
		constant BAT_RIGHT_OFFSET_H_MAX : integer := 619;
		constant BAT_HEIGHT : integer := 100;
	-- end objects
	-- filter
		constant FILTER_KERNEL_SIZE : integer := 3;
		constant FILTER_DELAY : integer := (2 * H_PIXELS - (2 * FILTER_KERNEL_SIZE)) + (3 * FILTER_KERNEL_SIZE);
		constant ROW_BUF_DEPTH : integer := 637;
	-- end filter
	-- vga decoder buffer
		constant BUFFER_DELAY : integer := 111520;
		constant FIFO_DEPTH : integer := 111520;
		constant RAM_SIZE : integer := 111520;
		constant RAM_ADDR_WIDTH : integer := 18;
		constant RAM_DATA_SIZE : integer := ((3*COLOR_DATA_WIDTH));
	-- testbench
		-- CLOCK PERIODS
		constant clk50M_tb_period : time := 20 ns;
		constant clk25M_tb_period : time := 40 ns;
		constant clk25_17M_tb_period : time := 39729837 fs;

	-- end testbench
	-- color constants
		constant color_depth 	: integer := 10;
	-- resolution constants
		constant frame_width 	: integer := 640;
		constant frame_height 	: integer := 480;
	-- vga constants
		constant c_clk_pixel_fs	: time := 39729837 fs;

		constant c_h_pixels 		: 	integer := 640;
		constant c_h_front			: 	integer := 16;
		constant c_h_back			: 	integer := 48;
		constant c_h_sync			: 	integer := 96;
		constant c_h_sync_offset	:	integer := c_h_sync + c_h_back;
		constant c_h_pixel_line 	:	integer := c_h_pixels + c_h_front + c_h_back + c_h_sync;

		constant c_v_pixels 		: 	integer := 480;
		constant c_v_front		:	integer := 10;
		constant c_v_back			:	integer := 33;
		constant c_v_sync			: 	integer	:= 2;
		constant c_v_sync_offset:	integer := c_v_sync + c_v_back;
		constant c_v_sync_line 	:	integer := c_v_pixels + c_v_front + c_v_back + c_v_sync;
	-- adc constants
		constant adc_delay 		:	integer := 5;

end common;

package body common is
   -- subprogram bodies here
end common;