library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity assignment_example is
end assignment_example;

architecture behav of assignment_example is
    signal a : std_logic := '0';
begin
    process
        variable b : integer := 0;
    begin
        a <= '1';  -- Signal assignment
        b := 5;    -- Variable assignment
        wait;
    end process;
end behav;
