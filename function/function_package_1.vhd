-- Package declaration for reusable ADD function
library IEEE;                          -- Include IEEE library for standard types
use IEEE.STD_LOGIC_1164.ALL;           -- Use standard logic package for BIT type

package PKG is
    -- Declare ADD function: takes three BIT inputs and returns a 2-bit BIT_VECTOR
    function ADD(A, B, CIN : BIT) return BIT_VECTOR;
end PKG;

-- Package body containing the implementation of the ADD function
package body PKG is
    function ADD(A, B, CIN : BIT) return BIT_VECTOR is
        variable S, COUT : BIT;        -- Variables for sum and carry-out
        variable RESULT : BIT_VECTOR(1 downto 0); -- 2-bit result (carry-out, sum)
    begin
        -- Calculate sum: A XOR B XOR CIN (full adder sum logic)
        S := A xor B xor CIN;
        -- Calculate carry-out: (A AND B) OR (A AND CIN) OR (B AND CIN)
        COUT := (A and B) or (A and CIN) or (B and CIN);
        -- Concatenate carry-out and sum into result vector
        RESULT := COUT & S;
        -- Return the 2-bit result (RESULT(1) = carry-out, RESULT(0) = sum)
        return RESULT;
    end ADD;
end PKG;

-- Main entity for 4-bit ripple-carry adder
use work.PKG.all;                      -- Import the ADD function from PKG package

entity function_package_1 is
    port(
        A, B : in BIT_VECTOR(3 downto 0);  -- 4-bit input vectors A and B
        CIN : in BIT;                      -- Single-bit carry-in input
        S : out BIT_VECTOR(3 downto 0);    -- 4-bit sum output
        COUT : out BIT                     -- Single-bit carry-out output
    );
end function_package_1;

-- Architecture implementing the 4-bit ripple-carry adder
architecture ARCHI of function_package_1 is
    -- Intermediate signals to store results of each single-bit addition
    signal S0, S1, S2, S3 : BIT_VECTOR(1 downto 0);
begin
    -- First stage: Add bit 0 of A and B with input carry CIN
    S0 <= ADD(A(0), B(0), CIN);
    -- Second stage: Add bit 1 of A and B with carry-out from S0
    S1 <= ADD(A(1), B(1), S0(1));
    -- Third stage: Add bit 2 of A and B with carry-out from S1
    S2 <= ADD(A(2), B(2), S1(1));
    -- Fourth stage: Add bit 3 of A and B with carry-out from S2
    S3 <= ADD(A(3), B(3), S2(1));
    -- Concatenate sum bits from each stage to form 4-bit sum output
    S <= S3(0) & S2(0) & S1(0) & S0(0);
    -- Assign final carry-out from the last stage
    COUT <= S3(1);
end ARCHI;