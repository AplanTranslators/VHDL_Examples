library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity unconstrained_array_example is
end unconstrained_array_example;

architecture behav of unconstrained_array_example is
    type INT_ARRAY is array (integer range <>) of integer;
    signal numbers : INT_ARRAY(1 to 4) := (1, 2, 3, 4);
begin
    process
    begin
        numbers(2) <= 10;
        wait;
    end process;
end behav;
