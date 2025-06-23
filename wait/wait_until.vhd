library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FF is                                         
  port(
        D, CLK : in bit;                              
        Q      : out bit
    );                               
end FF; 

architecture BEH2 of FF is
begin
  process
  begin
    wait until CLK = '1';
    Q <= D;
  end process;
end BEH2;
