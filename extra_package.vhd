library ieee;
use ieee.std_logic_1164.all;
use work.pgm.all;

package extra_types is

  --extra types
  subtype coordinate is natural;
  type pixel_matrix is array (coordinate range <>, coordinate range <>) of pixel;
  type matrice_int is array (0 to 2, 0 to 2) of integer;
end extra_types;
