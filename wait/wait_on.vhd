library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FF is                                         
  port(
        D, CLK : in bit;                              
        Q      : out bit
    );                               
end FF; 

architecture BEH1 of FF is
begin
  process
  begin
    wait on CLK;
    if (CLK = '1') then
      Q <= D;
    end if;
  end process;
end BEH1;
