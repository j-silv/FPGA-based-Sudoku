--------------------------------------------------------------------
-- Test hardware circuit for LED driver
--------------------------------------------------------------------

--------------------------------------------------------------------
-- This simple circuit turns on a column with all LED segments for 
-- that row illuminated. The current passing through the LED driver
-- IC (currently ULN2003A) can be determined and this will be 
-- the max current for the LED grid at any given moment
--------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity test_LED_driver_current is
	port(
		column_select : out std_logic_vector(2 downto 0);
		row_0, row_1 : out std_logic_vector(7 downto 0) := "00000000"
	);
end entity test_LED_driver_current;

architecture logic of test_LED_driver_current is
begin
	-- testing just the current going through the first column 
	-- when all LED segments are illuminated
	column_select <= "001";
	row_0 <= "11111111";
	row_1 <= "11111111";
end architecture logic;