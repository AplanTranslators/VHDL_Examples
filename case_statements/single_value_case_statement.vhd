library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity declaration for a simple case statement example
entity case_example is
    port (
        sel : in std_logic_vector(1 downto 0); -- 2-bit input selector
        y   : out std_logic                   -- Single-bit output
    );
end case_example;

architecture behav of case_example is
begin
    -- Combinational process to implement case statement logic
    process(sel)
    begin
        -- Case statement to select output based on sel input
        case sel is
            when "00" => 
                y <= '0'; -- Output '0' when sel is "00"
            when "01" => 
                y <= '1'; -- Output '1' when sel is "01"
            when others => 
                y <= 'Z'; -- Output high impedance ('Z') for all other values (e.g., "10", "11", or non-'0'/'1' values like 'X', 'U')
        end case;
    end process;
end behav;