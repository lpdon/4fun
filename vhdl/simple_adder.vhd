library ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity simple_adder is
	port(a, b : in std_logic_vector(3 downto 0);
			c : out std_logic_vector(4 downto 0));
end simple_adder;

architecture arch of simple_adder is
begin
	c <= a + b;
end arch;