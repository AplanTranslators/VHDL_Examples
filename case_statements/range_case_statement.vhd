library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity case_range is
    port (
        x : in integer range 0 to 9;
        z : out std_logic
    );
end case_range;

architecture behav of case_range is
begin
    process(x)
    begin
        case x is
            when 1 to 5 => z <= '1';
            when others => z <= '0';
        end case;
    end process;
end behav;
