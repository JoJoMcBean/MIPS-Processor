library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity left_shift is
  port( shift : in std_logic_vector(4 downto 0);
	log_arith : in std_logic;
  	Data : in std_logic_vector (31 downto 0);
	left_output : out std_logic_vector (31 downto 0));
end left_shift;

architecture left_shift_arch of left_shift is
	
component mux_n is
  generic(N : integer := 32);
  port(i_A          : in std_logic_vector(N-1 downto 0);
       i_B          : in std_logic_vector(N-1 downto 0);
       i_S          : in std_logic;
       o_F          : out std_logic_vector(N-1 downto 0));
end component;

component left_arith is
  generic(N : integer := 32);
  port(sh : in std_logic_vector(4 downto 0);
       Data_in : in std_logic_vector(31 downto 0);
       Data_out : out std_logic_vector(31 downto 0));
end component;

component left_log is
  generic(N : integer := 32);
  port(sh : in std_logic_vector(4 downto 0);
       Data_in : in std_logic_vector(31 downto 0);
       Data_out : out std_logic_vector(31 downto 0));
end component;

signal logicl, ARL : std_logic_vector(31 downto 0);

begin

log: left_log
  port map(sh => shift,
			Data_in => Data,
			Data_out => logicl);

 arith: left_arith
  port map(sh => shift,
			Data_in => Data,
			Data_out => ARL);
  

selection: mux_n
	port map( i_A => logicl,  		--log_arith == 1, then logical is selected
	i_B => ARL,				--log_arith == 0, then arith is selected
	i_S => log_arith,
	o_F => left_output);


end left_shift_arch;