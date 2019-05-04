-------------------------------------------------------------------------
-- Henry Duwe
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------


-- MIPS_Processor.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file contains a skeleton of a MIPS_Processor  
-- implementation.

-- 01/29/2019 by H3::Design created.
-------------------------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.all;

entity MIPS_Processor is
  generic(N : integer := 32);
  port(iCLK            : in std_logic;
       iRST            : in std_logic;
       iInstLd         : in std_logic;
       iInstAddr       : in std_logic_vector(N-1 downto 0);
       iInstExt        : in std_logic_vector(N-1 downto 0);
       oALUOut         : out std_logic_vector(N-1 downto 0)); -- TODO: Hook this up to the output of the ALU. It is important for synthesis that you have this output that can effectively be impacted by all other components so they are not optimized away.

end  MIPS_Processor;


architecture structure of MIPS_Processor is

  -- Required data memory signals
  signal s_DMemWr       : std_logic; -- TODO: use this signal as the final active high data memory write enable signal
  signal s_DMemAddr     : std_logic_vector(N-1 downto 0); -- TODO: use this signal as the final data memory address input
  signal s_DMemData     : std_logic_vector(N-1 downto 0); -- TODO: use this signal as the final data memory data input
  signal s_DMemOut      : std_logic_vector(N-1 downto 0); -- TODO: use this signal as the data memory output
 
  -- Required register file signals 
  signal s_RegWr        : std_logic; -- TODO: use this signal as the final active high write enable input to the register file
  signal s_RegWrAddr    : std_logic_vector(4 downto 0); -- TODO: use this signal as the final destination register address input
  signal s_RegWrData    : std_logic_vector(N-1 downto 0); -- TODO: use this signal as the final data memory data input

  -- Required instruction memory signals
  signal s_IMemAddr     : std_logic_vector(N-1 downto 0); -- Do not assign this signal, assign to s_NextInstAddr instead
  signal s_NextInstAddr : std_logic_vector(N-1 downto 0); -- TODO: use this signal as your intended final instruction memory address input.
  signal s_Inst         : std_logic_vector(N-1 downto 0); -- TODO: use this signal as the instruction signal 

  -- Required halt signal -- for simulation
  signal v0             : std_logic_vector(N-1 downto 0); -- TODO: should be assigned to the output of register 2, used to implement the halt SYSCALL
  signal s_Halt         : std_logic;  -- TODO: this signal indicates to the simulation that intended program execution has completed. This case happens when the syscall instruction is observed and the V0 register is at 0x0000000A. This signal is active high and should only be asserted after the last register and memory writes before the syscall are guaranteed to be completed.

  component mem is
    generic(ADDR_WIDTH : integer;
            DATA_WIDTH : integer);
    port(
          clk          : in std_logic;
          addr         : in std_logic_vector((ADDR_WIDTH-1) downto 0);
          data         : in std_logic_vector((DATA_WIDTH-1) downto 0);
          we           : in std_logic := '1';
          q            : out std_logic_vector((DATA_WIDTH -1) downto 0));
    end component;

  -- TODO: You may add any additional signals or components your implementation 
  --       requires below this comment

component register_gen is
generic (n : positive := 32);
  port(i_CLK        : in std_logic;     -- Clock input
       i_RST        : in std_logic;     -- Reset input
       i_WE         : in std_logic;     -- Write enable input
       i_D          : in std_logic_vector(n-1 downto 0);     -- Data value input
       o_Q          : out std_logic_vector(n-1 downto 0));   -- Data value output
end component;

component adder is
port(
i_A	: in std_logic;
i_B	: in std_logic;
i_Cin	: in std_logic;
o_S	: out std_logic;
o_Cout	: out std_logic);
end component;

component control is
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
end component;

component mux_gen is
  generic(n : positive := 32);
  port(i_A  : in std_logic_vector(n-1 downto 0);
       i_B  : in std_logic_vector(n-1 downto 0);
       sel  : in std_logic;
       o_F  : out std_logic_vector(n-1 downto 0));
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

component rfv0 is
port(
i_CLK : in std_logic;
i_D : in std_logic_vector(31 downto 0);
i_WE : in std_logic;
i_RST : in std_logic;
i_WAD : in std_logic_vector(4 downto 0);
i_RSAD : in std_logic_vector(4 downto 0);
i_RTAD : in std_logic_vector(4 downto 0);
o_V0 : out std_logic_vector(31 downto 0);
o_RSD : out std_logic_vector(31 downto 0);
o_RTD : out std_logic_vector(31 downto 0));
end component;

component forward is
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
fwdCondA : out std_logic_vector(1 downto 0);
fwdCondB : out std_logic_vector(1 downto 0);
fwdNextA : out std_logic_vector(1 downto 0);
fwdNextB : out std_logic_vector(1 downto 0)
);
end component;

signal IDEXin, IDEXout : std_logic_vector(120 downto 0);
signal MEMWBin, MEMWBout : std_logic_vector (72 downto 0);
signal EXMEMin, EXMEMout : std_logic_vector(71 downto 0);
signal IFIDin, IFIDout : std_logic_vector(64 downto 0);
signal PC4carry,branchCarry : std_logic_vector(N downto 0);
signal PC_in,const4,PC_p4,jumpAddr,branchAddr,rfa,rfb,alu_out,imd_ext,alub,imd_sl2,alua,rs,rt : std_logic_vector(N-1 downto 0);
signal IDEXdata,MEMWBdata,EXMEMdata : std_logic_vector(6 downto 0);
signal alu_op : std_logic_vector(5 downto 0);
signal cmd : std_logic_vector(4 downto 0);
signal fwdCondA,fwdCondB : std_logic_vector(1 downto 0);
signal notHalt,alu_cout, alu_overflow, alu_zero, equal, jump, branch, regdst,DB,jmp,bch,flush,notflush : std_logic;

begin

  -- TODO: This is required to be your final input to your instruction memory. This provides a feasible method to externally load the memory module which means that the synthesis tool must assume it knows nothing about the values stored in the instruction memory. If this is not included, much, if not all of the design is optimized out because the synthesis tool will believe the memory to be all zeros.
  with iInstLd select
    s_IMemAddr <= s_NextInstAddr when '0',
      iInstAddr when others;


  IMem: mem
    generic map(ADDR_WIDTH => 10,
                DATA_WIDTH => N)
    port map(clk  => iCLK,
             addr => s_IMemAddr(11 downto 2),
             data => iInstExt,
             we   => iInstLd,
             q    => s_Inst);
  
  DMem: mem
    generic map(ADDR_WIDTH => 10,
                DATA_WIDTH => N)
    port map(clk  => iCLK,
             addr => s_DMemAddr(11 downto 2),
             data => s_DMemData,
             we   => s_DMemWr,
             q    => s_DMemOut);

  s_Halt <= '1' when (EXMEMout(0) = '1') and (v0 = "00000000000000000000000000001010") else '0';
  IDEXin(0) <= '1' when (IFIDout(31 downto 26) = "000000") and (IFIDout(5 downto 0) = "001100") else '0';



  -- TODO: Implement the rest of your processor below this comment! 


--IFID		63-32: PC+4; 31-0: Instruction
IFIDin(64) <= not (jump or (branch and equal));
IFIDin(63 downto 32) <= PC_p4;
IFIDin(31 downto 0) <= s_Inst;
IFID: register_gen 
	generic map (n => 65)
	port map(
	i_CLK => iCLK,
	i_RST => iRST,
	i_WE => '1',
	i_D => IFIDin,
	o_Q => IFIDout);

-- IDEX		
IDEXin(116 downto 112) <= IFIDout(10 downto 6);
IDEXin(37 downto 6) <= imd_ext;
IDEX: register_gen
generic map (n => 121)
port map(
i_CLK => iCLK,
i_RST => iRST,
i_WE => '1',
i_D => IDEXin,
o_Q => IDEXout);



-- MEMWB	
MEMWBin(72) <= IDEXout(111); --memtoreg
MEMWBin(71) <= IDEXout(110); --memwrite
MEMWBin(70) <= IDEXout(109);--'0' when (IDEXout(5 downto 1) = "00000") else 
	 -- regwrite
MEMWBin(37 downto 6) <= IDEXout(69 downto 38);-- reg b
MEMWBin(5 downto 1) <= IDEXout(5 downto 1);--reg wadd
MEMWBin(0) <= IDEXout(0); --halt
MEMWB: register_gen
generic map(n => 73)
port map(
i_CLK => iCLK,
i_RST => iRST,
i_WE => '1',
i_D => MEMWBin,
o_Q => MEMWBout);

-- EXMEM
EXMEMin(71) <= MEMWBout(72); --memtoreg
EXMEMin(70) <= MEMWBout(70); --regwrite
EXMEMin(69 downto 38) <= s_DMemOut;
EXMEMin(37 downto 6) <= MEMWBout(69 downto 38);
EXMEMin(5 downto 1) <= MEMWBout(5 downto 1); --reg wadd
EXMEMin(0) <= MEMWBout(0); --halt
s_RegWr <= EXMEMout(70);
EXMEM: register_gen
generic map (n => 72)
port map(
i_CLK => iCLK,
i_RST => iRST,
i_WE => '1',
i_D => EXMEMin,
o_Q => EXMEMout);

--notHalt <= not s_Halt;

PC: register_gen -- program counter register
	generic map (n => N)
	port map (
	i_CLK => iCLK,
	i_RST => iRST,
	i_WE => '1', -- idk what to put here
	i_D => PC_in,
	o_Q => s_NextInstAddr);

const4 <= x"00000004";
PC4carry(0) <= '0';
pcp4: for i in 0 to 31 generate
adderi : adder
port map(
i_A => s_IMemAddr(i),
i_B => const4(i),
i_Cin => PC4carry(i),
o_S => PC_p4(i),
o_Cout => PC4carry(i+1));
end generate;
	
jumpAddr(31 downto 28) <= IFIDout(63 downto 60);
jumpAddr(27 downto 2) <= IFIDout(25 downto 0);
jumpAddr(1 downto 0) <= "00";

imd_sl2(31 downto 2) <= imd_ext(29 downto 0);
imd_sl2(1 downto 0) <= "00";
branchCarry(0) <= '0';

gbranch: for i in 0 to 31 generate
addi : adder
port map(
i_A => IFIDout(i+32),
i_B => imd_sl2(i),
i_Cin => branchCarry(i),
o_S => branchAddr(i),
o_Cout => branchCarry(i+1));
end generate;

-- gonna need to fuk with this
PC_in <= rfa when (jump = '1') and (branch = '1') else
	jumpAddr when (jump = '1' and (branch = '0')) else
	branchAddr when (branch = '1') and (equal = '1') else
	PC_p4;

DB <= (not IFIDout(64)) or iRST;-- or ((s_IMemAddr(0) xor IFIDout(32)) or (s_IMemAddr(1) xor IFIDout(33)) or (s_IMemAddr(2) xor IFIDout(34)) or (s_IMemAddr(3) xor IFIDout(35)) or (s_IMemAddr(4) xor IFIDout(36)) or (s_IMemAddr(5) xor IFIDout(37)) or (s_IMemAddr(6) xor IFIDout(38)) or (s_IMemAddr(7) xor IFIDout(39)) or (s_IMemAddr(8) xor IFIDout(40)) or (s_IMemAddr(9)xor IFIDout(41)) or (s_IMemAddr(10) xor IFIDout(42)) or (s_IMemAddr(11) xor IFIDout(43)) or (s_IMemAddr(12) xor IFIDout(44)) or (s_IMemAddr(13) xor IFIDout(45)) or (s_IMemAddr(14) xor IFIDout(46)) or (s_IMemAddr(15) xor IFIDout(47)) or (s_IMemAddr(16) xor IFIDout(48)) or (s_IMemAddr(17) xor IFIDout(49)) or (s_IMemAddr(18) xor IFIDout(50)) or (s_IMemAddr(19) xor IFIDout(51)) or (s_IMemAddr(20) xor IFIDout(52)) or (s_IMemAddr(21) xor IFIDout(53)) or (s_IMemAddr(22) xor IFIDout(54)) or (s_IMemAddr(23) xor IFIDout(55)) or (s_IMemAddr(24) xor IFIDout(56)) or (s_IMemAddr(25) xor IFIDout(57)) or (s_IMemAddr(26) xor IFIDout(58)) or (s_IMemAddr(27) xor IFIDout(59)) or (s_IMemAddr(28) xor IFIDout(60)) or (s_IMemAddr(29) xor IFIDout(61)) or (s_IMemAddr(30) xor IFIDout(62)) or (s_IMemAddr(31) xor IFIDout(63)));
IDEXdata <= IDEXout(109) & IDEXout(111) & IDEXout(5 downto 1);
MEMWBdata <= MEMWBout(70) & MEMWBout(72) & MEMWBout(5 downto 1);
EXMEMdata <= EXMEMout(70) & EXMEMout(71) & EXMEMout(5 downto 1);

ct : control -- we're gonna jump to register when (jump && branch = 1)
port map (
inst => IFIDout(31 downto 26),
funct => IFIDout(5 downto 0),
flush => '0',
nop => DB,
regdst => regdst,
jump => jump,
branch => branch,
memread => open,
memtoreg => IDEXin(111),--
aluop => IDEXin(107 downto 102),--
memwrite => IDEXin(110),
alusrc => IDEXin(108),
regwrite => IDEXin(109));


--reg file muxes:
IDEXin(5 downto 1) <= "11111" when (jump = '1') else
	IFIDout(15 downto 11) when (regdst = '1') else
	IFIDout(20 downto 16);

jumprfa : mux_gen
  generic map(n => 32)
  port map(
	i_A => rfa,
	i_B => IFIDout(63 downto 32),
	sel => jump,
	o_F => IDEXin(101 downto 70));

regsrc : mux_gen
  generic map(n => 32)
  port map(
	i_A => EXMEMout(37 downto 6),
	i_B => EXMEMout(69 downto 38),
	sel => EXMEMout(71),
	o_F => s_RegWrData);

s_RegWrAddr <= EXMEMout(5 downto 1);

rf : rfv0
port map( -- not sure whats gonna happen linking 32 bit to generic size signals
i_CLK => iCLK,
i_D => s_RegWrData,
i_WE => s_RegWr,
i_RST => iRST,
i_WAD => s_RegWrAddr,
i_RSAD => IFIDout(25 downto 21),
i_RTAD => IFIDout(20 downto 16),
o_V0 => v0,
o_RSD => rs,
o_RTD => rt);

rfa <= rs;

rfb <= rt;

IDEXin(69 downto 38) <= rfb;

equal <= not ( (rfa(31) xor rfb(31))  or (rfa(30) xor rfb(30)) or (rfa(29) xor rfb(29)) or (rfa(28) xor rfb(28)) or (rfa(27) xor rfb(27)) or (rfa(26) xor rfb(26)) or (rfa(25) xor rfb(25)) or (rfa(24) xor rfb(24)) or (rfa(23) xor rfb(23)) or (rfa(22) xor rfb(22)) or (rfa(21) xor rfb(21)) or (rfa(20) xor rfb(20)) or (rfa(19) xor rfb(19)) or (rfa(18) xor rfb(18)) or (rfa(17) xor rfb(17)) or (rfa(16) xor rfb(16)) or (rfa(15) xor rfb(15)) or (rfa(14) xor rfb(14)) or (rfa(13) xor rfb(13)) or (rfa(12) xor rfb(12)) or (rfa(11) xor rfb(11)) or (rfa(10) xor rfb(10)) or (rfa(9) xor rfb(9)) or (rfa(8) xor rfb(8)) or (rfa(7) xor rfb(7)) or (rfa(6) xor rfb(6)) or (rfa(5) xor rfb(5)) or (rfa(4) xor rfb(4)) or (rfa(3) xor rfb(3)) or (rfa(2) xor rfb(2)) or (rfa(1) xor rfb(1)) or (rfa(0) xor rfb(0))   );

ext: for i in 16 to 31 generate
imd_ext(i) <= IFIDout(15);
end generate;
imd_ext(15 downto 0) <= IFIDout(15 downto 0);

--alu muxes
alu_b: mux_gen
generic map(n => 32)
port map(
i_A => MEMWBin(37 downto 6),
i_B => IDEXout(37 downto 6),
sel => IDEXout(108),
o_F => alub);

alua <= IDEXout(101 downto 70);

albrt : alu
port map(
a => alua,
b => alub,
shamt => IDEXout(116 downto 112),--shit has been dealt with
op => IDEXout(107 downto 102),
f => MEMWBin(69 downto 38),
co => alu_cout,
ovf => alu_overflow,
z => alu_zero);

oALUOut <= MEMWBin(69 downto 38);

s_DMemWr <= MEMWBout(71);
s_DMemData <= MEMWBout(37 downto 6);
s_DMemAddr <= MEMWBout(69 downto 38);

end structure;
