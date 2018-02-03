Library ieee;
use ieee.std_logic_1164.all ;
entity REG_DEC_PIXEL is
	generic(N: integer := 10;W: integer:=320);
	port(
			grayscale : IN std_logic_vector(N-1 downto 0);
			CLK, rst: in std_logic;
			grayscale_out: OUT std_logic_vector(N-1 downto 0)
		);
end REG_DEC_PIXEL;
architecture ACH_REG_DEC_PIXEL of REG_DEC_PIXEL is
	Component BAS_PIXEL is
		generic (N: integer :=10);
		port(
			grayscale : IN std_logic_vector(N-1 downto 0);
			CLK, rst: in std_logic;
			grayscale_out: OUT std_logic_vector(N-1 downto 0)
		);
	end Component;
	signal tmp : std_logic_vector (((w+1)*N) -1 downto 0);
begin
	tmp(N - 1 downto 0) <=grayscale;
	
	BAS_P: for i in 0 to w-1 generate
		BAS_Pi: BAS_PIXEL generic map (N) port map (tmp((i+1)*N-1 downto i*N),CLK,RST,tmp((i+2)*N-1 downto (i+1)*N));
	end generate;
	
	grayscale_out<=tmp(((w+1)*N) - 1 downto (w*N));

end ACH_REG_DEC_PIXEL;
