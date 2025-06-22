-- Include IEEE library for standard logic types
library ieee;
-- Use standard logic package for std_logic type
use ieee.std_logic_1164.all;

-- Entity declaration for half-adder
entity half_adder is
  port (
    a, b : in std_logic;            -- Input signals for the two bits to be added
    sum, carry_out : out std_logic  -- Output signals for sum and carry-out
  ); 
end half_adder;

-- Dataflow architecture for half-adder
architecture dataflow of half_adder is 
begin
  -- Concurrent signal assignment for sum output
  -- Describes data flow from inputs a and b through an XOR function to produce sum
  -- Implements an XOR gate in hardware to compute sum = a XOR b
  sum <= a xor b;
  
  -- Concurrent signal assignment for carry-out output
  -- Describes data flow from inputs a and b through an AND function to produce carry_out
  -- Implements an AND gate in hardware to compute carry_out = a AND b
  carry_out <= a and b; 
end dataflow;