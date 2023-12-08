library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_signed.all; 

entity counter_time is
	port (Set, Enable, Clock: in std_logic;
	     Load: in std_logic_vector(7 downto 0);
         end_time: out std_logic;
         t_out: out std_logic_vector(7 downto 0)); 
    
end counter_time;

architecture countertime of counter_time is
  signal cnt: std_logic_vector(7 downto 0) := "01100011"; -- Set em 99;
begin
  process(Set, Enable, Clock)
  begin
  if (Set = '1') then
    			cnt <= "01100011";
    			end_time <= '0';
		elsif (Clock'event and Clock = '1') then
		    if (Enable = '1') then cnt <= (cnt - Load);
		    end if;
		    
            if cnt < "00000001" then end_time <= '1'; 
            else end_time <= '0';
            end if;
	end if;
  end process;
  t_out <= cnt; 
end countertime;