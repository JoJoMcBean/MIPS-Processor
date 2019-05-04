library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity extender is
port(
in16 : in std_logic_vector(15 downto 0);
insign: in std_logic;
out32 : out std_logic_vector(31 downto 0));
end extender;

architecture arch of extender is

signal zero,sign : std_logic_vector(31 downto 0);

begin

zero(15 downto 0) <= in16;
sign(15 downto 0) <= in16;
zero(31 downto 16) <= x"0000";
sign(16) <= in16(15);
sign(17) <= in16(15);
sign(18) <= in16(15);
sign(19) <= in16(15);
sign(20) <= in16(15);
sign(21) <= in16(15);
sign(22) <= in16(15);
sign(23) <= in16(15);
sign(24) <= in16(15);
sign(25) <= in16(15);
sign(26) <= in16(15);
sign(27) <= in16(15);
sign(28) <= in16(15);
sign(29) <= in16(15);
sign(30) <= in16(15);
sign(31) <= in16(15);

with insign select
out32 <= sign when '1',
	zero when others;

end arch;