library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity contador is port (
        CLK, EN, RST: in std_logic;
        S: out std_logic_vector(4 downto 0);
        max: out std_logic
);
end contador;

architecture x of contador is
  signal cnt: std_logic_vector(4 downto 0) := "00000";
begin
  process(CLK)
  begin
  if (RST = '0') then
    			cnt <= "00000";
		elsif (CLK'event and CLK = '1') then
		    if (EN = '1') then
             cnt <= cnt + '1';
             max <= '0';
             end if;
    
    if (cnt = "10101") then
            max <= '1';
    
    end if;
	end if;
  end process;
  S <= cnt;
end x;
