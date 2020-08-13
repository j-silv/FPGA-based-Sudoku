library ieee;
use ieee.std_logic_1164.all;
	
entity key_counter is 
	port(
		clk		: in std_logic;
		rst		: in std_logic;	
		done 	: out std_logic := '0'
	);
end entity key_counter;

architecture logic of key_counter is 
	-- the user has to push this many buttons before the data is written to memory
	constant NUM_BUTTON_PUSHES : integer := 3;
begin
	process(clk,rst)
		variable tick : integer := 0;
	begin
		-- if the counter is reset, then make sure key_done is not an active signal
		if rst = '1' then
			tick := 0;
			done <= '0';
		elsif rising_edge(clk) then
			tick := tick + 1;
				if tick = NUM_BUTTON_PUSHES then
					-- we don't have to reset tick because the FSM will
					done <= '1';
				else 
					done <= '0';
				end if;
		end if;
	end process;
end architecture logic;