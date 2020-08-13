--------------------------------------------------------------------
-- open_drain bus built from opnndrn primitives
--------------------------------------------------------------------

--------------------------------------------------------------------
-- this is connected to the column selection outputs
-- these open drain components will thus source current from the
-- common cathode LED digits
--------------------------------------------------------------------

-- std_logic libraries
library ieee;
use ieee.std_logic_1164.all;

-- library for the open drain altera primitive
library altera; 
use altera.altera_primitives_components.all;

entity open_drain is
	port(
		d : in std_logic_vector(8 downto 0);
		q : out std_logic_vector(8 downto 0)
	);
end open_drain;

architecture logic of open_drain is
begin
	-- generate a bus containing open drain primitives
	gen_opndrn_bus : for i in 0 to 8 generate
		-- generate an instance of opndrn for each signal bit
		instance : OPNDRN
			port map (a_in => d(i), a_out => q(i));
	end generate gen_opndrn_bus;
end architecture logic;