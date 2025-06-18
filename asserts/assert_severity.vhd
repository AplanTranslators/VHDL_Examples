library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity assert_example is
    port (
        A, B : in  STD_LOGIC; -- Single-bit inputs
        Y    : out STD_LOGIC  -- Single-bit output (AND of inputs)
    );
end assert_example;

architecture Behavioral of assert_example is
    -- Signal for internal logic
    signal temp : STD_LOGIC;
begin
    -- Combinational logic: AND operation
    temp <= A and B;
    Y <= temp;

    -- Process to demonstrate assert statements with different severity levels
    process (A, B, temp)
    begin
        -- Assert: Check if A is not uninitialized ('U')
        assert A /= 'U'
            report "Input A is uninitialized ('U')"
            severity note; -- Informational, simulation continues

        -- Assert: Check if B is not unknown ('X')
        assert B /= 'X'
            report "Input B is unknown ('X')"
            severity warning; -- Caution, simulation typically continues

        -- Assert: Check if temp matches A and B (redundant check for demo)
        assert temp = (A and B)
            report "Internal signal temp does not match A and B"
            severity error; -- Serious issue, simulation may stop in some tools

        -- Assert: Check if Y is driven (not 'Z')
        assert Y /= 'Z'
            report "Output Y is high impedance ('Z')"
            severity failure; -- Critical, simulation usually stops
    end process;
end Behavioral;