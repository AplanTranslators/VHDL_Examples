library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity func_conditional_return is
    port (
        a, b   : in  integer; -- Input values to compare
        result : out integer  -- Minimum value output
    );
end entity;

architecture rtl of func_conditional_return is
    function min(a, b : integer) return integer is
        variable result : integer;
    begin
        if a < b then
            result := a;
        else
            result := b;
        end if;
        return result;
    end function;
begin
    -- Concurrent assignment using the function
    result <= min(a, b);
end rtl;