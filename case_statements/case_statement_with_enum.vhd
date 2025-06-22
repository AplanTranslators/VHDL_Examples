library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity case_enum is
    port (
        state : in std_logic_vector(1 downto 0);
        outp  : out std_logic
    );
end case_enum;

architecture behav of case_enum is
    type state_type is (idle, busy, done);
    signal s : state_type := idle;
begin
    process(s)
    begin
        case s is
            when idle => outp <= '0';
            when busy => outp <= '1';
            when done => outp <= 'Z';
        end case;
    end process;
end behav;
