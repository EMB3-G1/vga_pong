----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Patrick Stolc
-- 
-- Create Date:    
-- Design Name: 
-- Module Name:    vga_decoder - Behavioral
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


entity pixel_ptr is
	generic (
		CLK_DIV : integer := 1;
		COL_DATA_WIDTH : integer := 10;
		ROW_DATA_WIDTH : integer := 10;
		PIX_DATA_WIDTH	: integer := 15;
		H_PIXELS : integer := 640;
		constant V_PIXELS : integer := 480
	);
	port (
		clk_i : in std_logic;
		rst_i : in std_logic;
		h_sync_i : in std_logic;
		v_sync_i : in std_logic;
		cptr_o : out unsigned(COL_DATA_WIDTH-1 downto 0);
		rptr_o : out unsigned(ROW_DATA_WIDTH-1 downto 0)
	);
end pixel_ptr;

architecture Behavioral of pixel_ptr is
	-- state enumeration
	type state_type is (
		WAIT_VSYNC, 
		ASSERT_FRAME,		
		COUNT_VSYNC_VBP,
		PIXEL_ROW,
		PIXEL_HSYNC_LOW,
		PIXEL_HSYNC_HIGH,
		PIXEL_BP
	);
	
	-- states
	signal cur_state : state_type := WAIT_VSYNC;
	signal nxt_state : state_type := WAIT_VSYNC;
	-- pointers
	signal r_ptr_reg : unsigned(COL_DATA_WIDTH-1 downto 0) := (others=>'1');
	signal c_ptr_reg : unsigned(ROW_DATA_WIDTH-1 downto 0) := (others=>'1');
	signal r_ptr_nxt : unsigned(COL_DATA_WIDTH-1 downto 0) := (others=>'1');
	signal c_ptr_nxt : unsigned(ROW_DATA_WIDTH-1 downto 0) := (others=>'1');
	-- registers
	signal col_idx_reg : unsigned(COL_DATA_WIDTH-1 downto 0) := (others => '0');
	signal row_idx_reg : unsigned(ROW_DATA_WIDTH-1 downto 0) := (others => '0');
	signal pxl_cnt_reg : unsigned(PIX_DATA_WIDTH-1 downto 0) := (others => '0');
	signal col_idx_nxt : unsigned(COL_DATA_WIDTH-1 downto 0);	
	signal row_idx_nxt : unsigned(ROW_DATA_WIDTH-1 downto 0);
	signal pxl_cnt_nxt : unsigned(PIX_DATA_WIDTH-1 downto 0);
	signal v_sync_reg : std_logic := '1';
	signal h_sync_reg : std_logic := '1';

begin

	-- register process
	reg_proc : process(clk_i)
	begin
		if rising_edge(clk_i) then
			if rst_i = '0' then
				cur_state <= WAIT_VSYNC;	
				col_idx_reg <= (others => '0');
				row_idx_reg <= (others => '0');
				pxl_cnt_reg <= (others => '0');
				-- pointers
				r_ptr_reg <= (others=>'1');
				c_ptr_reg <= (others=>'1');
			else
				cur_state <= nxt_state;
				col_idx_reg <= col_idx_nxt;
				row_idx_reg <= row_idx_nxt;
				pxl_cnt_reg <= pxl_cnt_nxt;
				-- pointers
				r_ptr_reg <= r_ptr_nxt;
				c_ptr_reg <= c_ptr_nxt;
				v_sync_reg <= v_sync_i;
				h_sync_reg <= h_sync_i;
				-- output
				cptr_o <= c_ptr_reg;
				rptr_o <= r_ptr_reg;
			end if;
		end if;
	end process;

	
	process(cur_state, col_idx_reg, row_idx_reg, pxl_cnt_reg, c_ptr_reg, r_ptr_reg, v_sync_reg, h_sync_reg)
	begin
		nxt_state <= cur_state;
		col_idx_nxt <= col_idx_reg;
		row_idx_nxt <= row_idx_reg;
		pxl_cnt_nxt <= pxl_cnt_reg;
		
		c_ptr_nxt <= c_ptr_reg;
		r_ptr_nxt <= r_ptr_reg;

		case cur_state is
		when WAIT_VSYNC =>
			if(v_sync_reg = '0') then
				row_idx_nxt <= (others=>'0');
				nxt_state <= COUNT_VSYNC_VBP;
			end if;
		when COUNT_VSYNC_VBP =>
			if(pxl_cnt_reg = 27999) then
				pxl_cnt_nxt <= (others=>'0');
				nxt_state <= PIXEL_HSYNC_LOW;
			else
				pxl_cnt_nxt <= pxl_cnt_reg + 1;
			end if;


		when PIXEL_HSYNC_LOW =>
			if(h_sync_reg = '0') then
				nxt_state <= PIXEL_HSYNC_HIGH;
			end if;
		when PIXEL_HSYNC_HIGH =>
			if(h_sync_reg = '1') then
				pxl_cnt_nxt <= pxl_cnt_reg + 1;
				nxt_state <= PIXEL_BP;
			end if;
		when PIXEL_BP =>
			if(pxl_cnt_reg = 47) then
				pxl_cnt_nxt <= (others=>'0');
				col_idx_nxt <= col_idx_reg + 1;
				nxt_state <= PIXEL_ROW;
			else
				pxl_cnt_nxt <= pxl_cnt_reg + 1;
			end if;
		when PIXEL_ROW =>
			if(col_idx_reg = H_PIXELS) then
				col_idx_nxt <= (others=>'1');
				c_ptr_nxt <= (others=>'1');
				nxt_state <= ASSERT_FRAME;
			else
				col_idx_nxt <= col_idx_reg + 1;
				c_ptr_nxt <= c_ptr_reg + 1;
			end if;
		when ASSERT_FRAME =>
			if(row_idx_reg = V_PIXELS) then
				row_idx_nxt <= (others=>'1');
				r_ptr_nxt <= (others=>'1');
				nxt_state <= WAIT_VSYNC;
			else
				row_idx_nxt <= row_idx_reg + 1;
				r_ptr_nxt <= r_ptr_reg + 1;
				nxt_state <= PIXEL_HSYNC_LOW;
			end if;
		when others =>
			nxt_state <= WAIT_VSYNC;
		end case;
	end process;

end architecture ; -- Behavioral