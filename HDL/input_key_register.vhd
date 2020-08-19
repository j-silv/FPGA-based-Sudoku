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
		Q : out std_logic_vector(9 downto 0) := "1111111111"		
	);
end entity input_key_register;


architecture logic of input_key_register is 
begin
	process(RST, CLK) is 
	begin
		-- asynchronous reset (although this is technically a "set" for the registers)
		-- the registers are set because when the keyboard is activated, it
		-- gives a LOW logic signal for the key signals
		-- when not activated, the key signals are pulled up to a HIGH logic level by internal resistors
		if RST = '1' then
			Q <= "1111111111";
		elsif rising_edge(CLK) then
			Q <= D;
		end if;
	end process;
end architecture logic;
