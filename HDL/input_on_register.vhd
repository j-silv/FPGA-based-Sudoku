library ieee;
use ieee.std_logic_1164.all;

entity input_on_register is
	port(
		--asynchronous reset!
		CLK, RST : in std_logic;
		D0, D1, D2	: in std_logic;
		Q0, Q1, Q2	: out std_logic := '0'		
	);
end entity input_on_register;


architecture logic of input_on_register is 
begin
	process(RST, CLK) is 
	begin
		if RST = '1' then
			Q0 <= '0';
			Q1 <= '0';
			Q2 <= '0';
		elsif rising_edge(CLK) then
			Q0 <= D0;
			Q1 <= D1;
			Q2 <= D2;
		end if;
	end process;
end architecture logic;