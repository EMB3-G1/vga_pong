library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity color_adder is
	port (
		clk_i 	: in std_logic;
		rst_i 	: in std_logic;
		ball_x_i : in std_logic_vector(9 downto 0);
		ball_y_i : in std_logic_vector(9 downto 0);
		col_counter : in std_logic_vector(9 downto 0);
		row_counter : in std_logic_vector(9 downto 0);
		bat_r_i 	: in std_logic_vector(9 downto 0);
		bat_l_i 	: in std_logic_vector(9 downto 0);
		
		rgb_output : out std_logic_vector (8 downto 0)
	);
end color_adder;

architecture Behavioral of color_adder is

	constant BALL_WIDTH : integer := 20;
	constant BAT_WIDTH : integer := 20;
	constant BAT_LENGTH : integer := 100;
	constant RBAT_X1 : integer := 600;
	constant LBAT_X1 : integer := 20;
	constant FOR_TESTING : integer := 1;

	signal col_cont_reg : unsigned (9 downto 0) := (others=>'0');
	signal row_cont_reg : unsigned (9 downto 0) := (others=>'0');
	
	
	signal ball_x : unsigned (9 downto 0) := (others=>'0');
	signal ball_y : unsigned (9 downto 0) := (others=>'0');
	signal bat_r : unsigned (9 downto 0) := (others=>'0');
	signal bat_l : unsigned (9 downto 0) := (others=>'0');
	
	signal r : std_logic_vector (2 downto 0);
	signal g : std_logic_vector (2 downto 0);
	signal b : std_logic_vector (2 downto 0);

begin

	process(clk_i)
	begin
		if(rising_edge(clk_i)) then
			if(rst_i = '1') then
				rgb_output <= (others => '0');
			else
				col_cont_reg <= unsigned(col_counter);
				row_cont_reg <= unsigned(row_counter);
				ball_x <= unsigned (ball_x_i);
				ball_y <= unsigned (ball_y_i);
				bat_r <= unsigned (bat_r_i);
				bat_l <= unsigned (bat_l_i);
				
				rgb_output <= r&g&b;
			end if;
		end if;
	end process;


	r <= (others => '1') when (col_cont_reg >= ball_x and
										col_cont_reg <= (ball_x+BALL_WIDTH) and
										row_cont_reg >= ball_y and 
										row_cont_reg <= (ball_y+ BALL_WIDTH))else
						 	
							(others => '0');

	g <= (others => '1') when (col_cont_reg >= LBAT_X1 and col_cont_reg <= (LBAT_X1 + BAT_WIDTH)) and
							  (row_cont_reg >= bat_l and row_cont_reg <= (bat_l + BAT_LENGTH)) 
						 else
						 	(others => '0');

	b <= (others => '1') when (col_cont_reg >= RBAT_X1 and col_cont_reg <= (RBAT_X1 + BAT_WIDTH)) and
							  (row_cont_reg >= bat_r and row_cont_reg <= (bat_r + BAT_LENGTH))
						 else
						 	(others => '0');

end Behavioral;