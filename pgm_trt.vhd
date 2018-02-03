library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.pgm.all;
use work.config.all;
use work.extra_types.all;


entity pgm_trt is
	port(
		pixin: IN pixel;
		xin,yin: IN integer range 2047 downto 0;
		pixinclk, frminval,pixinval : in std_logic;
		pixout : OUT pixel;
		xout,yout: OUT integer range 2047 downto 0;
		pixoutclk, frmoutval,pixoutval: out std_logic
	);

end entity;

architecture trt_arch of pgm_trt is

	component REG_DEC_PIXEL_ALT_3x3 is
		generic(N: integer := 10;W: integer:=320);
		port(
				grayscale : IN std_logic_vector(N-1 downto 0);
				CLK, rst: in std_logic;
				mask : out pixel_matrix(0 to 2,0 to 2)
			);
	end component;

	component sobel is
		port(
			pix_mat : IN pixel_matrix;
			pixout : OUT pixel
		);
	end component;

signal msk : pixel_matrix(0 to 2,0 to 2);
signal pixin_std : std_logic_vector(11 downto 0);
signal pixout_int: integer;
begin

	pixin_std<=conv_std_logic_vector(pixin,12);
	reg_dec_alt: REG_DEC_PIXEL_ALT_3x3 generic map (12,image_width) port map (pixin_std,pixinclk,'0',msk);

	sob: sobel port map(msk, pixout_int);

	pixout<=pixout_int;
  xout<=xin;
  yout<=yin;
  pixoutval <= pixinval;
  pixoutclk <= pixinclk;
  frmoutval <= frminval;
end trt_arch;
