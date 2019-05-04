library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity aluha is
port(
	inst : in std_logic_vector(31 downto 0));
end aluha;

architecture arch of aluha is 

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
op : in std_logic_vector(3 downto 0);
f : out std_logic_vector(31 downto 0);
co : out std_logic;
ovf : out std_logic;
z : out std_logic);
end component;

signal alu_out,rfA,rfB,mem_data,rf_in,imd_ext,alub, cmd: std_logic_vector(31 downto 0);
signal clk,alu_cout, alu_overflow, alu_zero : std_logic;

begin

--cmd <= inst;

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

rf: reg_file
port map(
i_CLK => clk,
i_D => rf_in,
i_WE => cmd(26),
i_RST => cmd(27),
i_WAD => cmd(25 downto 21),
i_RSAD => cmd(20 downto 16),
i_RTAD => cmd(15 downto 11),
o_RSD => rfA,
o_RTD => rfB);

ext: for i in 7 to 31 generate
imd_ext(i) <= cmd(29) and cmd(10);
end generate;
imd_ext(6 downto 0) <= cmd(10 downto 4);

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
shamt => alub(4 downto 0),
op => cmd(3 downto 0),
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

clk_gen : process
begin
clk <= '0';
wait for 50 ns;
clk <= '1';
wait for 50 ns;
end process;

testbench: process
begin

cmd <= x"08000000";
wait for 1 ns;

cmd <= "00010100001000010000000001110000"; --enable immediate, immediate = 7, regester 1  = register 1 + immediate
wait for 100ns;

cmd <= "00010100010000100000000011110000"; --enable immediate, immediate = 15, regester 2  = register 2 + immediate
wait for 100ns;

cmd <= "00000100011000010001000000000000"; -- regester 3  = register 1 + register 2, add unsign
wait for 100ns;

cmd <= "00000100100000010001000000000001"; -- regester 4  = register 1 + register 2, add sign
wait for 100ns;

cmd <= "00000100101000010001000000000010"; -- regester 5  = register 1 - register 2, sub unsign
wait for 100ns;

cmd <= "00000100110000010001000000000011"; -- regester 6  = register 1 - register 2, sub sign
wait for 100ns;

cmd <= "00000100111000010001000000000100"; -- regester 7  = register 1 | register 2, or
wait for 100ns;

cmd <= "00000101000000010001000000000101"; -- regester 8  = register 1 nor register 2, nor
wait for 100ns;

cmd <= "00000101001000010001000000000110"; -- regester 9  = register 1 & register 2, and
wait for 100ns;

cmd <= "00000101010000010001000000000111"; -- regester 10  = register 1 xor register 2, xor
wait for 100ns;

cmd <= "01010100001000010000000001010010"; -- regester 10.5  = register 1 >> immediate (=3) logical
wait for 100ns;

cmd <= "00010101011000010000000000111000"; -- regester 11  = register 1 >> immediate (=3) logical
wait for 100ns;

cmd <= "00010101100000010000000000111001"; -- regester 12  = register 1 >> immediate (=3) arith
wait for 100ns;

cmd <= "00010101101000010000000000111010"; -- regester 13  = register 1<< immediate (=3) logical
wait for 100ns;

cmd <= "00010101110000010001000000001011"; -- regester 14  = register 1 < register 2, slt
wait;


end process;
end arch;