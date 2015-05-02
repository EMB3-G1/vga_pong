library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity color_adder is
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
end color_adder;

architecture Behavioral of color_adder is

	constant BALL_WIDTH : integer := 20;
	constant BAT_WIDTH : integer := 20;
	constant BAT_LENGTH : integer := 100;
	constant RBAT_X1 : integer := 600;
	constant LBAT_X1 : integer := 20;

	signal col_cont_reg : unsigned (9 downto 0) := (others=>'0');
	signal row_cont_reg : unsigned (9 downto 0) := (others=>'0');
	
	
	signal ball_x : unsigned (9 downto 0) := (others=>'0');
	signal ball_y : unsigned (9 downto 0) := (others=>'0');
	signal bat_r : unsigned (9 downto 0) := (others=>'0');
	signal bat_l : unsigned (9 downto 0) := (others=>'0');
	
	signal r : std_logic_vector (2 downto 0) := (others=>'0');
	signal g : std_logic_vector (2 downto 0) := (others=>'0');
	signal b : std_logic_vector (2 downto 0) := (others=>'0');
	
	signal hs_dff1 : std_logic := '0';
	signal vs_dff1 : std_logic := '0';
	
begin

	process(clk_i)
	begin
		if(rising_edge(clk_i)) then
			if(rst_i = '0') then
				rgb_output <= (others => '0');
			else
				hs_dff1 <= h_sync_i;
				vs_dff1 <= v_sync_i;
				ball_x <= unsigned (ball_x_i);
				ball_y <= unsigned (ball_y_i);
				bat_r <= unsigned (bat_r_i);
				bat_l <= unsigned (bat_l_i);
				rgb_output <= r&g&b;
			end if;
		end if;
	end process;
	
	
	pixel_ptr_inst : entity work.pixel_ptr
	port map (
		clk_i => clk_i,
		rst_i => rst_i,
		h_sync_i => hs_dff1,
		v_sync_i => vs_dff1,
		cptr_o => col_cont_reg,
		rptr_o => row_cont_reg
	);

	g <= (others => '1') when (col_cont_reg >= ball_x and col_cont_reg <= (ball_x+BALL_WIDTH) and
										row_cont_reg >= ball_y and row_cont_reg <= (ball_y+ BALL_WIDTH))or
										(col_cont_reg >= 0 and col_cont_reg <= 20 and 
										 row_cont_reg >= 0 and row_cont_reg <= 20) 
								else
							(others => '0');

	b <= (others => '1') when (col_cont_reg >= LBAT_X1 and col_cont_reg <= (LBAT_X1 + BAT_WIDTH) and
									  row_cont_reg >= bat_l and row_cont_reg <= (bat_l + BAT_LENGTH))or
										(col_cont_reg >= 0 and col_cont_reg <= 20 and 
										 row_cont_reg >= 0 and row_cont_reg <= 20) 
								else 
						 	(others => '0');

	r <= (others => '1') when (col_cont_reg >= RBAT_X1 and col_cont_reg <= (RBAT_X1 + BAT_WIDTH) and
									   row_cont_reg >= bat_r and row_cont_reg <= (bat_r + BAT_LENGTH))or
										(col_cont_reg >= 0 and col_cont_reg <= 20 and 
										 row_cont_reg >= 0 and row_cont_reg <= 20) 
								else
						 	(others => '0');

end Behavioral;