library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comb_logic is
    port (
        a, b : in  std_logic;
        y    : out std_logic
    );
end comb_logic;

architecture rtl of comb_logic is
begin
    process(a, b)  -- Sensitivity list includes all inputs
    begin
        y <= a and b;
    end process;
end rtl;
