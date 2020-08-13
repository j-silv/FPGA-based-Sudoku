--------------------------------------------------------------------
-- DFF w/reset registers
--------------------------------------------------------------------

--------------------------------------------------------------------
-- temporary storage for the keyboard signals

-- these registers turn the asynchronous keyboard entries
-- into synchronous inputs for the FSM
--------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity input_key_register is
	port(
		CLK, RST : in std_logic;
		D : in std_logic_vector(9 downto 0);
		-- bits 9-0 will be for the LED segment data encoder
		-- bits 8-0 will be for position register 
		Q : out std_logic_vector(9 downto 0) := "0000000000"		
	);
end entity input_key_register;


architecture logic of input_key_register is 
begin
	process(RST, CLK) is 
	begin
		-- asynchronous reset
		if RST = '1' then
			Q <= "0000000000";
		elsif rising_edge(CLK) then
			Q <= D;
		end if;
	end process;
end architecture logic;
