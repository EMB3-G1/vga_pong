----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:48:20 01/16/2014 
-- Design Name: 
-- Module Name:    top - Behavioral 
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
use work.common.all;
 

Library UNISIM;
use UNISIM.vcomponents.all;

library utility_v01_00_a;
use utility_v01_00_a.log_pkg.all;

entity top is
	generic(
		COL_DATA_WIDTH : integer := 10
	);
   port ( 
		-- onboard clock input
		clk_200M_i 				: in  	std_logic;

		-- onboard USB-UART interface (FT232H)
		ft232h_rst_o			: out 	std_logic;
		ft232h_acbus7_i 		: in  	std_logic;
		ft232h_rs232_rx_i		: in  	std_logic;
		ft232h_rs232_tx_o 	: out		std_logic;
		
		-- onboard leds output
		led_o 					: out  	std_logic_vector (6 downto 0);
		
		-- Baseboard 4-bit dip-switch input
		dip_sw_i					: in		std_logic_vector (3 downto 0);
		
		-- J7-connector: Digital (PS2, 8-bit dip-switch, 2x push-buttons) expantion board io
		j7_dip_sw_i 			: in  	std_logic_vector (7 downto 0);
		j7_btn_i 				: in  	std_logic_vector (1 downto 0);
		j7_ps2_clk_io			: inout  std_logic;
		j7_ps2_data_io			: inout  std_logic;
		
		-- J8-connector: VGA-output expantion board
		j8_vga_hsync_o			: out		std_logic;
		j8_vga_vsync_o			: out		std_logic;
		j8_vga_red_o			: out		std_logic_vector (2 downto 0);
		j8_vga_green_o			: out		std_logic_vector (2 downto 0);
		j8_vga_blue_o			: out		std_logic_vector (2 downto 0);
		 
		-- FX2-connector: VGA ADC input board
		fx2_vga_hsync_i		: in		std_logic;
		fx2_vga_vsync_i		: in		std_logic;
		  
		fx2_vga_red_clk_o		: out		std_logic;
		fx2_vga_red_i			: inout 	std_logic_vector (9 downto 0);
		
		fx2_vga_green_clk_o	: out		std_logic;
		fx2_vga_green_i		: inout 	std_logic_vector (9 downto 0);

		fx2_vga_blue_clk_o	: out		std_logic;
		fx2_vga_blue_i			: inout 	std_logic_vector (9 downto 0)		
	);
end top;
 
architecture Behavioral of top is

	signal clk_100M7  	  : std_logic; -- pipeline clock @ 4x pixel clock
	signal clk_100M7_180	  : std_logic; -- pipeline clock @ 4x pixel clock 180 degrees phase shifted
	signal clk25M  	  : std_logic; -- pipeline clock pixel clock
	signal clk25M_180	  : std_logic; -- pipeline clock pixel clock 180 degrees phase shifted
	
--	signal clk_100M7_pxlce : std_logic; -- clock-enable signal synchronous to 'vga_pxl_pseudo_clk' but only one clk_100M7'period wide
--	signal clk_100M7_ce_cnt_reg : unsigned(1 downto 0) := "00";	
	
	signal vga_sample_r_pseudo_clk : std_logic; -- signal with a clock like waveform for the ADC's @ 100.7 Mhz	(4x oversampling)
	signal vga_sample_g_pseudo_clk : std_logic; -- signal with a clock like waveform for the ADC's @ 100.7 Mhz	(4x oversampling)
	signal vga_sample_b_pseudo_clk : std_logic; -- signal with a clock like waveform for the ADC's @ 100.7 Mhz	(4x oversampling)
	
	signal resetn: std_logic := '1'; -- active low reset signal

	signal up, down, stop : std_logic;
	
	signal div4_cnt_reg : unsigned(1 downto 0) := (others=>'0');
	signal div4_cnt_nxt : unsigned(1 downto 0);
	
	signal vga_pxlce_reg : std_logic := '0';	-- vga pixel clock clock enable register (the actual pixel clock for 640x480 vga signal @ 60Hz is 25.175 MHz)
	
	signal hsync_sreg : std_logic_vector(4 downto 0) := (others=>'0');
	signal vsync_sreg : std_logic_vector(4 downto 0) := (others=>'0');
	
	-- For the preprocessor 
	signal h_sync_pre_o : std_logic:= '1';
	signal v_sync_pre_o : std_logic:= '1';
	signal rgb_pre : std_logic_vector(3*3-1 downto 0) := (others=>'0');
	
	-- VGA generator
	signal hs_vga_gen : std_logic;
	signal vs_vga_gen : std_logic;
	signal r_vga_gen	: std_logic_vector(2 downto 0);
	signal g_vga_gen	: std_logic_vector(2 downto 0);
	signal b_vga_gen  : std_logic_vector(2 downto 0);
	
	-- Signals to connect the filter module to the VGA-output
	signal red_filtered : std_logic_vector(9 downto 0);
	signal green_filtered : std_logic_vector(9 downto 0);
	signal blue_filtered : std_logic_vector(9 downto 0);
	
	-- Interpreter-Microblaze-Color_adder connections
	signal bat_l_pos : std_logic_vector(9 downto 0);
	signal bat_r_pos : std_logic_vector (9 downto 0);
	signal ball_X_pos : std_logic_vector(9 downto 0);
	signal ball_Y_pos : std_logic_vector(9 downto 0);
	signal ball_speed : std_logic_vector (9 downto 0);
	signal new_frame : std_logic;
	signal usr_buttons : std_logic_vector (1 downto 0);
	signal ai_enable : std_logic_vector (3 downto 0);
	
	-- Color_adder signals
	signal rgb_o_colAdder : std_logic_vector(8 downto 0);
	
	-- function definition (one way to implement combinatorial logic... allowing great code-reuse!!!)
	function one_hot_sum(data : std_logic_vector) return std_logic_vector is
		variable sum : unsigned(log2i(data'length)-1 downto 0);
	begin		
		sum := (others=>'0');
		for i in 0 to data'length-1 loop
			if data(i)='1' then
				sum := sum + 1;
			end if;
		end loop;
		return std_logic_vector(sum);
	end one_hot_sum;
	
	COMPONENT preprocessor
	PORT(
		clk25M_i : IN std_logic;
		clk100M_i : IN std_logic;
		rst_i : IN std_logic;
		r_i : IN std_logic_vector(9 downto 0);
		g_i : IN std_logic_vector(9 downto 0);
		b_i : IN std_logic_vector(9 downto 0);
		h_sync_i : IN std_logic;
		v_sync_i : IN std_logic;          
		rgb_o : OUT std_logic_vector(8 downto 0);
		h_sync_o : OUT std_logic;
		v_sync_o : OUT std_logic
	);
	END COMPONENT;
	
	COMPONENT median_filter 
	port(
		clk_100M_i : in std_logic;
		rst_i	: in std_logic;
		red_i	: in std_logic_vector (COL_DATA_WIDTH-1 downto 0);
		green_i	: in std_logic_vector (COL_DATA_WIDTH-1 downto 0);
		blue_i	: in std_logic_vector (COL_DATA_WIDTH-1 downto 0);
		red_o	: out std_logic_vector (COL_DATA_WIDTH-1 downto 0);
		blue_o: out std_logic_vector (COL_DATA_WIDTH-1 downto 0);
		green_o: out std_logic_vector (COL_DATA_WIDTH-1 downto 0)
	);
	END COMPONENT;
	
	COMPONENT interpreter
	port (
		clk_i 	: in std_logic;
		rst_i 	: in std_logic;
		h_sync_i : in std_logic;
		v_sync_i : in std_logic;
		rgb_i 	: in std_logic_vector(8 downto 0);
		bat_r_o 	: out std_logic_vector(9 downto 0);
		bat_l_o 	: out std_logic_vector(9 downto 0);
		ball_x_o : out std_logic_vector(9 downto 0);
		ball_y_o : out std_logic_vector(9 downto 0);
		ball_speed_o : out std_logic_vector(9 downto 0);
		end_frame_o : out std_logic
	);
	END COMPONENT;
	
	COMPONENT color_adder
	port (
		clk_i 	: in std_logic;
		rst_i 	: in std_logic;
		ball_x_i : in std_logic_vector(9 downto 0);
		ball_y_i : in std_logic_vector(9 downto 0);
		h_sync_i : in std_logic;
		v_sync_i : in std_logic;
		bat_r_i 	: in std_logic_vector(9 downto 0);
		bat_l_i 	: in std_logic_vector(9 downto 0);
		ball_speed_i : in std_logic_vector(9 downto 0);
		rgb_output : out std_logic_vector (8 downto 0)
	);
	END COMPONENT;
	
	
begin

	-------COMPONENTS INSTANTIATION-------
		
	-- preprocessor
	preprocessor_inst : preprocessor
	port map (
		clk25M_i => clk25M,
		clk100M_i => clk_100M7,
		rst_i => resetn, 	
		r_i => fx2_vga_red_i,
		g_i => fx2_vga_green_i,
		b_i => fx2_vga_blue_i,
		h_sync_i => fx2_vga_hsync_i,
		v_sync_i => fx2_vga_vsync_i,
		rgb_o => rgb_pre,
		h_sync_o => h_sync_pre_o,
		v_sync_o => v_sync_pre_o
	);
	
	-- Filters
	filter_inst : median_filter
	port map(
		clk_100M_i 	=>	clk_100M7,
		rst_i			=> resetn,
		red_i			=> fx2_vga_red_i,
		green_i		=> fx2_vga_green_i,
		blue_i		=> fx2_vga_blue_i, 
		red_o			=> red_filtered,
		blue_o		=> blue_filtered,
		green_o		=> green_filtered
	);
	
	-- Postprocessor
	interpreter_inst : interpreter
	port map(
		clk_i 	=>	clk25M,
		rst_i 	=>	resetn,
		h_sync_i =>	h_sync_pre_o,	
		v_sync_i =>	v_sync_pre_o,
		rgb_i 	=>	red_filtered(9 downto 7) & green_filtered(9 downto 7) & blue_filtered(9 downto 7),
		bat_r_o 	=> bat_r_pos,
		bat_l_o 	=> bat_l_pos,
		ball_x_o => ball_X_pos, 
		ball_y_o => ball_Y_pos,
		ball_speed_o => ball_speed, 
		end_frame_o => new_frame
	);  
	--********************************
	color_adder_inst : color_adder
	port map(
		clk_i 	=> clk25M,
		rst_i 	=>	resetn,
		ball_x_i => ball_X_pos,
		ball_y_i =>	ball_Y_pos,
		h_sync_i =>	h_sync_pre_o,	
		v_sync_i =>	v_sync_pre_o,
		bat_r_i 	=> bat_r_pos,
		bat_l_i 	=> bat_l_pos,
		ball_speed_i => ball_speed,
		rgb_output => rgb_o_colAdder
	);
	
	
	fx2_vga_red_clk_o		<= vga_sample_r_pseudo_clk;	-- RED color channel ADC "clock" output (a real clock i not used because the FPGA pin used is not a clock pin!)
	fx2_vga_green_clk_o	<= vga_sample_g_pseudo_clk;	-- GREEN color channel ADC "clock" output (a real clock i not used because the FPGA pin used is not a clock pin!)
	fx2_vga_blue_clk_o	<= vga_sample_b_pseudo_clk;	-- BLUE color channel ADC "clock" output (a real clock i not used because the FPGA pin used is not a clock pin!)
	
	-- VGA generator
	vga_generator_inst : entity work.vga_generator
	generic map(
		G_COLOR_WIDTH  => 3,
		G_CLK_DIV		=> 4		-- input clock is 100.7 MHz (4x faster than the desired pixel clock)
	)
	port map( 
		clk_i	=> clk_100M7,
		r_o   => r_vga_gen,
		g_o   => g_vga_gen,
		b_o   => b_vga_gen,
		hs_o  => hs_vga_gen,
		vs_o  => vs_vga_gen
	);	
	
	-------COMPONENTS INSTANTIATION END-------
	
	-- Clock generator to condition the 200MHz clock from the onboard oscillator.
	-- In this case it is configured to generate two 100.7MHz clocks!
		DCM_CLKGEN_inst : DCM_CLKGEN 
		generic map (
			CLKFXDV_DIVIDE 	=> 2,       	-- CLKFXDV divide value (2, 4, 8, 16, 32)
			CLKFX_DIVIDE 		=> 143,       	-- Divide value - D - (1-256)
			CLKFX_MD_MAX		=> 0.251748,  	-- Specify maximum M/D ratio for timing anlysis
			CLKFX_MULTIPLY 	=> 72,       	-- Multiply value - M - (2-256)
			CLKIN_PERIOD 		=> 5.0,       	-- Input clock period specified in nS
			SPREAD_SPECTRUM 	=> "NONE", 		-- Spread Spectrum mode "NONE", "CENTER_LOW_SPREAD", "CENTER_HIGH_SPREAD", "VIDEO_LINK_M0", "VIDEO_LINK_M1" or "VIDEO_LINK_M2" 
			STARTUP_WAIT 		=> FALSE      	-- Delay config DONE until DCM_CLKGEN LOCKED (TRUE/FALSE)
		)
		port map (
			CLKFX 		=> clk_100M7,  		-- 1-bit output: Generated clock output
			CLKFX180 	=> clk_100M7_180,   	-- 1-bit output: Generated clock output 180 degree out of phase from CLKFX.
			CLKFXDV 		=> open,			-- 1-bit output: Divided clock output
			LOCKED 		=> resetn,     -- 1-bit output: Locked output
			PROGDONE 	=> open,   		-- 1-bit output: Active high output to indicate the successful re-programming
			STATUS 		=> open,     	-- 2-bit output: DCM_CLKGEN status
			CLKIN 		=> clk_200M_i,	-- 1-bit input: Input clock
			FREEZEDCM 	=> '0', 			-- 1-bit input: Prevents frequency adjustments to input clock
			PROGCLK 		=> '0',    		-- 1-bit input: Clock input for M/D reconfiguration
			PROGDATA 	=> '0',   		-- 1-bit input: Serial data input for M/D reconfiguration
			PROGEN 		=> '0',     	-- 1-bit input: Active high program enable
			RST 			=> '0'         -- 1-bit input: Reset input pin
		);	
		
		-- Generation of the 25MHz clock signal
		DCM_CLKGEN_inst25 : DCM_CLKGEN
		generic map (
			CLKFXDV_DIVIDE => 2,
			CLKFX_DIVIDE => 143,
			CLKFX_MD_MAX => 0.251748,
			CLKFX_MULTIPLY => 18,
			CLKIN_PERIOD => 5.0,
			SPREAD_SPECTRUM => "NONE",
			STARTUP_WAIT => FALSE
		)
		port map (
			CLKFX => 	clk25M,
			CLKFX180 => clk25M_180,
			CLKFXDV => 		open,
			LOCKED => 		open,
			PROGDONE => 	open,
			STATUS =>	 	open,
			CLKIN => 	clk_200M_i,
			FREEZEDCM => 	'0',
			PROGCLK => 		'0',
			PROGDATA => 	'0',
			PROGEN => 		'0',
			RST => 			'0'
		);

	
			-- ODDR2: Output Double Data Rate Output Register with Set, Reset and Clock Enable. 
			-- Spartan-6
			-- Xilinx HDL Language Template, version 14.7
			
			ODDR2_inst_R : ODDR2
			generic map(
				DDR_ALIGNMENT 	=> "NONE", 	-- Sets output alignment to "NONE", "C0", "C1" 
				INIT 				=> '0', 		-- Sets initial state of the Q output to '0' or '1'
				SRTYPE 			=> "SYNC" 	-- Specifies "SYNC" or "ASYNC" set/reset
				)
			port map (
				Q  => vga_sample_r_pseudo_clk,  -- 1-bit output data
				C0 => clk_100M7, 					-- 1-bit clock input
				C1 => clk_100M7_180, 			-- 1-bit clock input
				CE => '1',  						-- 1-bit clock enable input
				D0 => '1',   						-- 1-bit data input (associated with C0)
				D1 => '0',   						-- 1-bit data input (associated with C1)
				R  => '0',    						-- 1-bit reset input
				S  => '0'     						-- 1-bit set input
			);
			
			ODDR2_inst_G : ODDR2
			generic map(
				DDR_ALIGNMENT 	=> "NONE", 	-- Sets output alignment to "NONE", "C0", "C1" 
				INIT 				=> '0', 		-- Sets initial state of the Q output to '0' or '1'
				SRTYPE 			=> "SYNC" 	-- Specifies "SYNC" or "ASYNC" set/reset
				)
			port map (
				Q  => vga_sample_g_pseudo_clk,  -- 1-bit output data
				C0 => clk_100M7, 					-- 1-bit clock input
				C1 => clk_100M7_180, 			-- 1-bit clock input
				CE => '1',  						-- 1-bit clock enable input
				D0 => '1',   						-- 1-bit data input (associated with C0)
				D1 => '0',   						-- 1-bit data input (associated with C1)
				R  => '0',    						-- 1-bit reset input
				S  => '0'     						-- 1-bit set input
			);

			ODDR2_inst_B : ODDR2
			generic map(
				DDR_ALIGNMENT 	=> "NONE", 	-- Sets output alignment to "NONE", "C0", "C1" 
				INIT 				=> '0', 		-- Sets initial state of the Q output to '0' or '1'
				SRTYPE 			=> "SYNC" 	-- Specifies "SYNC" or "ASYNC" set/reset
				)
			port map (
				Q  => vga_sample_b_pseudo_clk,  -- 1-bit output data
				C0 => clk_100M7, 					-- 1-bit clock input
				C1 => clk_100M7_180, 			-- 1-bit clock input
				CE => '1',  						-- 1-bit clock enable input
				D0 => '1',   						-- 1-bit data input (associated with C0)
				D1 => '0',   						-- 1-bit data input (associated with C1)
				R  => '0',    						-- 1-bit reset input
				S  => '0'     						-- 1-bit set input
			);			

--		-- 25.175MHz pixel-clock clock-enable signal generation for the 100.7 MHz clock
--		process(clk_100M7)
--		begin
--			if rising_edge(clk_100M7) then
--				if resetn='0' then
--					clk_100M7_pxlce <= '1';
--					clk_100M7_ce_cnt_reg <= "00";
--				else
--					clk_100M7_pxlce <= '0';
--					if clk_100M7_ce_cnt_reg="11" then
--						clk_100M7_pxlce <= '1';
--					end if;
--					clk_100M7_ce_cnt_reg <= clk_100M7_ce_cnt_reg+1;					
--				end if;
--			end if;
--		end process;

		-- clocked LED register process
		process(clk_100M7)
		begin
			if rising_edge(clk_100M7) then					
				if resetn='0' then			
					led_o <= (others=>'0');
				else
					if j7_btn_i(0)='1' then
						led_o(3 downto 0) <= one_hot_sum((dip_sw_i & j7_dip_sw_i));
					else
						led_o(3 downto 0) <= not one_hot_sum((dip_sw_i & j7_dip_sw_i));
					end if;					
					
					led_o(4) <= not j7_btn_i(1);
				
					if up='1' then
						led_o(5) <= '1';			
					elsif stop='1' then
						led_o(5) <= '0';
					end if;
					
					if down='1' then
						led_o(6) <= '1';			
					elsif stop='1' then
						led_o(6) <= '0';
					end if;
					
				end if;			
			end if;
		end process;


	-- UART
	
		-- ft232h_acbus7_i needs to be a high-impedance input => external pull-up powered by USB-power will pull this pin high when a the FT232H chip is connected to a PC
		-- ft232h_rst_o is an active low reset, with external pull-up connected to VCC = 3.3V, piping the logic value of ft232h_acbus7_i to ft232h_rst_o will reset the FT232IC when it is not connected to a PC!
		ft232h_rst_o <= ft232h_acbus7_i;
			
		-- simple loop-through UART test logic
		ft232h_rs232_tx_o <= ft232h_rs232_rx_i;
		
		
		process(clk_100M7)
		begin
			if rising_edge(clk_100M7) then
				if resetn='0' then
					j8_vga_hsync_o <= '0';
					j8_vga_vsync_o <= '0';				
					j8_vga_red_o	<= (others=>'0');
					j8_vga_green_o	<= (others=>'0');
					j8_vga_blue_o	<= (others=>'0');
				else

					-- Multiplexer process:
					-- Final output
					if j7_dip_sw_i(7) = '0' and j7_dip_sw_i(6) = '0' then		
						j8_vga_hsync_o <= h_sync_pre_o;
						j8_vga_vsync_o <= v_sync_pre_o;
						j8_vga_red_o	<= rgb_o_colAdder(8 downto 6);
						j8_vga_green_o	<= rgb_o_colAdder(5 downto 3);
						j8_vga_blue_o	<= rgb_o_colAdder(2 downto 0);
					-- VGA generated output
					elsif j7_dip_sw_i(7) = '1' and j7_dip_sw_i(6) = '0' then
						j8_vga_hsync_o <= hs_vga_gen;
						j8_vga_vsync_o <= vs_vga_gen;
						j8_vga_red_o	<= r_vga_gen;
						j8_vga_green_o	<= g_vga_gen;
						j8_vga_blue_o	<= b_vga_gen;
					elsif j7_dip_sw_i(7) = '0' and j7_dip_sw_i(6) = '1' then
					-- Filtered input
						j8_vga_hsync_o <=  h_sync_pre_o;
						j8_vga_vsync_o <=  v_sync_pre_o;
						j8_vga_red_o <= red_filtered(9 downto 7);
						j8_vga_blue_o	<= blue_filtered(9 downto 7);
						j8_vga_green_o <= green_filtered(9 downto 7);
					else 
						j8_vga_hsync_o <= hs_vga_gen;
						j8_vga_vsync_o <= vs_vga_gen;
						j8_vga_red_o	<= r_vga_gen;
						j8_vga_green_o	<= g_vga_gen;
						j8_vga_blue_o	<= b_vga_gen;
						
					end if;
					
				end if;
			end if;
		end process;		

end Behavioral;

