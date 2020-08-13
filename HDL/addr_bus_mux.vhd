library ieee;
use ieee.std_logic_1164.all;

entity addr_bus_mux is
	port(
		addr_counter, pos_register : in std_logic_vector(7 downto 0);
		ADDR_OE, REG_OE : in std_logic;
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
			-- by default, the address counter is enabled for invalid states (00 and 11)
			when others =>
				ram_addr <= addr_counter;
		end case;
	end process;
end architecture logic;