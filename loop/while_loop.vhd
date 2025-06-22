library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_clock_gen is
end tb_clock_gen;

architecture Behavioral of tb_clock_gen is
    signal clk : std_logic := '0';
    constant TIMEOUT : time := 100 ns;
begin
    process
        variable start_time : time := NOW;
    begin
        while NOW < start_time + TIMEOUT loop
            clk <= not clk;
            wait for 5 ns;
        end loop;
        wait;
    end process;
end Behavioral;
