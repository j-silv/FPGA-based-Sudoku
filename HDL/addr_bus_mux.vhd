--------------------------------------------------------------------
-- bus multiplexer
--------------------------------------------------------------------

--------------------------------------------------------------------
-- mux that controls access the RAM's address line

-- when user input is not detected, the address counter cycles
-- through the RAM addresses and data is "printed" out to the
-- Sudoku grid

-- when user input is detected and 3 distinct input events have
-- occured, the mux gives access to the position register so that
-- at the row/column position, the input digit data can be written
--------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity addr_bus_mux is
	port(
		-- 2 separate bus lines for the address counter and position register
		addr_counter, pos_register : in std_logic_vector(7 downto 0);
		
		-- mux bus selecter
		ADDR_OE, REG_OE : in std_logic;
		
		-- output that goes to the RAM address line
		ram_addr : out std_logic_vector(7 downto 0)
	);
end entity addr_bus_mux;

architecture logic of addr_bus_mux is
begin
	process(ADDR_OE, REG_OE, addr_counter, pos_register)
		-- this variable holds the concatenation of inputs ADDR_OE and REG_OE
		-- this allows for a simple case statement which controls who accesses the bus line
		variable sel : std_logic_vector(1 downto 0) := "10";
	begin
		-- concatenate the selection inputs
		sel := ADDR_OE & REG_OE;
		
		case sel is
			when "01" =>
				ram_addr <= pos_register;
			when "10" =>
				ram_addr <= addr_counter;
				
			-- by default, the address counter is given access
			-- to the RAM address line for invalid states (00 and 11)
			when others =>
				ram_addr <= addr_counter;
		end case;
	end process;
end architecture logic;