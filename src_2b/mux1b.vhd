library IEEE;
use IEEE.std_logic_1164.all;

entity mux1b is 

port( in0, in1, sel : in std_logic;
	output 	: out std_logic);

end mux1b;

architecture arch of mux1b is 

component andg2 is

  port(i_A          : in std_logic;
       i_B          : in std_logic;
       o_F          : out std_logic);

end component;

component invg is

  port(i_A          : in std_logic;
       o_F          : out std_logic);

end component;

component org2 is

  port(i_A          : in std_logic;
       i_B          : in std_logic;
       o_F          : out std_logic);

end component;

signal inv,a0,a1	: std_logic;

begin

g_not1: invg 
port map (i_A => sel,
	o_F => inv);

g_and0: andg2
port map (i_A => in0,
	i_B => inv,
	o_F => a0);

g_and1: andg2
port map (i_A => in1,
	i_B => sel,
	o_F => a1);

g_or1: org2
port map (i_A => a0,
	i_B => a1,
	o_F => output);



end arch;