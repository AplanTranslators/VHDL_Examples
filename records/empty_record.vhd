library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity empty_record_example is
end entity;

architecture rtl of empty_record_example is
    type empty_record is record
    end record;

    signal e : empty_record;
begin
    -- e can be used as a placeholder
end rtl;
