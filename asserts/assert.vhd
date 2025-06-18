library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity assert_example is
end assert_example;

architecture behav of assert_example is
    signal a : std_logic := '0'; -- Signal 'a' is initialized to '0'
begin
    process
    begin
        -- Assert statement:
        -- Condition: a = '1'
        -- Message if condition is FALSE: "Signal a is not high!"
        -- Severity if condition is FALSE: error
        assert a = '1' report "Signal a is not high!" severity error;
        wait; -- The process suspends indefinitely after one execution
    end process;
end behav;