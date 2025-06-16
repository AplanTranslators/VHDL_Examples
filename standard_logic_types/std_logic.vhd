library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity std_logic_example is
    port (
        A, B : in  STD_LOGIC; -- Single-bit inputs
        Y    : out STD_LOGIC  -- Single-bit output
    );
end std_logic_example;

architecture Behavioral of std_logic_example is
    -- Signal declaration using STD_LOGIC
    signal temp : STD_LOGIC;

begin
    -- Combinational logic
    process (A, B)
    begin
        temp <= A and B; -- AND operation
        Y <= temp;       -- Assign to output
    end process;
end Behavioral;