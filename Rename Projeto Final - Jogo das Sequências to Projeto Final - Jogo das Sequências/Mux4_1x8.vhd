library ieee;
use ieee.std_logic_1164.all; 

entity Mux4_1x8 is
	port (S: in std_logic_vector(1 downto 0);
		  L0, L1, L2, L3: in std_logic_vector(7 downto 0);
	      D: out std_logic_vector(7 downto 0));
end Mux4_1x8;

architecture mux4x1 of Mux4_1x8 is
begin

with S select D <= L0 when "00",
                   L1 when "01",
                   L2 when "10",
                   L3 when others;

end mux4x1;