library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity control is
port(
	inst : in std_logic_vector(5 downto 0);
	funct : in std_logic_vector(5 downto 0);
	flush : in std_logic;
	nop : in std_logic;
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
end control;

architecture arch of control is 

signal ct,fct : std_logic_vector(7 downto 0);

begin


with inst select
aluop <= funct when "000000",
	"100000" when "001000",--addi
	"100001" when "001001",--addiu
	"100100" when "001100",--andi
	"000001" when "001111",--lui
	"100101" when "001101",--ori
	"100110" when "001110",--xori
	"101010" when "001010",--slti
	"101011" when "001011",--sltiu
	"100001" when "101011",--sw
	"100001" when "100011",--lw
	"100010" when "000100",--beq
	"010100" when "000011",--jal
	"111111" when others;

with inst select
ct <= "10000001" when "000000",--ALU function
	"00000011" when "001000",--addi
	"00000011" when "001001",--addiu
	"00000011" when "001100",--andi
	"00000011" when "001111",--lui
	"00011011" when "100011",--lw
	"00000011" when "001110",--xori
	"00000011" when "001101",--ori
	"00000011" when "001010",--slti
	"00000011" when "001011",--sltiu
	"00000110" when "101011",--sw
	"00100000" when "000100",--beq
	"01000000" when "000010",--j
	"01000001" when "000011",--jal
	"00000010" when others;

with inst&funct select
fct <=  "01100000" when "000000001000",--jr
	"00000000" when "000000001100",--syscall
	ct when others;

regdst <= fct(7);
jump <= fct(6) and (not nop);
branch <= fct(5) and (not nop);
memread <= fct(4) and (not nop);
memtoreg <= fct(3);
memwrite <= fct(2) and (not nop) and (not flush);
alusrc <= fct(1);
regwrite <= fct(0) and (not nop) and (not flush);

end arch;