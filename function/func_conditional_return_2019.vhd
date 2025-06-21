library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity func_conditional_return is
end entity;

architecture rtl of func_conditional_return is
    function min(a, b : integer) return integer is
    begin
        return a when a < b else b;  -- Conditional return (VHDL 2019)
    end function;

    signal result : integer;
begin
    process
    begin
        result <= min(5, 7);  -- result = 5
        wait;
    end process;
end rtl;
