library ieee;
use ieee.std_logic_1164.all;

entity input_key_register is
	port(
		--asynchronous reset!
		CLK, RST : in std_logic;
		D : in std_logic_vector(9 downto 0);
		Q : out std_logic_vector(9 downto 0) := "0000000000"		
		--bits 9-0 will be for the value encoder and bits 8-0 will be for position register 
	);
end entity input_key_register;


architecture logic of input_key_register is 
begin
	process(RST, CLK) is 
	begin
		if RST = '1' then
			Q <= "0000000000";
		elsif rising_edge(CLK) then
			Q <= D;
		end if;
	end process;
end architecture logic;
