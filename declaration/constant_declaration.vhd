library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity constant_declaration is
    port (
        A, B : in  STD_LOGIC;
        Y    : out STD_LOGIC
    );
end constant_declaration;

architecture Behavioral of constant_declaration is
    -- Constant declaration
    constant DELAY : time := 5 ns;  
begin
    Y <= A and B after DELAY;
end Behavioral;
