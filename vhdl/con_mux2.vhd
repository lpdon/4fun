library ieee;

use ieee.std_logic_1164.all;

entity con_mux2 is
	port(
		a, b, c, d : in std_logic;
		sel : in std_logic_vector(1 downto 0);
		y : out std_logic
	);
end con_mux2;

architecture arch of con_mux2 is
begin
	with sel select
		y <= 	a when "00",
				b when "01",
				c when "10",
				d when others;
end arch;