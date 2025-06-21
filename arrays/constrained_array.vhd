library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity constrained_array_example is
end constrained_array_example;

architecture behav of constrained_array_example is
    type BYTE is array (7 downto 0) of std_logic;
    signal data : BYTE := (others => '0');
begin
    process
    begin
        data(0) <= '1';
        data(7) <= '1';
        wait;
    end process;
end behav;
