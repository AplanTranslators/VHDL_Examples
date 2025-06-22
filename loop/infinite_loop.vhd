library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity infinite_loop_example is
end infinite_loop_example;

architecture Behavioral of infinite_loop_example is
    signal clk : std_logic := '0';
    signal counter : integer := 0;
    constant TIMEOUT : integer := 100;  -- Stop after 100 clock cycles
begin
    -- Clock generation process
    clock_gen: process
    begin
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;
    end process;

    -- Main test process with infinite loop. Can be used ONLY in testbenches
    test_proc: process
    begin
        test_loop: loop
            -- Exit condition: Stop after TIMEOUT cycles
            exit test_loop when counter >= TIMEOUT;
            
            -- Wait for rising clock edge
            wait until rising_edge(clk);
            
            -- Update counter
            counter <= counter + 1;
            
            -- Report progress
            report "Cycle: " & integer'image(counter);
        end loop test_loop;
        
        -- Final report and stop
        report "Simulation finished after " & integer'image(counter) & " cycles";
        wait;
    end process;
end Behavioral;
