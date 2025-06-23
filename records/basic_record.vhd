library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity record_basic is
end entity;

architecture behav of record_basic is
    -- Declare a record type
    type uart_record_t is record
        rx  : std_logic;
        cts : std_logic;
        tx  : std_logic;
        rts : std_logic;
    end record;

    -- Declare a signal of the record type
    signal uart : uart_record_t;
begin
    process
    begin
        uart.rx  <= '1';
        uart.cts <= '0';
        uart.tx  <= '1';
        uart.rts <= '0';
        wait;
    end process;
end behav;
