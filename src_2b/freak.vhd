library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity freak is
port(
	inst : in std_logic_vector(31 downto 0);
	reset : in std_logic;
	clk : in std_logic);
end freak;

architecture arch of freak is 

component control is
port(
	inst : in std_logic_vector(5 downto 0);
	funct : in std_logic_vector(5 downto 0);
	regdst : out std_logic;
	jump : out std_logic;
	branch : out std_logic;
	memread : out std_logic;
	memtoreg : out std_logic;
	aluop : out std_logic_vector(5 downto 0);
	memwrite : out std_logic;
	alusrc : out std_logic;
	regwrite : out std_logic
);
end component;

component mem is
	generic 
	(	DATA_WIDTH : natural := 32;
		ADDR_WIDTH : natural := 10);
	port 
	(	clk		: in std_logic;
		addr	        : in std_logic_vector((ADDR_WIDTH-1) downto 0);
		data	        : in std_logic_vector((DATA_WIDTH-1) downto 0);
		we		: in std_logic := '1';
		q		: out std_logic_vector((DATA_WIDTH -1) downto 0));
end component;

component mux_gen is
  generic(n : positive := 32);
  port(i_A  : in std_logic_vector(n-1 downto 0);
       i_B  : in std_logic_vector(n-1 downto 0);
       sel  : in std_logic;
       o_F  : out std_logic_vector(n-1 downto 0));
end component;

component reg_file is
port(
i_CLK : in std_logic;
i_D : in std_logic_vector(31 downto 0);
i_WE : in std_logic;
i_RST : in std_logic;
i_WAD : in std_logic_vector(4 downto 0);
i_RSAD : in std_logic_vector(4 downto 0);
i_RTAD : in std_logic_vector(4 downto 0);
o_RSD : out std_logic_vector(31 downto 0);
o_RTD : out std_logic_vector(31 downto 0));
end component;

component alu is 
port(
a : in std_logic_vector(31 downto 0);
b : in std_logic_vector(31 downto 0);
shamt : in std_logic_vector(4 downto 0);
op : in std_logic_vector(5 downto 0);
f : out std_logic_vector(31 downto 0);
co : out std_logic;
ovf : out std_logic;
z : out std_logic);
end component;

signal alu_out,rfA,rfB,mem_data,rf_in,imd_ext,alub, cmd: std_logic_vector(31 downto 0);
signal alu_op : std_logic_vector(5 downto 0);
signal rf_wad : std_logic_vector(4 downto 0);
signal alu_cout, alu_overflow, alu_zero,c_zero : std_logic;

begin

--cmd <= inst;
c_zero <= '0';

ct : control
port map (
	inst => inst(31 downto 26),
	funct => inst(5 downto 0),
	regdst => cmd(10),
	jump => open,
	branch => open,
	memread => open,
	memtoreg => cmd(30),
	aluop => alu_op,
	memwrite => cmd(31),
	alusrc => cmd(28),
	regwrite => cmd(26));

dmem : mem
generic map (
DATA_WIDTH => 32,
ADDR_WIDTH => 10)
port map (
clk => clk,
addr => alu_out(9 downto 0),
data => rfB,
we => cmd(31),
q => mem_data);

rfwad_sel: mux_gen
generic map(n => 5)
port map(
i_A => inst(20 downto 16),
i_B => inst(15 downto 11),
sel => cmd(10), --regdst
o_F => rf_wad);

rf: reg_file
port map(
i_CLK => clk,
i_D => rf_in,
i_WE => cmd(26),
i_RST => reset,
i_WAD => rf_wad,
i_RSAD => inst(25 downto 21),
i_RTAD => inst(20 downto 16),
o_RSD => rfA,
o_RTD => rfB);

ext: for i in 16 to 31 generate --always sign extend
imd_ext(i) <= inst(15);
end generate;
imd_ext(15 downto 0) <= inst(15 downto 0);

imd: mux_gen
  generic map (n => 32)
  port map(i_A => rfB,
       i_B  => imd_ext,
       sel  => cmd(28),
       o_F  => alub);

albrt : alu 
port map(
a => rfA,
b => alub,
shamt => inst(10 downto 6),
op => alu_op,
f => alu_out,
co => alu_cout,
ovf => alu_overflow,
z => alu_zero);

rfw: mux_gen
  generic map (n => 32)
  port map(i_A => alu_out,
       i_B  => mem_data,
       sel  => cmd(30),
       o_F  => rf_in);


end arch;