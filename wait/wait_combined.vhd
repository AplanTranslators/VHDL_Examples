library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity wait_combined_example is
    port (
        trig : in std_logic;
        outp : out std_logic
    );
end wait_combined_example;

architecture behav of wait_combined_example is
begin
    process
    begin
        outp <= '0';
        wait until trig = '1';
        wait for 20 ns;
        outp <= '1';
        wait;
    end process;
end behav;
