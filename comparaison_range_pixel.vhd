Library ieee;
use ieee.std_logic_1164.all ;

entity comparaison is
	port(
		A: in  integer;
		B: out integer
	);
end entity;

architecture comparaison_arch of comparaison is
  begin
    B<= 4080 when A>4080 else
    	A;
end architecture ;
