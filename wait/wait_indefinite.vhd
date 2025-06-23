library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity wait_indefinite_example is
    port (d : out std_logic);
end wait_indefinite_example;

architecture behav of wait_indefinite_example is
begin
    process
    begin
        d <= '1';
        wait;  -- Waits forever, process never reactivates
    end process;
end behav;
