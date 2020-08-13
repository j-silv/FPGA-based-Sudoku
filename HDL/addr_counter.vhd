--------------------------------------------------------------------
-- address counter
--------------------------------------------------------------------

--------------------------------------------------------------------
-- counts through the addresses in memory to access 
-- the LED matrix data and cycle through each column/row position
-- of the Sudoku grid.
--------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all,
	ieee.numeric_std.all;

entity addr_counter is 
	port(
		CLK,CNT_EN : in std_logic;
		Q : out std_logic_vector(7 downto 0) 
	);
end entity addr_counter;

architecture logic of addr_counter is 
	signal temp_Q : std_logic_vector(7 downto 0):=x"00";
	
	-- because bits 7-4 of the RAM address line correspond to
	-- the column position, to increment the column accessed
	-- hex 10 is added to the current column count
	constant COUNTCOLUMN : std_logic_vector(7 downto 0):=x"10";
	
	-- because bits 3-0 of the RAM address line correspond to
	-- the row position, to increment the row accessed
	-- hex 01 is added to the current row count	
	constant COUNTROW : std_logic_vector(7 downto 0):=x"01";
begin
	count : process(CLK) is
	begin
		if rising_edge(CLK) then
			if CNT_EN='1' then
				case temp_Q is
					-- increase row count and reset LSBs when at the last column position
					when x"08"|x"18"|x"28"|x"38"|x"48"|x"58"|x"68"|x"78"  =>
						temp_Q <= std_logic_vector(unsigned(temp_Q) + unsigned(COUNTCOLUMN));
						temp_Q(3 downto 0) <= x"0";

					-- reset the row and column count when at the last row and column position
					when x"88" =>
						temp_Q<= x"00";		
					
					-- otherwise count through each row for a given column
					when others =>
						temp_Q <= std_logic_vector(unsigned(temp_Q) + unsigned(COUNTROW));
						
				end case;
			end if;
		end if;
	end process;

	-- update the output to point to the next memory address
	Q <= temp_Q;
	
end architecture logic;