library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity if_example is
    port (
        enable : in  std_logic; -- Input enable signal
        data   : in  std_logic; -- Input data signal
        output : out std_logic  -- Output signal
    );
end if_example;

architecture Behavioral of if_example is
begin
    -- Combinational process to implement if statement logic
    process(enable, data)
    begin
        output <= '0'; -- Default output value
        if enable = '1' then
            output <= data; -- Assign data to output when enable is '1'
        end if;
    end process;
end Behavioral;
