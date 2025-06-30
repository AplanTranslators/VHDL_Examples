library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- ===========================
-- Package Declaration and Body
-- ===========================

-- Declare a package named "math_pkg"
-- This package contains a constant and a function definition
package math_pkg is
    constant FACTOR : integer := 4;  -- Multiplier constant used in the function
    function multiply(x : integer) return integer;  -- Function declaration
end package math_pkg;

-- Define the body of the package "math_pkg"
-- The body contains the actual implementation of the function
package body math_pkg is
    function multiply(x : integer) return integer is
    begin
        return x * FACTOR;  -- Multiply input x by the constant FACTOR
    end function;
end package body math_pkg;

-- ===========================
-- Entity Using the Package
-- ===========================

-- Define an entity named "pkg_entity_example"
-- It has one integer input 'a' and one integer output 'y'
entity pkg_entity_example is
    port (
        a : in  integer;  -- Input value to be multiplied
        y : out integer   -- Output result after multiplication
    );
end pkg_entity_example;

-- Define the architecture of the entity
-- This architecture uses the "math_pkg" package
architecture rtl of pkg_entity_example is
    use work.math_pkg.all;  -- Import all declarations from the math_pkg package
begin
    process(a)
    begin
        y <= multiply(a);  -- Call the 'multiply' function from the package
    end process;
end rtl;
