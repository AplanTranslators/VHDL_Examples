library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity wait_for_time_example is
    port (a : out std_logic);
end wait_for_time_example;

architecture behav of wait_for_time_example is
begin
    process
    begin
        a <= '0';
        wait for 10 ns;      -- Waits for 10 nanoseconds
        a <= '1';
        wait;                -- Ends the process
    end process;
end behav;
