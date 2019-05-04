library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity left_arith is
  port( sh : in std_logic_vector(4 downto 0);
  	Data_in : in std_logic_vector (31 downto 0);
	Data_out : out std_logic_vector (31 downto 0));
end left_arith;

architecture left_arith_arch of left_arith is
	
component mux_n is
  generic(N : integer := 32);
  port(i_A          : in std_logic_vector(N-1 downto 0);
       i_B          : in std_logic_vector(N-1 downto 0);
       i_S          : in std_logic;
       o_F          : out std_logic_vector(N-1 downto 0));
end component;

signal out1,out2,out3,out4 : std_logic_vector(31 downto 0);
signal DATA1, DATA2, DATA3, DATA4, DATA5 : std_logic_vector(31 downto 0);

begin

DATA1 <= Data_in(30 downto 0) & '1';
shift1: mux_n
	port map( i_A => DATA1,
	i_B => Data_in,
	i_S => sh(0),
	o_F => out1);

DATA2 <= out1(29 downto 0) & "11";
shift2: mux_n
	port map( i_A => DATA2,
	i_B => out1,
	i_S => sh(1),
	o_F => out2);

DATA3 <= out2(27 downto 0) & x"F";
shift3: mux_n
	port map( i_A => DATA3,
	i_B => out2,
	i_S => sh(2),
	o_F => out3);

DATA4 <= out3(23 downto 0) & x"FF";
shift4: mux_n
	port map( i_A => DATA4,
	i_B => out3,
	i_S => sh(3),
	o_F => out4);

DATA5 <= out4(15 downto 0) & x"FFFF";
shift5: mux_n
	port map( i_A => DATA5,
	i_B => out4,
	i_S => sh(4),
	o_F => Data_out);

end left_arith_arch;
