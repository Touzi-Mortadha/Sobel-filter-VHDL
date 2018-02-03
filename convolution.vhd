library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use work.pgm.all;
use work.extra_types.all;


entity convolution is
	port(
		pix_mat : IN pixel_matrix;
		sobel_mat : IN matrice_int;
    G : OUT integer
	);
end entity;

architecture convolution_arch of convolution is

	begin
			--> return the absolute convolution value of pix_mat & sobel_mat
			G<=abs((pix_mat(0,0)*sobel_mat(0,0)+pix_mat(0,1)*sobel_mat(1,0)+pix_mat(0,2)*sobel_mat(2,0))+(pix_mat(1,0)*sobel_mat(0,1)+pix_mat(1,1)*sobel_mat(1,1)+pix_mat(1,2)*sobel_mat(2,1))+(pix_mat(2,0)*sobel_mat(0,2)+pix_mat(2,1)*sobel_mat(1,2)+pix_mat(2,2)*sobel_mat(2,2)));

end architecture;
