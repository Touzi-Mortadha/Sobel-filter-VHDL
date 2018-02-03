Library ieee;
use ieee.std_logic_1164.all ;
entity BAS_NBIT is
	generic(N: integer := 10);
	port(
			D : IN std_logic_vector(N-1 downto 0);
			CLK, rst: in std_logic;
			Q: OUT std_logic_vector(N-1 downto 0)
		);
end BAS_NBIT;
architecture ACH_BAS_NBIT of BAS_NBIT is
	component BASCULE_D is
		port(D, CLK, rst: in std_logic;
		Q: OUT std_logic );
	end Component;
	begin
	BAS_N: FOR i in 0 to N-1 generate
		BAS_i: bascule_d port map(d(i),CLK,RST,q(i));
	end generate;
end ACH_BAS_NBIT;
