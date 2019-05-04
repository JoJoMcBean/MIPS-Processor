library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shifter is
  port( Shift : in std_logic_vector(4 downto 0);
		sel : in std_logic; --selecting the arith or logical
		input : in std_logic_vector(31 downto 0);
		direction : in std_logic;
		shift_output : out std_logic_vector(31 downto 0));
end shifter;

architecture shifter_arch of shifter is

component right_shift is
  port( shift : in std_logic_vector(4 downto 0);
	log_arith : in std_logic;
  	Data : in std_logic_vector (31 downto 0);
	right_output : out std_logic_vector (31 downto 0));
end component;
	
component mux_n is
  generic(N : integer := 32);
  port(i_A          : in std_logic_vector(N-1 downto 0);
       i_B          : in std_logic_vector(N-1 downto 0);
       i_S          : in std_logic;
       o_F          : out std_logic_vector(N-1 downto 0));
end component;

component left_shift is
  port( shift : in std_logic_vector(4 downto 0);
	log_arith : in std_logic;
  	Data : in std_logic_vector (31 downto 0);
	left_output : out std_logic_vector (31 downto 0));
end component;

signal left, right : std_logic_vector(31 downto 0);

begin

leftshift: left_shift
port map(log_arith => sel,
		Data => input,
		shift => Shift,
		left_output => left);

rightshift: right_shift
port map(log_arith => sel,
		Data => input,
		shift => Shift,
		right_output => right);

selection: mux_n
	port map( i_A => left,  		--direction == 1, then left shifter is selected
	i_B => right,				--direction == 0, then right shifter is selected
	i_S => direction, 			--select left or right shifter
	o_F => shift_output);

end shifter_arch;