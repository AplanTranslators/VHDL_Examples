library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity variable_declaration is
    port (
        A, B : in  STD_LOGIC; -- Single-bit inputs
        Y    : out STD_LOGIC  -- Single-bit output
    );
end variable_declaration;

architecture Behavioral of variable_declaration is
begin
    process (A, B)
        -- Variable declaration (can only be defined in a process)
        variable temp_result : STD_LOGIC;
    begin
        -- Variable assignment
        temp_result := A xor B;
        -- Output assignment
        Y <= temp_result;
    end process;
end Behavioral;