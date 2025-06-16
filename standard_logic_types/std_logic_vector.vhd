library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity std_logic_vector is
    port (
        A, B : in  STD_LOGIC_VECTOR(1 downto 0); -- 2-bit input vectors
        Equal : out STD_LOGIC                    -- Single-bit output
    );
end std_logic_vector;

architecture Behavioral of std_logic_vector is
    -- Signal declaration using STD_LOGIC_VECTOR
    signal temp_vector : STD_LOGIC_VECTOR(1 downto 0);

begin
    -- Combinational logic
    process (A, B)
    begin
        temp_vector <= A; -- Store input A temporarily
        if temp_vector = B then
            Equal <= '1'; -- Set output if A equals B
        else
            Equal <= '0';
        end if;
    end process;
end Behavioral;