library ieee;

use ieee.std_logic_1164.all;

entity mul is
port (a, b : in std_logic_vector (7 downto 0);
		sel : in std_logic_vector (1 downto 0);
		output : out std_logic_vector(7 downto 0));
end mul;

architecture arch of mul is
begin
	process(a, b, sel)
	begin
		if sel = "00" then 
			output <= (others => '0');
		elsif sel = "01" then
			output <= a;
		elsif sel = "10" then
			output <= b;
		else
			output <= (others => 'Z');
		end if;
	end process;
end arch;

