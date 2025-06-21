-- Package declaration (in separate file or same file)
package math_ops is
    function add (a, b : integer) return integer;
end package math_ops;

-- Package body
package body math_ops is
    function add (a, b : integer) return integer is
    begin
        return a + b;
    end function;
end package body math_ops;

-- Entity using the package
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.math_ops.all;

entity package_function_example is
end entity;

architecture behav of package_function_example is
    signal result : integer := 0;
begin
    process
    begin
        result <= add(5, 7);  -- Returns 12
        wait;
    end process;
end behav;
