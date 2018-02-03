Library ieee;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all;

entity signed_adder is
  port(
    A,B: IN integer;
    C : OUT integer
  );
end entity;

architecture signed_adder_arch of signed_adder is
  begin
    C<=A+B;
end architecture ;
