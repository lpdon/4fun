library ieee;

use ieee.std_logic_1164.all;

entity shiftreg is
	generic(
		n : integer := 4
	);
	
	port(
		d : in std_logic;
		clk : in std_logic;
		rst : in std_logic;
		q : out std_logic
	);
end shiftreg;

architecture arch of shiftreg is
	signal temp : std_logic_vector(n-1 downto 0);
begin
	process(rst, clk)
	begin
		if rst = '1' then
			temp <= (others => '0');
		elsif clk'event and clk = '1' then
			temp <= temp(temp'left - 1 downto 0) & d;
		end if;
	end process;
	q <= temp(temp'left);
end arch;