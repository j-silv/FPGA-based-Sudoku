--------------------------------------------------------------------
-- address counter decoder
--------------------------------------------------------------------

--------------------------------------------------------------------
-- combinational logic component used for determining
-- when to enable the appropiate column

-- this module ensures that the RAM conents
-- (row/column/digit information) is properly
-- "printed" out to the Sudoku game grid
--------------------------------------------------------------------

library ieee;
use ieee.numeric_std.all, ieee.std_logic_1164.all;

entity transparent_decoder is
	port(
		D : in std_logic_vector(7 downto 0);
		COL_SEL : out std_logic_vector(8 downto 0);
    SHIFT_OUT : out std_logic
	);
	
end entity transparent_decoder;


architecture cathode of transparent_decoder is
begin

  with D(3 downto 0) select
  SHIFT_OUT <= '1' when x"2",
               '0' when others;
  
	with D(7 downto 0) select
                               -- 9      8       7      6        5       4      3        2       1 (in first column shifting from bottom up)
	-- COL_SEL <=  "000000001" when x"03" | x"04" | x"05" | x"06" | x"07" | x"08" | x"10" | x"11" | x"12", -- this is when we are shifting through
 	COL_SEL <=  "000000001" when x"12" | x"13" | x"14" | x"15" | x"16" | x"17" | x"18" | x"20" | x"21", -- this is when the 2nd column is being shfited through
                                                                                                      -- so the 1st column is already shifted in waiting to be seen
              -- "000000010" when x"13" | x"14" | x"15" | x"16" | x"17" | x"18" | x"20" | x"21" | x"22",
              "000000010" when x"22" | x"23" | x"24" | x"25" | x"26" | x"27" | x"28" | x"30" | x"31" ,
              
              -- "000000100" when x"23" | x"24" | x"25" | x"26" | x"27" | x"28" | x"30" | x"31" | x"32",

              -- "000001000" when x"33" | x"34" | x"35" | x"36" | x"37" | x"38" | x"40" | x"41" | x"42",

              -- "000010000" when x"43" | x"44" | x"45" | x"46" | x"47" | x"48" | x"50" | x"51" | x"52",

              -- "000100000" when x"53" | x"54" | x"55" | x"56" | x"57" | x"58" | x"60" | x"61" | x"62",

              -- "001000000" when x"63" | x"64" | x"65" | x"66" | x"67" | x"68" | x"70" | x"71" | x"72",

              -- "010000000" when x"73" | x"74" | x"75" | x"76" | x"77" | x"78" | x"80" | x"81" | x"82",

              -- "100000000" when x"83" | x"84" | x"85" | x"86" | x"87" | x"88" | x"00" | x"01" | x"02",

              "000000000" when others;			
end cathode;