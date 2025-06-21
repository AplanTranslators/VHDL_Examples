library ieee ;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity array_mux8 is
port(
  d0     : in  std_logic_vector(1 downto 0);
  d1     : in  std_logic_vector(1 downto 0);
  d2     : in  std_logic_vector(1 downto 0);
  d3     : in  std_logic_vector(1 downto 0);
  d4     : in  std_logic_vector(1 downto 0);
  d5     : in  std_logic_vector(1 downto 0);
  d6     : in  std_logic_vector(1 downto 0);
  d7     : in  std_logic_vector(1 downto 0);
  s      : in  std_logic_vector(2 downto 0);
  m      : out std_logic_vector(1 downto 0));
end array_mux8;

architecture rtl of array_mux8 is
type t_array_mux is array (0 to 7) of std_logic_vector(1 downto 0);
signal array_mux  : t_array_mux;

begin

  array_mux(0)  <= d0;
  array_mux(1)  <= d1;
  array_mux(2)  <= d2;
  array_mux(3)  <= d3;
  array_mux(4)  <= d4;
  array_mux(5)  <= d5;
  array_mux(6)  <= d6;
  array_mux(7)  <= d7;

  m <= array_mux(to_integer(unsigned(s)));
  
end rtl;