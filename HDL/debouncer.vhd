--------------------------------------------------------------------
-- Software debouncer for keyboard input
--------------------------------------------------------------------

--------------------------------------------------------------------
-- once COL_ON, ROW_ON, or DIG_ON is detected, a counter begins
-- incrementing. After a certain number of milliseconds, the
-- debouncer lets the FSM know that it can read the "stable"
-- keyboard signal. 

-- the VHDL for this debouncer is almost identical to the 
-- input_timeout module's, since the functionality is similiar
--------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
	
entity debouncer is 
	generic(
		-- this generic is to know 
		-- how many clock cycles it will take before the button
		-- bounces are assumed to have stopped
		-- the default value is 
		-- with a 100 kHz PLL clock, that gives
		-- 20 ms, which according to engineer Jack G. Ganssle, is a 
		-- reasonable estimate for the amount of time a button bounces 
		CLK_CYCLES_BOUNCE : integer := 2000
	);
	port(
		clk		: in std_logic;
		rst		: in std_logic;	
		done 	: out std_logic := '0'
	);
end entity debouncer;

architecture logic of debouncer is 
begin
	process(clk,rst)
		variable tick : integer := 0;
	begin
		-- if the FSM restarts the debouncer, make sure that the BOUNCE_DONE signal is not active
		if rst = '1' then
			tick := 0;
			done <= '0';
		elsif rising_edge(clk) then
			tick := tick + 1;
			
			if tick = CLK_CYCLES_BOUNCE then
				done <= '1';
				-- reset tick because otherwise it will continue counting beyond CLK_CYCLES_BOUNCE
				-- during the next rising_edge(clk)
				tick := 0;
			else 
				done <= '0';
			end if;
		end if;
	end process;
end architecture logic;