
library IEEE;
use IEEE.std_logic_1164.all;

entity adder is
port(
i_A	: in std_logic;
i_B	: in std_logic;
i_Cin	: in std_logic;
o_S	: out std_logic;
o_Cout	: out std_logic);
end adder;

architecture arch of adder is

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

component xorg2 is

  port(i_A          : in std_logic;
       i_B          : in std_logic;
       o_F          : out std_logic);

end component;

signal xor1,and1,and2	: std_logic;

begin

g_xor1 : xorg2
port map (i_A => i_A,
i_B => i_B,
o_F => xor1);

g_and1 : andg2
port map (i_A => i_A,
i_B => i_B,
o_F => and1);

g_xor2 : xorg2
port map (i_A => xor1,
i_B => i_Cin,
o_F => o_S);

g_and2 : andg2
port map (i_A => xor1,
i_B => i_Cin,
o_F => and2);

g_or1 : org2
port map (i_A => and1,
i_B => and2,
o_F => o_Cout);

end arch;