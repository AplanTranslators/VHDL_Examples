library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pulse_proc_example is
    port (
        pulse_out : out std_logic
    );
end pulse_proc_example;

architecture behav of pulse_proc_example is
    -- Procedure declaration in architecture declarative part
    procedure pulse_generate(
        signal pulse : inout std_logic;
        constant pulse_length : in time
    ) is
    begin
        pulse <= not pulse;
        wait for pulse_length;
        pulse <= not pulse;
    end procedure pulse_generate;
begin
    process
        constant dummy_time : time := 10 ns;
    begin
        pulse_out <= '0';
        wait for 10 ns;
        pulse_generate(pulse_out, dummy_time);
        wait;
    end process;
end behav;