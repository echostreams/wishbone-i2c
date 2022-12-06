library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;


entity PULLUP is
    port(v101: OUT std_logic);
end PULLUP;

architecture archPULLUP of PULLUP is
    
    
begin
    v101 <= 'H';
    
end archPULLUP;
