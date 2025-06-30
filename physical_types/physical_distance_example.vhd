library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity physical_distance_example is
end entity;

architecture behav of physical_distance_example is
    -- Define a physical type for distance
    type DISTANCE is range 0 to 1_000_000 units
        um;                     -- micrometer (primary unit)
        mm = 1000 um;           -- millimeter
        cm = 10 mm;             -- centimeter
        m  = 100 cm;            -- meter
        km = 1000 m;            -- kilometer
        inch = 25400 um;        -- inch
        foot = 12 inch;         -- foot
    end units DISTANCE;

    signal d1, d2 : DISTANCE;
begin
    process
    begin
        d1 <= 25 mm;
        d2 <= 1 foot;
        wait;
    end process;
end behav;
