library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all; 

entity counter_seq is
	port (Reset, Enable, Clock: in  std_logic;
         end_sequence: out std_logic;
         seq: out std_logic_vector(2 downto 0));
    
end counter_seq;

architecture counter of counter_seq is
  signal cnt: std_logic_vector(2 downto 0) := "000";
  signal endseq: std_logic := '0';
begin
  process(Reset, Enable, Clock)
  begin
  if (Reset = '1') then
    			cnt <= "000";
    			endseq <= '0';
		elsif (Clock'event and Clock = '1') then
		    if (Enable = '1') then cnt <= cnt + '1';
		        if cnt = "011" then endseq <= '1';
                end if;
            end if;
	end if;
  end process;
  end_sequence <= endseq;
  seq <= cnt;
end counter;