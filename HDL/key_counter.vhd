--------------------------------------------------------------------
-- keyboard counter 
--------------------------------------------------------------------

--------------------------------------------------------------------
-- keeps track of the number of times the keyboard was activated
-- before a write cycle occurs in RAM

-- 3 keyboard inputs have to be detected by the user
-- 1 for the row position, 1 for the column position
-- and 1 for the digit value         
--------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
	
entity key_counter is 
	port(
		clk		: in std_logic;
		rst		: in std_logic;	
		-- this output lets the FSM know that 3 distinct input events were detected
		done 	: out std_logic := '0' 
	);
end entity key_counter;

architecture logic of key_counter is 
	-- the user has to activate the keyboard this number of times before the data is written to memory
	constant NUM_BUTTON_PUSHES : integer := 3;
begin
	process(clk,rst)
		variable tick : integer := 0;
	begin
		-- if the counter is reset, make sure key_done is not an active signal
		if rst = '1' then
			tick := 0;
			done <= '0';
		elsif rising_edge(clk) then
			-- otherwise, increment the keyboard count
			tick := tick + 1;
				-- if 3 distinct inputs wer detected
				if tick = NUM_BUTTON_PUSHES then
					-- we don't have to reset tick because the FSM will do it automatically
					done <= '1';
				else 
					done <= '0';
				end if;
		end if;
	end process;
end architecture logic;