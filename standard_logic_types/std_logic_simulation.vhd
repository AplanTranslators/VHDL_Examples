library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity std_logic_simulation_example is
    port (
        A, B : in  STD_LOGIC; -- Single-bit inputs
        Y    : out STD_LOGIC  -- Single-bit output
    );
end std_logic_simulation_example;

architecture Behavioral of std_logic_simulation_example is
    -- Signal declaration using STD_LOGIC
    -- STD_LOGIC supports 9 values: '0', '1', 'U' (uninitialized), 'X' (unknown), 
    -- 'Z' (high impedance), 'W' (weak unknown), 'L' (weak low), 'H' (weak high), '-' (don't care).
    -- Simulation-specific values ('U', 'X', 'Z', etc.) model real-world hardware states during simulation.
    signal temp : STD_LOGIC;

begin
    -- Combinational logic with simulation-specific value checks
    process (A, B)
    begin
        if A = 'U' or B = 'U' then
            temp <= 'U'; -- Output uninitialized if any input is uninitialized
        elsif A = 'X' or B = 'X' then
            temp <= 'X'; -- Output unknown if any input is unknown
        elsif A = 'Z' or B = 'Z' then
            temp <= 'Z'; -- Output high impedance if any input is high impedance
        else
            temp <= A and B; -- Perform AND operation for valid inputs ('0' or '1')
        end if;
        Y <= temp; -- Assign to output
    end process;
end Behavioral;