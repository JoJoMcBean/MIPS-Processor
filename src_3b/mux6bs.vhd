library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux6bs is 
port(
input : in std_logic_vector(2047 downto 0);
sel : in std_logic_vector(5 downto 0);
output : out std_logic_vector(31 downto 0));

end mux6bs;

architecture arch of mux6bs is

begin

m:process(sel,input)
begin
output <= input((32*to_integer(unsigned(sel))+31) downto (32*to_integer(unsigned(sel))));
end process;



end arch;