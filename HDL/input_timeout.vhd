library ieee;
use ieee.std_logic_1164.all,
	ieee.numeric_std.all,
	ieee.math_real.all;
	
entity input_timeout is 
	generic(
		--constants used so that the max count can be automatically determined for a given delay
		constant CLOCK_FREQ 	: integer := 100E6; 	--for Quartus II simulation, a 100 MHz clock is used
		constant DELAY 			: integer := 5			--specified delay in seconds
	);
	
	port(
		CLK		: in std_logic;
		RST		: in std_logic;	
		
		--(CLOCK_FREQ * DELAY) calculates the number of count cycles necesary for the desired DELAY
		--the rest of the mathematical expression determines the bit size necessary for this max count using the (log2(n) - 1) technique
		Q		: buffer unsigned((integer(ceil(log2(real(CLOCK_FREQ * DELAY)))) - 1) downto 0) := (others => '0');
		DONE 	: out std_logic := '0'
	);
end entity input_timeout;

architecture logic of input_timeout is 
begin
	process(CLK,RST) is
	begin
		if RST = '1' then
			Q <= (others => '0');
		elsif rising_edge(CLK) then
			--reset counter if at the end of the count
			if Q = (CLOCK_FREQ * DELAY) then
				Q <= (others => '0');			
			else
				Q <= Q + 1;
			end if;
		end if;
	end process;
	
	process(Q) is
	begin
		--signals if 5 seconds has passed
		if Q = (CLOCK_FREQ * DELAY) then
			DONE <= '1';
		else 
			DONE <= '0';
		end if;
	end process;
end architecture logic;