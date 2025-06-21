library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity function_add_example is
end entity;

architecture behav of function_add_example is

    -- Function declaration and definition
    function addition(a : integer; b : integer) return integer is
        variable sum_result : integer;
    begin
        sum_result := a + b;
        return sum_result;
    end function;

    signal result : integer := 0;

begin

    process
    begin
        result <= addition(5, 7);  -- result will be 12
        wait;
    end process;

end behav;
