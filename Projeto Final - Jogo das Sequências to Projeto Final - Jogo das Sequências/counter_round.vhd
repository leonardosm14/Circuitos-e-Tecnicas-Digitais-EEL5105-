library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_signed.all; 

entity counter_round is
	port (Set, Enable, Clock: in  std_logic;
         end_round: out std_logic;
         X: out std_logic_vector(3 downto 0)); -- mudar no datapath
    
end counter_round;

architecture counteround of counter_round is
  signal cnt: std_logic_vector(3 downto 0) := "1111"; -- Set em 0;
begin
  process(Set, Enable, Clock)
  begin
  if (Set = '1') then
    			cnt <= "1111";
    			end_round <= '0';
		elsif (Clock'event and Clock = '1') then
		    if (Enable = '1') then cnt <= cnt - '1';
                if cnt = "0000" then end_round <= '1'; else end_round <= '0';
                 end if;
            end if;
	end if;
  end process;
  X <= cnt; 
end counteround;