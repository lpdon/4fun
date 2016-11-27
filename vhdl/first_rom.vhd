library ieee;

use ieee.std_logic_1164.all;

package rom_type is
	type rom is array(0 to 3) of std_logic_vector(3 downto 0);	
	
end rom_type;

--------------------------------------------------------

library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.rom_type.all;

entity first_rom is
	generic (addr_bits : integer := 4;
				data_bits : integer := 4);
	port (addr : in std_logic_vector(addr_bits-1 downto 0);
			data_output : out std_logic_vector(data_bits-1 downto 0));
end first_rom;

architecture arch of first_rom is
	constant my_rom : rom := ("0000", "0001", "0010", "0010");
begin
	data_output <= my_rom(to_integer(unsigned(addr)));
end arch;