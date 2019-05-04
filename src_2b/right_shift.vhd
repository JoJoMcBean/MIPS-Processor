library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity right_shift is
  port( shift : in std_logic_vector(4 downto 0);
	log_arith : in std_logic;
  	Data : in std_logic_vector (31 downto 0);
	right_output : out std_logic_vector (31 downto 0));
end right_shift;

architecture right_shift_arch of right_shift is
	
component mux_n is
  generic(N : integer := 32);
  port(i_A          : in std_logic_vector(N-1 downto 0);
       i_B          : in std_logic_vector(N-1 downto 0);
       i_S          : in std_logic;
       o_F          : out std_logic_vector(N-1 downto 0));
end component;

component right_arith is
  generic(N : integer := 32);
  port(sh : in std_logic_vector(4 downto 0);
       Data_in : in std_logic_vector(31 downto 0);
       Data_out : out std_logic_vector(31 downto 0));
end component;

component right_log is
  generic(N : integer := 32);
  port(sh : in std_logic_vector(4 downto 0);
       Data_in : in std_logic_vector(31 downto 0);
       Data_out : out std_logic_vector(31 downto 0));
end component;

signal logic, AR : std_logic_vector(31 downto 0);

begin

log: right_log
  port map(sh => shift,
			Data_in => Data,
			Data_out => logic);

 arith: right_arith
  port map(sh => shift,
			Data_in => Data,
			Data_out => AR);
  

selection: mux_n
	port map( i_A => logic,  		--log_arith == 1, then logical is selected
	i_B => AR,				--log_arith == 0, then arith is selected
	i_S => log_arith,
	o_F => right_output);


end right_shift_arch;