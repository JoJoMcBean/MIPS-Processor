library IEEE;
use IEEE.std_logic_1164.all;

entity forward is
port(
jump : in std_logic;
branch : in std_logic;
readA : in std_logic_vector(4 downto 0);
readB : in std_logic_vector(4 downto 0);
IDEXdata : in std_logic_vector(6 downto 0);--6:regwrite,5:memtoreg,4to0:write address
MEMWBdata : in std_logic_vector(6 downto 0);
EXMEMdata : in std_logic_vector(6 downto 0);
flush : out std_logic;
jumpFLTR : out std_logic;
branchFLTR : out std_logic;
fwdCondA : out std_logic_vector(1 downto 0);--00:no forwarding, 01: MEMWB, 10: EXMEM, 11:buffer
fwdCondB : out std_logic_vector(1 downto 0);
fwdNextA : out std_logic_vector(1 downto 0);
fwdNextB : out std_logic_vector(1 downto 0)
);
end forward;

architecture arch of forward is


signal AMIDEX,AMMEMWB,AMEXMEM,BMIDEX,BMMEMWB,BMEXMEM,hazA,hazB : std_logic;

begin
AMIDEX <= IDEXdata(6) and (not (readA(4) or readA(3) or readA(2) or readA(1) or readA(0))) and not ((readA(4) xor IDEXdata(4)) or (readA(3) xor IDEXdata(3)) or (readA(2) xor IDEXdata(2)) or (readA(1) xor IDEXdata(1)) or (readA(0) xor IDEXdata(0)));
BMIDEX <= IDEXdata(6) and (not (readB(4) or readB(3) or readB(2) or readB(1) or readB(0))) and not ((readB(4) xor IDEXdata(4)) or (readB(3) xor IDEXdata(3)) or (readB(2) xor IDEXdata(2)) or (readB(1) xor IDEXdata(1)) or (readB(0) xor IDEXdata(0)));
AMMEMWB <= MEMWBdata(6) and (not (readA(4) or readA(3) or readA(2) or readA(1) or readA(0))) and not ((readA(4) xor MEMWBdata(4)) or (readA(3) xor MEMWBdata(3)) or (readA(2) xor MEMWBdata(2)) or (readA(1) xor MEMWBdata(1)) or (readA(0) xor MEMWBdata(0)));
BMMEMWB <= MEMWBdata(6) and (not (readB(4) or readB(3) or readB(2) or readB(1) or readB(0))) and not ((readB(4) xor MEMWBdata(4)) or (readB(3) xor MEMWBdata(3)) or (readB(2) xor MEMWBdata(2)) or (readB(1) xor MEMWBdata(1)) or (readB(0) xor MEMWBdata(0)));
AMEXMEM <= EXMEMdata(6) and (not (readA(4) or readA(3) or readA(2) or readA(1) or readA(0))) and not ((readA(4) xor EXMEMdata(4)) or (readA(3) xor EXMEMdata(3)) or (readA(2) xor EXMEMdata(2)) or (readA(1) xor EXMEMdata(1)) or (readA(0) xor EXMEMdata(0)));
BMEXMEM <= EXMEMdata(6) and (not (readB(4) or readB(3) or readB(2) or readB(1) or readB(0))) and not ((readB(4) xor EXMEMdata(4)) or (readB(3) xor EXMEMdata(3)) or (readB(2) xor EXMEMdata(2)) or (readB(1) xor EXMEMdata(1)) or (readB(0) xor EXMEMdata(0)));

fwdCondA <= "01" when (jump & branch = "01") and (AMMEMWB = '1') and (MEMWBdata(5) = '0') else --branch data
	"01" when (jump & branch = "11") and (AMMEMWB = '1') and (MEMWBdata(5) = '0') else --jump register
	"10" when (jump & branch = "00") and (AMEXMEM = '1') else --normal case
	"10" when (jump & branch = "11") and (AMEXMEM = '1') else --jump register
	"00";

fwdCondB <= "01" when (jump & branch = "01") and (BMMEMWB = '1') and (MEMWBdata(5) = '0') else --branch data
	"10" when (jump & branch = "00") and (BMEXMEM = '1') else --normal case
	"00";

fwdNextA <= "01" when (jump & branch = "00") and (AMIDEX = '1') and (IDEXdata(5) = '0') else --alu
	"10" when (jump & branch = "00") and (AMMEMWB = '1') else --mem or alu
	"00";

fwdNextB <= "01" when (jump & branch = "00") and (BMIDEX = '1') and (IDEXdata(5) = '0') else --alu
	"10" when (jump & branch = "00") and (BMMEMWB = '1') else --mem or alu
	"00";

flush <= '1' when (jump & branch = "00") and (AMIDEX = '1') and (IDEXdata(5) = '1') else 
	'1' when (jump & branch = "00") and (BMIDEX = '1') and (IDEXdata(5) = '1') else
	'0' when (jump & branch = "10") else
	'1' when (AMIDEX = '1') or (BMIDEX = '1') else
	'1' when ((AMMEMWB = '1') or (BMMEMWB = '1')) and (MEMWBdata(5) = '1') else
	'0';
	
jumpFLTR <= jump and not flush;
branchFLTR <= branch and not flush;

end arch;