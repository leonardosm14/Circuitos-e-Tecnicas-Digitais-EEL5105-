library ieee;
use ieee.std_logic_1164.all; 

entity controle is port(
    
    clock, enter, reset: in std_logic;
    end_game, end_sequence, end_round: in std_logic;
    R1, E1, E2, E3, E4, E5, E6: out std_logic);

end controle;

architecture arc_controle of controle is
   type STATES is (Init, Setup, ESelect, Result, Sequence, Play, Check);
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
	
COMB: process(end_sequence, end_game, end_round, EAtual, enter)
	begin
		case EAtual is
		    when Init =>
		        R1 <= '1';
		        E1 <= '0';
		        E2 <= '0';
		        E3 <= '0';
		        E4 <= '0';
		        E5 <= '0';
		        E6 <= '0';
		        PEstado <= Setup;
		 
		    when Setup =>
		        R1 <= '0';
		        E1 <= '1';
		        E2 <= '0';
		        E3 <= '0';
		        E4 <= '0';
		        E5 <= '0';
		        E6 <= '0';
		        if enter = '1' then PEstado <= ESelect; else PEstado <= Setup;
		        end if;

		   when ESelect =>
		        R1 <= '0';
		        E1 <= '0';
		        E2 <= '1';
		        E3 <= '0';
		        E4 <= '0';
		        E5 <= '0';
		        E6 <= '0';
		        if (end_game = '0' and end_round = '0') and enter = '1' then
		        PEstado <= Sequence;
		        elsif (end_game = '1' or end_round = '1') then 
		        PEstado <= Result;
		        else PEstado <= ESelect;
		        end if;
		      
		  when Sequence =>
		        R1 <= '0';
		        E1 <= '0';
		        E2 <= '0';
		        E3 <= '1';
		        E4 <= '0';
		        E5 <= '0';
		        E6 <= '0';
		        if end_sequence = '1' then
		        E3 <= '0';
		        PEstado <= Play; else PEstado <= Sequence;
		        end if;
		  
		  when Play =>
		        R1 <= '0';
		        E1 <= '0';
		        E2 <= '0';
		        E3 <= '0';
		        E4 <= '1';
		        E5 <= '0';
		        E6 <= '0';
		        if enter = '1' then PEstado <= Check; else PEstado <= Play;
		        end if;
		        
		 when Check =>
		        R1 <= '0';
		        E1 <= '0';
		        E2 <= '0';
		        E3 <= '0';
		        E4 <= '0';
		        E5 <= '1';
		        E6 <= '0';
		        PEstado <= ESelect;
		        
		 when Result =>
		        R1 <= '0';
		        E1 <= '0';
		        E2 <= '0';
		        E3 <= '0';
		        E4 <= '0';
		        E5 <= '0';
		        E6 <= '1';
		        if enter = '1' then PEstado <= Init; else PEstado <= Result;
		        end if;
		        
    end case;
	end process;

end arc_controle;               
