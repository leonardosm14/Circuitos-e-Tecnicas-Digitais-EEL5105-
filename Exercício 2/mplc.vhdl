library ieee;
use ieee.std_logic_1164.all;

entity mplc is 
    port (B: in std_logic_vector(7 downto 0);
          A0: out std_logic_vector(6 downto 0);
          A1: out std_logic_vector(6 downto 0);
          A2: out std_logic_vector(6 downto 0);
          sel: in std_logic_vector(1 downto 0)
          );
          
end mplc;

architecture multiplicaesoma of mplc is
signal C0, C1, C3: std_logic_vector(7 downto 0); 
signal C2: std_logic_vector (11 downto 0);

component binbcd is
port (
        bin_in: in std_logic_vector (7 downto 0);
        bcd_out: out std_logic_vector (11 downto 0));
end component;

component bcd7seg is
port (bcd_in:  in std_logic_vector(3 downto 0);
      out_7seg:  out std_logic_vector(6 downto 0));
end component;

component soma8 is
port (A:  in std_logic_vector(7 downto 0);
      B:  in std_logic_vector(7 downto 0);
      S:  out std_logic_vector(7 downto 0));
end component;

begin

    somaB: soma8 port map ( A => B,
                            B => B,
                            S => C0);
    
    soma28: soma8 port map (A => "00011100", --28
                            B => C0, 
                            S => C1);
    
    with sel select C3 <= B when "00",
                         C1 when others;
                            
    convbcd: binbcd port map (bin_in => C3,
                              bcd_out => C2);
                              
    seg1: bcd7seg port map (bcd_in => C2(3 downto 0),
                            out_7seg => A0);
    
    seg2: bcd7seg port map (bcd_in => C2(7 downto 4),
                            out_7seg => A1);
    
    seg3: bcd7seg port map (bcd_in => C2(11 downto 8),
                            out_7seg => A2);
    
    
end multiplicaesoma;
