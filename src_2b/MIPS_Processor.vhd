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

signal PC4carry,branchCarry : std_logic_vector(N downto 0);
signal PC_in,const4,PC_p4,jumpAddr,branchAddr,rfa,rfb,alu_out,imd_ext,alub,imd_sl2 : std_logic_vector(N-1 downto 0);
signal alu_op : std_logic_vector(5 downto 0);
signal cmd : std_logic_vector(4 downto 0);
signal notHalt,alu_cout, alu_overflow, alu_zero : std_logic;

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

  s_Halt <='1' when (s_Inst(31 downto 26) = "000000") and (s_Inst(5 downto 0) = "001100") and (v0 = "00000000000000000000000000001010") else '0';

  -- TODO: Implement the rest of your processor below this comment! 

notHalt <= not s_Halt;

PC: register_gen -- program counter register
	generic map (n => N)
	port map (
	i_CLK => iCLK,
	i_RST => iRST,
	i_WE => notHalt, -- idk what to put here
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
	
jumpAddr(31 downto 28) <= PC_p4(31 downto 28);
jumpAddr(27 downto 2) <= s_Inst(25 downto 0);
jumpAddr(1 downto 0) <= "00";

imd_sl2(31 downto 2) <= imd_ext(29 downto 0);
imd_sl2(1 downto 0) <= "00";
branchCarry(0) <= '0';

gbranch: for i in 0 to 31 generate
addi : adder
port map(
i_A => PC_p4(i),
i_B => imd_sl2(i),
i_Cin => branchCarry(i),
o_S => branchAddr(i),
o_Cout => branchCarry(i+1));
end generate;

PC_in <= rfa when (cmd(3) = '1') and (cmd(2) = '1') else
	jumpAddr when (cmd(3) = '1' and (cmd(2) = '0')) else
	branchAddr when (cmd(2) = '1') and (alu_zero = '1') else
	PC_p4;


-- below is mostly pasted from freak.vhd

ct : control -- we're gonna jump to register when (jump && branch = 1)
port map (
inst => s_Inst(31 downto 26),
funct => s_Inst(5 downto 0),
regdst => cmd(4),
jump => cmd(3),
branch => cmd(2),
memread => open,
memtoreg => cmd(1),
aluop => alu_op,
memwrite => s_DMemWr,
alusrc => cmd(0),
regwrite => s_RegWr);

--reg file muxes:
s_RegWrAddr <= "11111" when (cmd(3) = '1') else
	s_Inst(15 downto 11) when (cmd(4) = '1') else
	s_Inst(20 downto 16);

s_RegWrData <= PC_p4 when (cmd(3) = '1') else
	s_DMemOut when (cmd(1) = '1') else
	alu_out;

rf : rfv0
port map( -- not sure whats gonna happen linking 32 bit to generic size signals
i_CLK => iCLK,
i_D => s_RegWrData,
i_WE => s_RegWr,
i_RST => iRST,
i_WAD => s_RegWrAddr,
i_RSAD => s_Inst(25 downto 21),
i_RTAD => s_Inst(20 downto 16),
o_V0 => v0,
o_RSD => rfa,
o_RTD => rfb);

ext: for i in 16 to 31 generate
imd_ext(i) <= s_Inst(15);
end generate;
imd_ext(15 downto 0) <= s_Inst(15 downto 0);

--alu muxes
alu_b: mux_gen
generic map(n => 32)
port map(
i_A => rfb,
i_B => imd_ext,
sel => cmd(0),
o_F => alub);

albrt : alu
port map(
a => rfa,
b => alub,
shamt => s_Inst(10 downto 6),
op => alu_op,
f => alu_out,
co => alu_cout,
ovf => alu_overflow,
z => alu_zero);

oALUOut <= alu_out;

s_DMemData <= rfb;
s_DMemAddr <= alu_out;

end structure;
