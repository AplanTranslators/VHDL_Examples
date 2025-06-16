library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity signal_declaration is
    port (
        A, B : in  STD_LOGIC;
        Y    : out STD_LOGIC
    );
end signal_declaration;

architecture Behavioral of signal_declaration is
    -- Signal declaration
    signal temp_signal : STD_LOGIC;  -- Signal declaration
begin
    temp_signal <= A xor B;
    Y <= temp_signal;
end Behavioral;