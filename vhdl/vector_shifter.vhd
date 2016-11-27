library ieee;

use ieee.std_logic_1164.all;

entity vector_shifter is 
	port(
		input : in std_logic_vector(3 downto 0);
		sel : in integer range 0 to 4;
		output : out std_logic_vector(7 downto 0)
	);
end vector_shifter;

architecture arch of vector_shifter is
	type matrix is array (0 to 4) of std_logic_vector(7 downto 0);
	signal row : matrix;
begin
	row(0) <= "0000" & input;
	l1: for i in sel'range generate
		row(i) <= row(i-1)(6 downto 0) & '0';
	end generate;
	output <= row(sel);
end architecture;