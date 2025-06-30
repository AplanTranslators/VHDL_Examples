library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu is
    generic (
        OPERATION : string := "ADD"  -- "ADD" or "SUB"
    );
    port (
        a, b : in  std_logic_vector(3 downto 0);
        result : out std_logic_vector(3 downto 0)
    );
end entity alu;

architecture behavioral of alu is
begin
    process (a, b)
        variable a_signed, b_signed : signed(3 downto 0);
    begin
        a_signed := signed(a);
        b_signed := signed(b);
        if OPERATION = "ADD" then
            result <= std_logic_vector(a_signed + b_signed);
        elsif OPERATION = "SUB" then
            result <= std_logic_vector(a_signed - b_signed);
        else
            result <= (others => '0');
        end if;
    end process;
end architecture behavioral;