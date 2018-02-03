Library ieee;
use ieee.std_logic_1164.all ;
use work.extra_types.all;
use ieee.numeric_std.all;


entity REG_DEC_PIXEL_ALT_3x3 is
	generic(N: integer := 10;W: integer:=320);
	port(
			grayscale : IN std_logic_vector(N-1 downto 0);
			CLK, rst: in std_logic;
			mask : out pixel_matrix(0 to 2,0 to 2)
		);
end REG_DEC_PIXEL_ALT_3x3;
architecture ACH_REG_DEC_PIXEL_ALT_3x3 of REG_DEC_PIXEL_ALT_3x3 is
	Component REG_DEC_PIXEL is
	generic(N: integer := 10;W: integer:=320);
		port(
				grayscale : IN std_logic_vector(N-1 downto 0);
				CLK, rst: in std_logic;
				grayscale_out: OUT std_logic_vector(N-1 downto 0)
			);
	end Component;
	Component BAS_PIXEL is
		generic (N: integer :=10);
		port(
			grayscale : IN std_logic_vector(N-1 downto 0);
			CLK, rst: in std_logic;
			grayscale_out: OUT std_logic_vector(N-1 downto 0)
		);
	end Component;
	signal M11,M12,M13,M21,M22,M23,M31,M32,M33 : std_logic_vector (N-1 downto 0);
begin
	REG_DEC_1: REG_DEC_PIXEL generic map (N,W) port map (grayscale,clk,rst,M33);
	REG_DEC_2: REG_DEC_PIXEL generic map (N,W) port map (M33,clk,rst,M23);
	REG_DEC_3: REG_DEC_PIXEL generic map (N,W) port map (M23,clk,rst,M13);

	BAS_PIX_33_32: BAS_PIXEL generic map (N) port map (M33,clk,rst,M32);
	BAS_PIX_23_22: BAS_PIXEL generic map (N) port map (M23,clk,rst,M22);
	BAS_PIX_13_12: BAS_PIXEL generic map (N) port map (M13,clk,rst,M12);

	BAS_PIX_32_31: BAS_PIXEL generic map (N) port map (M32,clk,rst,M31);
	BAS_PIX_22_21: BAS_PIXEL generic map (N) port map (M22,clk,rst,M21);
	BAS_PIX_12_11: BAS_PIXEL generic map (N) port map (M12,clk,rst,M11);

	mask(0,0)<=to_integer(unsigned(M11));
	mask(0,1)<=to_integer(unsigned(M12));
	mask(0,2)<=to_integer(unsigned(M13));
	mask(1,0)<=to_integer(unsigned(M21));
	mask(1,1)<=to_integer(unsigned(M22));
	mask(1,2)<=to_integer(unsigned(M23));
	mask(2,0)<=to_integer(unsigned(M31));
	mask(2,1)<=to_integer(unsigned(M32));
	mask(2,2)<=to_integer(unsigned(M33));

end ACH_REG_DEC_PIXEL_ALT_3x3;
