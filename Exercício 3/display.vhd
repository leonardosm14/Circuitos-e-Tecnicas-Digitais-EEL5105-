library ieee;
use ieee.std_logic_1164.all;

entity display is port( 
        CLK, EN, RST: in std_logic;
        S0, S1: out std_logic_vector(6 downto 0);
        max: out std_logic);
end display;

architecture y of display is

signal C0: std_logic_vector(4 downto 0);
signal C1: std_logic_vector(6 downto 0);

component contador is 
port (CLK, EN, RST: in std_logic;
        S: out std_logic_vector(4 downto 0);
        max: out std_logic);
end component;

component bin7seg99 is
port (
        binaryin: in std_logic_vector (6 downto 0);
        hex1, hex0: out std_logic_vector (6 downto 0));
end component;

begin

    valor: contador port map (CLK => CLK,
                              EN => EN,
                              RST => RST,
                              max => max,
                              S => C0);
    C1 <= "00" & C0;
                              
    disp: bin7seg99 port map (binaryin => C1,
                              hex1 => S1, 
                              hex0 => S0);

end y;
