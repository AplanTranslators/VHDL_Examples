library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity if_example is
    port (
        a, b : in std_logic;
        y    : out std_logic
    );
end if_example;

architecture behav of if_example is
begin
    process(a, b)
    begin
        if a = '1' then
            y <= b;
        else
            y <= '0';
        end if;
    end process;
end behav;
