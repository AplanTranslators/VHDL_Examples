library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity record_aggregate_example is
end entity;

architecture behav of record_aggregate_example is
    type mytype is record
        field1 : std_logic;
        field2 : std_logic_vector(3 downto 0);
    end record;

    signal myrec : mytype;
begin
    process
    begin
        -- Aggregate assignment
        myrec <= (field1 => '1', field2 => "1010");
        wait;
    end process;
end behav;
