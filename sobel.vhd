library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use work.pgm.all;
use ieee.numeric_std.all;
use work.extra_types.all;


entity sobel is
	port(
		pix_mat : IN pixel_matrix;
		pixout : OUT pixel
	);
end entity;

architecture sobel_arch of sobel is
  component CONVOLUTION is
		port(
			pix_mat : IN pixel_matrix;
			sobel_mat : IN matrice_int;
	    G : OUT integer
		);
  end component;

	component comparaison is
		port(
			A: in integer;
			B: out integer
		);
	end component;

	component signed_adder is
		port(
			A,B: IN integer;
			C : OUT integer
		);
	end component;



  signal Gx,Gy,G : integer;
  signal sum,tmp : integer;
	signal sobel_X : matrice_int :=((-1,0,1),(-2,0,2),(-1,0,1));
	signal sobel_Y : matrice_int :=((-1,-2,-1),(0,0,0),(1,2,1));

  begin

		--> return  |Gx| = pix_mat * sobel_X
		convolut_x: CONVOLUTION port map(pix_mat, sobel_X, Gx);
	--> return  |Gy| = pix_mat * sobel_Y
		convolut_y: CONVOLUTION port map(pix_mat, sobel_Y, Gy);
		--> return |sum| = |Gx| + |Gy|
		somme : signed_adder port map(Gx,Gy,sum);
		--> return 4080 if sum exceed 2^12(max size of pixel)
		comp : comparaison port map(sum,G);
		--> return pixout after passing by sobel filter
		pixout<= to_integer(to_unsigned(G, 12));

end architecture;
