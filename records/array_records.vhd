library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; -- Added for to_unsigned function

entity record_array_example is
end entity;

architecture behav of record_array_example is
    -- Define a record type with two std_logic_vector fields
    type rec_type is record
        a : std_logic_vector(3 downto 0); -- 4-bit field a
        b : std_logic_vector(0 to 3);     -- 4-bit field b (note: 0 to 3 is equivalent to 3 downto 0)
    end record;

    -- Define an array of rec_type records
    type rec_array is array (0 to 1) of rec_type;

    -- Signal to hold the array of records
    signal my_array : rec_array;
begin
    -- Process to initialize the array
    process
    begin
        -- Assign binary values to the record fields
        my_array(0).a <= "1010"; -- Binary 10
        my_array(0).b <= "0101"; -- Binary 5
        my_array(1).a <= "1100"; -- Binary 12
        my_array(1).b <= "1000"; -- Binary 8

        wait; -- Suspend process indefinitely
    end process;
end behav;