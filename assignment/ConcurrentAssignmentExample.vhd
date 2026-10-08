LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity ConcurrentAssignment is
    Port (
        A, B, C : in std_logic;
        RES1, RES2, RES3 : out std_logic
    );
end ConcurrentAssignment;

architecture Behavioral of ConcurrentAssignment is
begin
    -- Concurrent signal assignments
    RES1 <= A and B;
    RES2 <= B or C;

    -- Process with an if statement
    P1 : process(A, B, C)
        variable temp1, temp2 : std_logic;
    begin
        if (A = '1' and B = '1') then
            temp1 <= '1';
        else
            temp1 <= '0';
        end if;

        if (C = '1') then
            temp2 <= '1';
        else
            temp2 <= '0';
        end if;

        RES3 <= temp1 or temp2;
    end process;

end Behavioral;
