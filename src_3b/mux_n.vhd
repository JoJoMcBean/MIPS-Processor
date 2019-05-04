library IEEE;
use IEEE.std_logic_1164.all;

entity mux_n is
  generic(N : integer := 32);
  port(i_A          : in std_logic_vector(N-1 downto 0);
       i_B          : in std_logic_vector(N-1 downto 0);
       i_S          : in std_logic;
       o_F          : out std_logic_vector(N-1 downto 0));
end mux_n;

architecture structure of mux_n is

component org2
  port(i_A          : in std_logic;
       i_B          : in std_logic;
       o_F          : out std_logic);
end component;

component andg2
  port(i_A          : in std_logic;
       i_B          : in std_logic;
       o_F          : out std_logic);
end component;

component invg
  port(i_A          : in std_logic;
       o_F          : out std_logic);
end component;

signal C : std_logic_vector(N-1 downto 0);
signal D : std_logic_vector(N-1 downto 0);
signal F : std_logic;

begin
a1: for i in 0 to N-1 generate
  and_i: andg2
    port map(
	i_A => i_A(i),
	i_B => i_S,
	o_F => C(i));
end generate;

n1: invg
    port map(
	i_A => i_S,
	o_F => F);

a2: for i in 0 to N-1 generate
  and2_i: andg2
     port map(
	i_A => i_B(i),
	i_B => F,
	o_F => D(i));
end generate;
o1: for i in 0 to N-1 generate
  org_i: org2
    port map(
	i_A => C(i),
	i_B => D(i),
	o_F => o_F(i));
end generate;
end structure;
