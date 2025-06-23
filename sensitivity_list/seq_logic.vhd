library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seq_logic is
    port (
        clk   : in  std_logic;
        reset : in  std_logic;
        q     : out std_logic
    );
end seq_logic;

architecture rtl of seq_logic is
    signal q_reg : std_logic := '0';
begin
    process(clk, reset)  -- Sensitive to clock and reset
    begin
        if reset = '1' then
            q_reg <= '0';
        elsif rising_edge(clk) then
            q_reg <= not q_reg;
        end if;
    end process;

    q <= q_reg;
end rtl;
