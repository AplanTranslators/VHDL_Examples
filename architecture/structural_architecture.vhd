library ieee;
use ieee.std_logic_1164.all;

entity half_adder is                     -- Entity declaration for half adder 
  port (a, b: in std_logic;
    sum, carry_out: out std_logic);
end half_adder;

architecture structure of half_adder is     -- Architecture body for half adder

  component xor_gate                    -- xor component declaration
    port (i1, i2: in std_logic; 
      o1: out std_logic);
  end component;

  component and_gate                    -- and component declaration
    port (i1, i2: in std_logic;
      o1: out std_logic);
  end component; 

begin
   u1: xor_gate port map (i1 => a, i2 => b, o1 => sum);
   u2: and_gate port map (i1 => a, i2 => b, o1 => carry_out);
-- We can also use Positional Association
--    => u1: xor_gate port map (a, b, sum); 
--    => u2: and_gate port map (a, b, carry_out);
end structure;