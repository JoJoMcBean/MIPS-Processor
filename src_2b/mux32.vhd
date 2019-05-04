library IEEE;
use IEEE.std_logic_1164.all;

entity mux32 is
port(
i_D : in std_logic_vector(1023 downto 0);
i_SEL : in std_logic_vector(4 downto 0);
o_P : out std_logic_vector(31 downto 0));
end mux32;

architecture arch of mux32 is
begin
with i_SEL select
o_P <= i_D(31 downto 0) when "00000",
	i_D(63 downto 32) when "00001",
	i_D(95 downto 64) when "00010",
	i_D(127 downto 96) when "00011",
	i_D(159 downto 128) when "00100",
	i_D(191 downto 160) when "00101",
	i_D(223 downto 192) when "00110",
	i_D(255 downto 224) when "00111",
	i_D(287 downto 256) when "01000",
	i_D(319 downto 288) when "01001",
	i_D(351 downto 320) when "01010",
	i_D(383 downto 352) when "01011",
	i_D(415 downto 384) when "01100",
	i_D(447 downto 416) when "01101",
	i_D(479 downto 448) when "01110",
	i_D(511 downto 480) when "01111",
	i_D(543 downto 512) when "10000",
	i_D(575 downto 544) when "10001",
	i_D(607 downto 576) when "10010",
	i_D(639 downto 608) when "10011",
	i_D(671 downto 640) when "10100",
	i_D(703 downto 672) when "10101",
	i_D(735 downto 704) when "10110",
	i_D(767 downto 736) when "10111",
	i_D(799 downto 768) when "11000",
	i_D(831 downto 800) when "11001",
	i_D(863 downto 832) when "11010",
	i_D(895 downto 864) when "11011",
	i_D(927 downto 896) when "11100",
	i_D(959 downto 928) when "11101",
	i_D(991 downto 960) when "11110",
	i_D(1023 downto 992) when "11111",
	(others => '0') when others;
end arch;