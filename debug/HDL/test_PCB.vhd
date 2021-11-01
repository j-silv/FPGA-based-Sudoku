--------------------------------------------------------------------
-- Test PCB top level VHDL file
--------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; -- for shifting

entity test_PCB is
	port(
		keyboard_in : in std_logic_vector(9 downto 0);
		ROW_ON, COL_ON, DIG_ON : in std_logic;
		GIVEUP, DIFFSET, RSTGAME, NEWGAME, CHECKANS : in std_logic := '1';

		column_select : out std_logic_vector(8 downto 0) := "000000000";
		row_0, row_1, row_2, row_3, row_4, row_5, row_6, row_7, row_8 : out std_logic_vector(7 downto 0) := x"00";
		WRONG, CORRECT, DIFFEASY, DIFFMED, DIFFHARD: out std_logic

	);
end entity test_PCB;

architecture logic of test_PCB is
	constant LED_SEG_PATTERN : std_logic_vector(7 downto 0) := x"FF";
	constant LED_SEG_PATTERN_2 : std_logic_vector(7 downto 0) := x"00";
begin

  column_select(8 downto 0) <= NOT(keyboard_in(8 downto 0));

	row_0 <= LED_SEG_PATTERN;
	row_1 <= LED_SEG_PATTERN_2;
	row_2 <= LED_SEG_PATTERN_2;
	row_3 <= LED_SEG_PATTERN_2;
	row_4 <= LED_SEG_PATTERN_2;
	row_5 <= LED_SEG_PATTERN_2;
	row_6 <= LED_SEG_PATTERN_2;
	row_7 <= LED_SEG_PATTERN_2;
	row_8 <= LED_SEG_PATTERN_2;

	-- CORRECT <= NEWGAME;
	-- WRONG <= CHECKANS;
	-- DIFFEASY <= RSTGAME;
	-- DIFFMED <= GIVEUP;
	-- DIFFHARD <= DIFFSET;


end architecture logic;