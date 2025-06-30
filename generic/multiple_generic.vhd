library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter is
    generic (
        WIDTH : natural := 4;  -- Counter bit width
        STEP  : natural := 1   -- Increment step
    );
    port (
        clk   : in  std_logic;
        rst   : in  std_logic;
        count : out std_logic_vector(WIDTH-1 downto 0)
    );
end entity counter;

architecture behavioral of counter is
    signal count_reg : unsigned(WIDTH-1 downto 0);
begin
    process (clk, rst)
    begin
        if rst = '1' then
            count_reg <= (others => '0');
        elsif rising_edge(clk) then
            count_reg <= count_reg + STEP;
        end if;
    end process;
    count <= std_logic_vector(count_reg);
end architecture behavioral;