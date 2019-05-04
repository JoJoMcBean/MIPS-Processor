library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ushift is
port(
data : in std_logic_vector(31 downto 0);
shift : in std_logic_vector(4 downto 0);
log_arith : in std_logic;
right_left : in std_logic;
output : out std_logic_vector(31 downto 0));
end ushift;

architecture arch of ushift is

component mux1b is 

port( in0, in1, sel : in std_logic;
	output 	: out std_logic);

end component;

component mux_gen is
  generic(n : positive := 32);
  port(i_A  : in std_logic_vector(n-1 downto 0);
       i_B  : in std_logic_vector(n-1 downto 0);
       sel  : in std_logic;
       o_F  : out std_logic_vector(n-1 downto 0));
end component;

signal shift0,shift1,shift2,shift4,shift8,shift16,flipin,flipout : std_logic_vector(31 downto 0);
signal fill : std_logic;

begin

flip1: for i in 0 to 31 generate
flipin(i) <= data(31-i);
end generate;

rl1 : mux_gen
generic map (n => 32)
port map (
i_A => data,
i_B => flipin,
sel => right_left,
o_F => shift0);

fill <= shift0(31) and log_arith;

b1: for x in 0 to 15 generate
shift1(x) <= shift0(x) when (shift(0) = '0') else
		shift0(x+1);

shift2(x) <= shift1(x) when (shift(1) = '0') else
		shift1(x+2);

shift4(x) <= shift2(x) when (shift(2) = '0') else
		shift2(x+4);

shift8(x) <= shift4(x) when (shift(3) = '0') else
		shift4(x+8);

shift16(x) <= shift8(x) when (shift(4) = '0') else
		shift8(x+16);
end generate;

b2: for x in 16 to 23 generate
shift1(x) <= shift0(x) when (shift(0) = '0') else
		shift0(x+1);

shift2(x) <= shift1(x) when (shift(1) = '0') else
		shift1(x+2);

shift4(x) <= shift2(x) when (shift(2) = '0') else
		shift2(x+4);

shift8(x) <= shift4(x) when (shift(3) = '0') else
		shift4(x+8);

shift16(x) <= shift8(x) when (shift(4) = '0') else
		fill;
end generate;

b3: for x in 24 to 27 generate
shift1(x) <= shift0(x) when (shift(0) = '0') else
		shift0(x+1);

shift2(x) <= shift1(x) when (shift(1) = '0') else
		shift1(x+2);

shift4(x) <= shift2(x) when (shift(2) = '0') else
		shift2(x+4);

shift8(x) <= shift4(x) when (shift(3) = '0') else
		fill;

shift16(x) <= shift8(x) when (shift(4) = '0') else
		fill;
end generate;

b4: for x in 28 to 29 generate
shift1(x) <= shift0(x) when (shift(0) = '0') else
		shift0(x+1);

shift2(x) <= shift1(x) when (shift(1) = '0') else
		shift1(x+2);

shift4(x) <= shift2(x) when (shift(2) = '0') else
		fill;

shift8(x) <= shift4(x) when (shift(3) = '0') else
		fill;

shift16(x) <= shift8(x) when (shift(4) = '0') else
		fill;
end generate;

b5: for x in 30 to 30 generate
shift1(x) <= shift0(x) when (shift(0) = '0') else
		shift0(x+1) when (x <= 30) else
		fill;

shift2(x) <= shift1(x) when (shift(1) = '0') else
		fill;

shift4(x) <= shift2(x) when (shift(2) = '0') else
		fill;

shift8(x) <= shift4(x) when (shift(3) = '0') else
		fill;

shift16(x) <= shift8(x) when (shift(4) = '0') else
		fill;
end generate;

b6: for x in 31 to 31 generate
shift1(x) <= shift0(x) when (shift(0) = '0') else
		fill;

shift2(x) <= shift1(x) when (shift(1) = '0') else
		fill;

shift4(x) <= shift2(x) when (shift(2) = '0') else
		fill;

shift8(x) <= shift4(x) when (shift(3) = '0') else
		fill;

shift16(x) <= shift8(x) when (shift(4) = '0') else
		fill;
end generate;

flip2: for i in 0 to 31 generate
flipout(i) <= shift16(31-i);
end generate;

rl2 : mux_gen
generic map (n => 32)
port map (
i_A => shift16,
i_B => flipout,
sel => right_left,
o_F => output);














end arch;
