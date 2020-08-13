library ieee;
use ieee.std_logic_1164.all;

-- DFFE register to hold LED segment information ->

entity ledseg_register is
	port(
		CLK, EN : in std_logic;
		D : in std_logic_vector(7 downto 0);
		Q : out std_logic_vector(7 downto 0)
	);
end entity ledseg_register;

architecture logic of ledseg_register is 
begin 
	-- if a clk transition is detected, the enable signal is checked
	-- if EN is on, then latch in the LED segment data
	latch : process(CLK) is
	begin
		if rising_edge(CLK) then
			if EN='1' then	
				Q <= D;
			end if;	
		end if;
	end process;
end architecture logic;