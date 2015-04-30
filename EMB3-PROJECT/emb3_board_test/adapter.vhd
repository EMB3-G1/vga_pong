library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.common.all;

entity adapter is
	generic (
		CLK_DIV : integer := 1;
		COL_DATA_WIDTH : integer := 10;
		ROW_DATA_WIDTH : integer := 10
	);
	port (
		clk_i : in std_logic;
		rst_i : in std_logic;
		h_sync_i : in std_logic;
		v_sync_i : in std_logic;
		cptr_o : out unsigned(COL_DATA_WIDTH-1 downto 0);
		rptr_o : out unsigned(ROW_DATA_WIDTH-1 downto 0)
	);
end adapter;

architecture Behavioral of adapter is

	type state_machine is(
		HSYNC_LOW,
		WAIT_HBP,
		WAIT_HFP,





	);

	signal px_clk_en : std_logic := '0';
	signal clk_cnt : integer range 0 to CLK_DIV-1 := 0;

	signal h_sync_reg : std_logic := '1';
	signal v_sync_reg : std_logic := '1';
	signal c_ptr_o_reg : unsigned (COL_DATA_WIDTH-1 downto 0):= (others:='1');
	signal r_ptr_o_reg : unsigned (ROW_DATA_WIDTH-1 downto 0):= (others:='1');

begin

	-- Make the signals go trought a register
	reg_proc: process(clk_i)
	begin
		if(rising_edge(clk_i)) then
			if(rst_i='1') then

			else
				-- pointers
				h_sync_reg <= h_sync_i;
				v_sync_reg <= v_sync_i;
				--output
				cptr_o <= c_ptr_o_reg;
				rptr_o <= r_ptr_o_reg;
			end if;
		end if;
	end process;






