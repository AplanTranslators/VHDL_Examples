library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.package_example.all;  -- Import the package

entity tb_pkg_func_example is
end entity;

architecture sim of tb_pkg_func_example is
    signal a : integer := 0;
    signal y : integer;
begin
    process
        variable tb_result : integer;
    begin
        -- Use the package function directly in the testbench
        a <= 5;
        wait for 10 ns;
        tb_result := double(a);  -- Call the function from the package
        report "double(" & integer'image(a) & ") = " & integer'image(tb_result);

        a <= -3;
        wait for 10 ns;
        tb_result := double(a);
        report "double(" & integer'image(a) & ") = " & integer'image(tb_result);

        wait;
    end process;
end sim;
