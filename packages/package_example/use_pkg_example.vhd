library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.package_example.all;  -- Import everything from the package

entity use_pkg_example is
    port (
        a : in  integer;
        y : out integer
    );
end use_pkg_example;

architecture rtl of use_pkg_example is
    signal temp : integer;
begin
    process(a)
    begin
        temp <= double(a);   -- Use the function from the package
        y <= temp + WIDTH;   -- Use the constant from the package
    end process;
end rtl;
