--------------------------------------------------------------------
-- timeout (counter) for user keyboard input
--------------------------------------------------------------------

--------------------------------------------------------------------
-- if 3 distinct keyboard inputs are not detected within
-- an alloted timeframe, then the FSM ignores the attempt
-- to write to memory and the system returns to its initial state

-- this is done to avoid moments where the user inputs a certain
-- position or digit by mistake and is forced to continue
-- the input process
-- with this feature, the player just has to wait until the system
-- resets and then choose the correct inputs
--------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
	
entity input_timeout is 
	generic(
		-- this generic is to know
		-- how many clock cycles will it take for the keyboard timeout
		-- to be activated (i.e. for the signal DELAY_DONE to become
		-- active)
		-- the default value is 100, so if a 100 kHz PLL clock is used,
		-- that would give a 1 ms timeout
		CLK_CYCLES_TIMEOUT : integer := 100
	);
	port(
		clk		: in std_logic;
		rst		: in std_logic;	
		done 	: out std_logic := '0'
	);
end entity input_timeout;

architecture logic of input_timeout is 
begin
	process(clk,rst)
		variable tick : integer := 0;
	begin
		-- if the FSM restarts the delay, make sure that the delay done signal is not active
		if rst = '1' then
			tick := 0;
			done <= '0';
		elsif rising_edge(clk) then
			tick := tick + 1;
			
			if tick = CLK_CYCLES_TIMEOUT then
				done <= '1';
				-- reset tick because otherwise it will continue counting behind CLK_CYCLES_TIMEOUT
				tick := 0;
			else 
				done <= '0';
			end if;
		end if;
	end process;
end architecture logic;