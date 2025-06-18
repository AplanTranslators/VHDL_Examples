library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity enum_example is
end enum_example;

architecture behav of enum_example is
    type StateType is (Idle, Run, Stop);
    signal state : StateType := Idle;
begin
    process
    begin
        state <= Run;
        wait;
    end process;
end behav;
