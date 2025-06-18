library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity elsif_example is
    port (
        sel : in std_logic_vector(1 downto 0);
        a, b, c : in std_logic;
        y : out std_logic
    );
end elsif_example;

architecture behav of elsif_example is
begin
    process(sel, a, b, c)
    begin
        if sel = "00" then
            y <= a;
        elsif sel = "01" then
            y <= b;
        else
            y <= c;
        end if;
    end process;
end behav;
