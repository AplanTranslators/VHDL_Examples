library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package package_example is
    constant WIDTH : integer := 8;
    function double(x : integer) return integer;
end package package_example;

package body package_example is
    function double(x : integer) return integer is
    begin
        return x * 2;
    end function;
end package body package_example;
