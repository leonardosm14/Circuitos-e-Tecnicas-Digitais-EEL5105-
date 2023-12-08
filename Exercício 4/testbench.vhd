library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end testbench;

architecture tb of testbench is

    signal clock: std_logic := '0';
    signal reset, B: std_logic;
    signal S: std_logic_vector(1 downto 0);

    component FSM is port (
        clock, reset, B: in std_logic;
        S: out std_logic_vector(1 downto 0));
    end component;
    
begin

    clock <= not clock after 10 ns;
    DUT: FSM port map (clock => clock,
                                reset => reset,
                                S => S,
                                B => B);
                                
    reset <= '0', '1' after 20 ns,'0' after 30 ns;
    B <= '0', '1' after 20 ns;
    
end tb;
