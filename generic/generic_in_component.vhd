library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top is
    port (
        a8, b8   : in  std_logic_vector(7 downto 0);
        sum8     : out std_logic_vector(7 downto 0);
        a12, b12 : in  std_logic_vector(11 downto 0);
        sum12    : out std_logic_vector(11 downto 0)
    );
end top;

architecture rtl of top is
    component adder
        generic (WIDTH : integer := 8);
        port (
            A, B : in  std_logic_vector(WIDTH-1 downto 0);
            SUM  : out std_logic_vector(WIDTH-1 downto 0)
        );
    end component;
begin
    adder8 : adder
        generic map (WIDTH => 8)
        port map (A => a8, B => b8, SUM => sum8);

    adder12 : adder
        generic map (WIDTH => 12)
        port map (A => a12, B => b12, SUM => sum12);
end rtl;
