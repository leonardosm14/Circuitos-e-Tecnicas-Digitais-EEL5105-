library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end testbench;

architecture tb of testbench is

    signal meuclock: std_logic := '0';
    signal EN, RST, max: std_logic;
    signal D: std_logic_vector(4 downto 0);

    component contador is port (
        CLK, EN, RST: in std_logic;
        S: out std_logic_vector(4 downto 0);
        max: out std_logic);
    end component;
    
begin

    meuclock <= not meuclock after 10 ns;
    DUT: contador port map (CLK => meuclock,
                                EN => EN,
                                RST => RST,
                                S => D,
                                max => max);
                                
    EN <= '0', '1' after 20 ns,'0' after 30 ns, '1' after 40 ns;
    RST <= '0', '1' after 20 ns, '0' after 30 ns, '1' after 40 ns;
    
end tb;
