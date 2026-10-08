library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity declaration
entity CaseIf is
    Port (
        A     : in  STD_LOGIC;  -- First input
        B     : in  STD_LOGIC;  -- Second input
        SEL   : in  STD_LOGIC;  -- Selector
        OUTP  : out STD_LOGIC   -- Output
    );
end CaseIf;

-- Architecture body
architecture Behavioral of CaseIf is
begin
    process (A, B, SEL)
    begin
        case SEL is
            when '0' =>
                -- IF statement inside the CASE for SEL = '0'
                if A = '1' then
                    OUTP <= '1';  -- Output '1' when SEL = '0' and A = '1'
                else
                    OUTP <= '0';  -- Output '0' when SEL = '0' and A /= '1'
                end if;
                
            when '1' =>
                OUTP <= B;  -- Output B when SEL = '1'

            when others =>
                OUTP <= '0';  -- Default output for undefined SEL values
        end case;
    end process;
end Behavioral;
