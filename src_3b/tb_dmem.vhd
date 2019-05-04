library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_dmem is
port(
clk : in std_logic;
addr : in std_logic_vector(9 downto 0);
data : in std_logic_vector(31 downto 0);
we : in std_logic;
q : out std_logic_vector(31 downto 0));
end tb_dmem;

architecture arch of tb_dmem is

component mem is
	generic 
	(
		DATA_WIDTH : natural := 32;
		ADDR_WIDTH : natural := 10
	);
	port 
	(
		clk		: in std_logic;
		addr	        : in std_logic_vector((ADDR_WIDTH-1) downto 0);
		data	        : in std_logic_vector((DATA_WIDTH-1) downto 0);
		we		: in std_logic := '1';
		q		: out std_logic_vector((DATA_WIDTH -1) downto 0)
	);
end component;

begin 

dmem : mem
generic map(
DATA_WIDTH => 32,
ADDR_WIDTH => 10)
port map(
clk => clk,
addr => addr,
data => data,
we => we,
q => q);

end arch;



