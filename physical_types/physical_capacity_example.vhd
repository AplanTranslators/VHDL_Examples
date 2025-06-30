library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Define a simple entity with no ports
entity physical_capacity_example is
end entity;

architecture behav of physical_capacity_example is
    -- ===============================
    -- Define a user-defined PHYSICAL TYPE
    -- ===============================
    -- The type 'CAPACITY' represents electrical capacitance values.
    -- The range is set from 0 to 1,000,000 to accommodate up to 1 microfarad (1 uF),
    -- since 1 uF = 1,000,000 pF (picofarads).
    type CAPACITY is range 0 to 1_000_000 units
        pF;                -- Primary unit: picofarad
        nF = 1000 pF;      -- 1 nanofarad = 1000 picofarads
        uF = 1000 nF;      -- 1 microfarad = 1000 nanofarads
        mF = 1000 uF;      -- 1 millifarad = 1000 microfarads
        F  = 1000 mF;      -- 1 farad = 1000 millifarads
    end units CAPACITY;

    -- Declare a signal of type CAPACITY and initialize it to 10 nanofarads
    -- 10 nF = 10,000 pF (well within the declared range)
    signal cap : CAPACITY := 10 nF;

begin
    -- A simple process that updates the signal 'cap' to a new value
    process
    begin
        -- Assign 1 microfarad to 'cap'
        -- 1 uF = 1,000,000 pF, which is the upper bound of the defined range
        cap <= 1 uF;
        wait;  -- Wait forever (stops simulation here)
    end process;
end behav;
