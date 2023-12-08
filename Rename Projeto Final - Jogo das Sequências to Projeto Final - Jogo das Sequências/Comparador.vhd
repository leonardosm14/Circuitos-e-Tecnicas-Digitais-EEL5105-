library ieee;
use ieee.std_logic_1164.all; 

entity Comparador is 

port(in0, in1: in  std_logic_vector(7 downto 0);
     S: out std_logic);
     
end Comparador;

architecture comp of Comparador is
begin

    process(in0, in1) 
        begin 
        if in0 = in1 then S <= '1';
        else S <= '0';
        end if;
    end process;
    
end comp;