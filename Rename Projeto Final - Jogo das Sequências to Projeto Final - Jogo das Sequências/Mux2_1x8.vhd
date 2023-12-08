library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_signed.all; 

entity Mux2_1x8 is
	port (S: in std_logic;
		  L0, L1: in std_logic_vector(7 downto 0);
	      D: out std_logic_vector(7 downto 0));
end Mux2_1x8;

architecture mux2x1 of Mux2_1x8 is
begin

with S select D <= L0 when '0',
                   L1 when others;

end mux2x1;