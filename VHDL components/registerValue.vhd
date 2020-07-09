library ieee;
use ieee.std_logic_1164.all;

--DFFE register to hold LED segment information ->

entity registerValue is
	port(
		
		CLK : in std_logic;
		D : in std_logic_vector(7 downto 0) := x"FF";
		EN,OE : in std_logic;
		
		--tri-state intialized to high-Z
		Q : out std_logic_vector(7 downto 0) := "ZZZZZZZZ" 
	);
end entity registerValue;

architecture logic of registerValue is 
	signal temp_Q : std_logic_vector(7 downto 0); --storage variable to hold data
begin 

	--if rising edge detected, we check enable
	--if enable is on, latch incoming data. If not, ignore change on input
	latch : process(CLK) is
	begin
		if rising_edge(CLK) then
			if EN='1' then	
				temp_Q <= D;
			end if;	
		end if;
	end process;
	
	--tri state buffer -> if output enable is on, output data
	data_out : process(temp_Q,OE) is
	begin
		if OE='0' then
			Q <="ZZZZZZZZ";
		else
			Q <= temp_Q;
		end if;
	end process;
end architecture logic;