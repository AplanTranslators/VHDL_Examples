library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Define an entity with output ports for v1 and v2
entity physical_arithmetic_example is
    port (
        v1, v2 : out VOLTAGE
    );
end entity;

architecture behav of physical_arithmetic_example is
    -- ===============================
    -- Define a user-defined PHYSICAL TYPE for voltage
    -- ===============================
    type VOLTAGE is range 0 to 5000 units
        mV;        -- Primary unit: millivolt
        V = 1000 mV; -- 1 volt = 1000 millivolts
    end units VOLTAGE;

    -- Declare internal signals
    signal v1_int, v2_int : VOLTAGE;
begin
    -- Connect internal signals to ports
    v1 <= v1_int;
    v2 <= v2_int;

    -- Main simulation process
    process
    begin
        -- Assign 3300 millivolts to v1
        v1_int <= 3300 mV;

        -- Perform arithmetic on physical types:
        -- Add 1 volt (1000 mV) to v1 (3300 mV), result is 4300 mV
        v2_int <= v1_int + 1 V;

        wait;  -- Wait forever (halts the process after one evaluation)
    end process;
end behav;