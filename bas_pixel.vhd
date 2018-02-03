Library ieee;
use ieee.std_logic_1164.all ;
entity BAS_PIXEL is
	generic (N: integer :=10);
	port(
		grayscale : IN std_logic_vector(N-1 downto 0);
		CLK, rst: in std_logic;
		grayscale_out: OUT std_logic_vector(N-1 downto 0)
	);
end BAS_PIXEL;
architecture ACH_BAS_PIXEL of BAS_PIXEL is
	component BAS_NBIT is
		generic(N: integer := 10);
		port(
			D : IN std_logic_vector(N-1 downto 0);
			CLK, rst: in std_logic;
			Q: OUT std_logic_vector(N-1 downto 0)
		);
	end component;
begin
	BAS_G: BAS_NBIT generic map(N) port map (grayscale,CLK,RST,grayscale_out);
end ACH_BAS_PIXEL;
