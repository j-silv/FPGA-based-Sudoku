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
		CLK_FREQ : integer := 100E+3; -- (Hz)
		TIMEOUT : integer := 1 -- (ms)
	);
	port(
		clk		: in std_logic;
		rst		: in std_logic;	
		done 	: out std_logic := '0'
	);
end entity input_timeout;

architecture logic of input_timeout is 
	constant MAX_CLK_CYCLES : integer := 100; -- test to see if the integer math below was causing a problem
	-- constant MAX_CLK_CYCLES : integer := (CLK_FREQ)*(TIMEOUT/1E+3); -- convert ms to seconds
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
			
			if tick = MAX_CLK_CYCLES then
				done <= '1';
				-- reset tick because otherwise it will continue counting behind MAX_CLK_CYCLES
				tick := 0;
			else 
				done <= '0';
			end if;
		end if;
	end process;
end architecture logic;