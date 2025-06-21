library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity add_proc_example is
    port (
        x : in integer;
        y : in integer;
        z : out integer
    );
end add_proc_example;

architecture behav of add_proc_example is
    procedure add_int(
        a : in integer;
        b : in integer;
        result : out integer
    ) is
    begin
        result := a + b;
    end procedure add_int;
begin
    process(x, y)
    begin
        add_int(x, y, z);
    end process;
end behav;
