--------------------------------------------------------------------
-- DFF w/reset registers
--------------------------------------------------------------------

--------------------------------------------------------------------
-- temporary storage for the ROW_ON, COL_ON, and DIG_ON signals

-- these registers turn the asynchronous keyboard entries
-- into synchronous inputs for the FSM
--------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity input_on_register is
	port(
		CLK, RST : in std_logic;
		D0, D1, D2	: in std_logic;
		Q0, Q1, Q2	: out std_logic := '1'		
	);
end entity input_on_register;


architecture logic of input_on_register is 
begin
	process(RST, CLK) is 
	begin
		-- asynchronous reset (although this is technically a "set" for the registers)
		-- the registers are set because when the keyboard is activated, it
		-- gives a LOW logic signal for the ON signals
		-- when not activated, the ON signals are pulled up to a HIGH logic level by internal resistors
		if RST = '1' then
			Q0 <= '1';
			Q1 <= '1';
			Q2 <= '1';
		elsif rising_edge(CLK) then
			Q0 <= D0;
			Q1 <= D1;
			Q2 <= D2;
		end if;
	end process;
end architecture logic;
