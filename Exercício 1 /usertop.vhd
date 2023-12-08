library ieee;
use ieee.std_logic_1164.all;

entity usertop is
port( A: in std_logic;
      B: in std_logic;
      C: in std_logic;
      D: in std_logic;
      W: out std_logic;
      X: out std_logic;
      Y: out std_logic;
      Z: out std_logic
	);
end usertop;

architecture exercicio of usertop is
begin
    
    W <= (not(A) and B and not(C)) or (A and not(B) and not(C)) or (not(B) and c and not(D)) or (not(a) and c);
    X <= (A and not(C) and not(D)) or (not(A) and B and D) or (A and not(B)) or (B and C); 
    Y <= (not(A) and not(B) and not(C) and not(D)) or (not(A) and not(B) and C and D) or (B and C and not(D)) or (A and B and not(D)) or (A and not(B) and not(C) and D);
    Z <= (not(A) and not(B) and not(C)) or (not(A) and not(B) and not(D));
    
end exercicio;
