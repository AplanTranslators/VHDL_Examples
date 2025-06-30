library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift_register is
    generic (
        WIDTH : natural := 4  -- Generic to set register width
    );
    port (
        clk   : in  std_logic;
        rst   : in  std_logic;
        din   : in  std_logic;
        dout  : out std_logic_vector(WIDTH-1 downto 0)
    );
end entity shift_register;

architecture behavioral of shift_register is
    signal shift_reg : std_logic_vector(WIDTH-1 downto 0);
begin
    process (clk, rst)
    begin
        if rst = '1' then
            shift_reg <= (others => '0');
        elsif rising_edge(clk) then
            shift_reg <= shift_reg(WIDTH-2 downto 0) & din;
        end if;
    end process;
    dout <= shift_reg;
end architecture behavioral;