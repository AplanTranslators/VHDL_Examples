library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or_gate is
    port (
        X, Y : in  STD_LOGIC;
        Z    : out STD_LOGIC
    );
end or_gate;

architecture Behavioral of or_gate is
begin
    Z <= X or Y;
end Behavioral;
