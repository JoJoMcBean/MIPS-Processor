library IEEE;
use IEEE.std_logic_1164.all;

entity decoder is
port(i_EN : in std_logic;
i_ADR : in std_logic_vector(4 downto 0);
o_SEL : out std_logic_vector(31 downto 0));
end decoder;

architecture arch of decoder is
	signal s_O : std_logic_vector(31 downto 0);
begin
o_SEL <= s_O;
process (i_EN,i_ADR)
begin
s_O <= x"00000000";
if(i_EN = '1') then
	case i_ADR is
	when "00000" => s_O(0) <= '1';
	when "00001" => s_O(1) <= '1';
	when "00010" => s_O(2) <= '1';
	when "00011" => s_O(3) <= '1';
	when "00100" => s_O(4) <= '1';
	when "00101" => s_O(5) <= '1';
	when "00110" => s_O(6) <= '1';
	when "00111" => s_O(7) <= '1';
	when "01000" => s_O(8) <= '1';
	when "01001" => s_O(9) <= '1';
	when "01010" => s_O(10) <= '1';
	when "01011" => s_O(11) <= '1';
	when "01100" => s_O(12) <= '1';
	when "01101" => s_O(13) <= '1';
	when "01110" => s_O(14) <= '1';
	when "01111" => s_O(15) <= '1';
	when "10000" => s_O(16) <= '1';
	when "10001" => s_O(17) <= '1';
	when "10010" => s_O(18) <= '1';
	when "10011" => s_O(19) <= '1';
	when "10100" => s_O(20) <= '1';
	when "10101" => s_O(21) <= '1';
	when "10110" => s_O(22) <= '1';
	when "10111" => s_O(23) <= '1';
	when "11000" => s_O(24) <= '1';
	when "11001" => s_O(25) <= '1';
	when "11010" => s_O(26) <= '1';
	when "11011" => s_O(27) <= '1';
	when "11100" => s_O(28) <= '1';
	when "11101" => s_O(29) <= '1';
	when "11110" => s_O(30) <= '1';
	when "11111" => s_O(31) <= '1';
	when others => s_O <= x"00000000";
	end case;
end if;
end process;
end arch;