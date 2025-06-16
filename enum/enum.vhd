library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fsm_controller is
    port (
        Clk, Reset : in  STD_LOGIC;
        State_Out  : out STD_LOGIC_VECTOR(1 downto 0)
    );
end fsm_controller;

architecture Behavioral of fsm_controller is
    type state_type is (IDLE, RUN, STOP);
    signal state : state_type := IDLE;
begin

    process (Clk, Reset)
    begin
        if Reset = '1' then
            state <= IDLE;
        elsif rising_edge(Clk) then
            case state is
                when IDLE => state <= RUN;
                when RUN  => state <= STOP;
                when STOP => state <= IDLE;
            end case;
        end if;
    end process;

    -- Direct state-to-vector mapping
    with state select
        State_Out <= "00" when IDLE,
                     "01" when RUN,
                     "10" when STOP;

end Behavioral;
