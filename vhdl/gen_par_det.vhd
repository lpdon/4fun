library ieee;

use ieee.std_logic_1164.all;

entity gen_par_det is
	generic( 
		n : integer := 8
	);
	port(
		input : in std_logic_vector(n-1 downto 0);
		output : out std_logic
	);
end gen_par_det;

architecture arch of gen_par_det is
begin
	process(input)
		variable temp : std_logic;
	begin
		temp := '0';		
		for i in input'range loop
			temp := temp xor input(i);
		end loop;	
		output <= temp;
	end process;
end arch;