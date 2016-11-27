--Definitions
library ieee;

use ieee.std_logic_1164.all;

package data_types is
	type array1d is array (0 to 255) of std_logic_vector(7 downto 0);
	type matrix2d is array(0 to 255, 0 to 255) of std_logic_vector(7 downto 0);
end data_types;

--Main
library ieee;

use ieee.std_logic_1164.all;
use work.data_types.all;

entity arrays_test is 
port (a, b : in array1d;
		c : out matrix2d);
end arrays_test;

architecture arch of arrays_test is
begin
	--c(0, 0 to 255) <= a(0 to 255);
end arch;