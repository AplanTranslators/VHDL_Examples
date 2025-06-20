library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity T08_IfTb is
end entity;
  
architecture sim of T08_IfTb is
  
    signal CountUp   : integer := 0;
    signal CountDown : integer := 10;
  
begin
  
    process is
    begin
  
        CountUp   <= CountUp + 1;
        CountDown <= CountDown - 1;
        wait for 10 ns;
  
    end process;
  
    process is
    begin
  
        if CountUp > CountDown then
            report "CountUp is larger";
        elsif CountUp < CountDown then
            report "CountDown is larger";
        else
            report "They are equal";
        end if;
  
        wait on CountUp, CountDown;
  
    end process;
  
end sim;