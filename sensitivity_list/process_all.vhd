library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comb_all is
    port (
        a, b, c : in  std_logic;
        y       : out std_logic
    );
end comb_all;

architecture rtl of comb_all is
begin
    --Using process(all) in VHDL-2008
    process(all)  -- Automatically sensitive to all signals read inside
    begin
        y <= (a and b) or c;
    end process;
end rtl;
