library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity case_multiple_value is
    port (
        x : in integer range 0 to 9;
        z : out std_logic
    );
end case_multiple_value;

architecture behav of case_multiple_value is
begin
    process(x)
    begin
        case x is
            when 7 | 9 => z <= '1';
            when 2 | 4 | 6 => z <= '0';
            when others => z <= 'Z';
        end case;
    end process;
end behav;
