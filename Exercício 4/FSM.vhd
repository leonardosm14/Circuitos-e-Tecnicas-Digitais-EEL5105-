library ieee;
use ieee.std_logic_1164.all;

entity FSM is port (
        clock, reset, B: in std_logic;
        S: out std_logic_vector(1 downto 0));
end FSM;

architecture arch of FSM is
   type STATES is (Init, On1, Off1, On2, Off2);
   signal EAtual, PEstado: STATES;
begin
	
REG: process(clock, reset)
	begin
	    if (reset = '1') then
			EAtual <= Init;
        elsif (clock'event AND clock = '1') then 
         	EAtual <= PEstado;
	    end if;
	end process;
	
COMB: process(EAtual, B)
	begin
		case EAtual is
		    when Init =>
		        S <= "10";
		        if (B = '0') then
		        PEstado <= Init;
		        else 
		        PEstado <= On1;
		        end if;
		 
		    when On1 =>
		        S <= "01";
		        PEstado <= Off1;
		  
    		when Off1 =>
    		      S <= "00";
    		      PEstado <= On2;
    		 
    		when On2 =>
    		      S <= "01";
    		      PEstado <= Off2;
    		 
    		when Off2 =>
		        S <= "10";
		        if (B = '0') then
		        PEstado <= Off2;
		        else 
		        PEstado <= On1;
		        end if;
    end case;
	end process;

end arch;
