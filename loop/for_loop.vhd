library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity parity_checker is
    port (
        data : in  std_logic_vector(7 downto 0);
        parity : out std_logic
    );
end parity_checker;

architecture Behavioral of parity_checker is
begin
    process(data)
        variable temp : std_logic := '0';
    begin
        temp := '0';
        for i in data'range loop
            temp := temp xor data(i);
        end loop;
        parity <= temp;
    end process;
end Behavioral;
