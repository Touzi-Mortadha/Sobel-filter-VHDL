Library ieee;
use ieee.std_logic_1164.all ;
entity BASCULE_D is
  port(D, CLK, rst: in std_logic;
       Q: OUT std_logic );
end BASCULE_D;
architecture ACH_BASCULE_D of BASCULE_D is
  begin
   process (CLK)
     begin
       if (CLK='1') then 
		if(rst='1') then
			q<='0';
		else
			Q <= D ;
		end if;
       end if ;
     end process;
end ACH_BASCULE_D;
