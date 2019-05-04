-------------------------------------------------------------------------
-- Jordan Fox
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------


-- L2P1A.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file contains an implementation of a behavioral 
-- multiplier operating on integer inputs. 
--
--
-- NOTES: Integer data type is not typically useful when doing hardware
-- design. We use it here for simplicity, but in future labs it will be
-- important to switch to std_logic_vector types and associated math
-- libraries (e.g. signed, unsigned). 


-- 8/19/09 by JAZ::Design created.
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity L2P1A is
  generic ( n	:	positive);
  port(iX               : in std_logic_vector(n-1 downto 0);
       oY               : out std_logic_vector (n-1 downto 0));

  end L2P1A;

architecture strut of L2P1A is
component invg
	port(	i_A : in std_logic;
		o_F : out std_logic);
end component;

begin

	loopy : for i in 0 to n-1 generate -- world loop is name of the for loop
	inv_i : invg 
	port map (	i_A => iX(i),
			o_F => oY(i));
	end generate;
  
end strut; -- word strut is just a name for the architecture it can be anything