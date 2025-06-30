-- Include IEEE library for standard logic types
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity declaration with a port for demonstration
entity assignment_example is
    port (
        output : out STD_LOGIC
    );
end entity assignment_example;

-- Behavioral architecture
architecture behav of assignment_example is
    signal a : std_logic := '0'; -- Signal with initial value '0'
begin
    -- Process to toggle signal a
    process
    begin
        a <= '0';
        wait for 10 ns;         -- Wait for 10 ns
        a <= '1';
        wait for 10 ns;         -- Wait for 10 ns
    end process;

    -- Connect signal a to output port
    output <= a;
end behav;

-- Structural architecture
architecture struct of assignment_example is
    signal a : std_logic := '0'; -- Signal a with initial value '0'
    signal b : std_logic := '1'; -- Additional signal for structural example
begin
    -- Simple concurrent assignment (structural style)
    a <= b and a; -- Example structural assignment (AND gate behavior)
    output <= a;  -- Connect signal a to output port
end struct;