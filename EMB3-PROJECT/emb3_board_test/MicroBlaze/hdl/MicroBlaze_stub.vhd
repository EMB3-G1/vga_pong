-------------------------------------------------------------------------------
-- MicroBlaze_stub.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity MicroBlaze_stub is
  port (
    uart_0_sout_O : out std_logic;
    uart_0_sin_I : in std_logic;
    reset_I : in std_logic;
    dip_switches_4bits_I : in std_logic_vector(3 downto 0);
    clk_I : in std_logic;
    axi_gpio_1_GPIO_IO_I_pin : in std_logic_vector(9 downto 0);
    axi_gpio_0_GPIO_IO_I_pin : in std_logic_vector(9 downto 0);
    axi_gpio_2_GPIO_IO_I_pin : in std_logic_vector(9 downto 0);
    axi_gpio_3_GPIO_IO_I_pin : in std_logic_vector(1 downto 0);
    axi_gpio_4_GPIO_IO_I_pin : in std_logic
  );
end MicroBlaze_stub;

architecture STRUCTURE of MicroBlaze_stub is

  component MicroBlaze is
    port (
      uart_0_sout_O : out std_logic;
      uart_0_sin_I : in std_logic;
      reset_I : in std_logic;
      dip_switches_4bits_I : in std_logic_vector(3 downto 0);
      clk_I : in std_logic;
      axi_gpio_1_GPIO_IO_I_pin : in std_logic_vector(9 downto 0);
      axi_gpio_0_GPIO_IO_I_pin : in std_logic_vector(9 downto 0);
      axi_gpio_2_GPIO_IO_I_pin : in std_logic_vector(9 downto 0);
      axi_gpio_3_GPIO_IO_I_pin : in std_logic_vector(1 downto 0);
      axi_gpio_4_GPIO_IO_I_pin : in std_logic
    );
  end component;

  attribute BOX_TYPE : STRING;
  attribute BOX_TYPE of MicroBlaze : component is "user_black_box";

begin

  MicroBlaze_i : MicroBlaze
    port map (
      uart_0_sout_O => uart_0_sout_O,
      uart_0_sin_I => uart_0_sin_I,
      reset_I => reset_I,
      dip_switches_4bits_I => dip_switches_4bits_I,
      clk_I => clk_I,
      axi_gpio_1_GPIO_IO_I_pin => axi_gpio_1_GPIO_IO_I_pin,
      axi_gpio_0_GPIO_IO_I_pin => axi_gpio_0_GPIO_IO_I_pin,
      axi_gpio_2_GPIO_IO_I_pin => axi_gpio_2_GPIO_IO_I_pin,
      axi_gpio_3_GPIO_IO_I_pin => axi_gpio_3_GPIO_IO_I_pin,
      axi_gpio_4_GPIO_IO_I_pin => axi_gpio_4_GPIO_IO_I_pin
    );

end architecture STRUCTURE;

