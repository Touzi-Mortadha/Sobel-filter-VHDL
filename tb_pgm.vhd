library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

use work.config.all ;
use work.libv.all;
use work.pgm.all;

entity tb_pgm is
end entity tb_pgm;

architecture test of tb_pgm is
component pgm_trt is
	port(
		pixin: IN pixel;
		xin,yin: IN integer range 2047 downto 0;
		pixinclk, frminval , pixinval: in std_logic;
		pixout : OUT pixel;
		xout,yout: OUT integer range 2047 downto 0;
		pixoutclk, frmoutval, pixoutval: out std_logic
	);
end component;
	signal xin,yin,xout,yout  :integer range 2047 downto 0;
	signal pixin ,pixout: pixel;
	signal frminval,frmoutval,pixinclk, pixoutclk, pixinval,pixoutval : std_logic;
begin  -- architecture test
  trt: pgm_trt port map (pixin,xin,yin,pixinclk, frminval,pixinval,pixout,xout,yout,pixoutclk,frmoutval,pixoutval);
test1 : process
	variable data : pixel_array_ptr;
	variable ret: pixel_array_ptr;
  variable x,y : integer range 0 to 2047;

    begin  -- process test1
          -- test on a proper image
        data := pgm_read(input_path);
        ret    := new pixel_array(0 to data.all'length(1) - 1, 0 to data.all'length(2) -1);
		-- loop on pixels
		frminval<='0';
		pixinval<='1';
		for y in 0 to data.all'length(2) - 1 loop
		  for x in 0 to data.all'length(1) - 1 loop
				xin<=x;
				yin<=y;
				pixin<=data(x,y)*16;
				if(pixoutval='1')then
				  ret(xout,yout):=pixout;
				  end if;
				pixinclk<='1';
				wait for 1 ns;
				pixinclk <='0';
				wait for 1 ns;
			end loop;
		end loop;
		frminval<='1';
		pixinval<='0';
		while frmoutval='0' loop
			if(xin=1279) then
				xin<=0;
				if(yin=719) then
					yin<=0;
				else
					yin<=yin+1;
				end if;
			else
				xin<=xin+1;
			end if;
			pixin<=data(xin,yin);
			if(pixoutval='1') then
				  ret(xout,yout):=pixout;
			end if;
			pixinclk<='1';
			wait for 1 ns;
			pixinclk <='0';
			wait for 1 ns;
		end loop;
		-- Write output
        pgm_write(output_path, ret.all);
        report "End of tests" severity note;
        wait;
    end process test1;

end architecture test;
