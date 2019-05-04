library IEEE;
use IEEE.std_logic_1164.all;

entity mux_gen is
  generic(n : positive := 32);
  port(i_A  : in std_logic_vector(n-1 downto 0);
       i_B  : in std_logic_vector(n-1 downto 0);
       sel  : in std_logic;
       o_F  : out std_logic_vector(n-1 downto 0));

end mux_gen;

architecture structure of mux_gen is

component mux1b is 
port( in0, in1, sel : in std_logic;
	output 	: out std_logic);
end component;

begin


G1: for i in 0 to n-1 generate
  mux_i: mux1b 
    port map(in0  => i_A(i),
             in1  => i_B(i),
	     sel  => sel,
  	          output  => o_F(i));
end generate;

  
end structure;
