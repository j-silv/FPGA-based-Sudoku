library ieee;
use ieee.std_logic_1164.all,
	ieee.numeric_std.all;
	
entity key_counter is
	port(
		CLK 	: in std_logic; 	
		RST	: in std_logic;
		
		Q	: buffer unsigned(1 downto 0) := "00";  --testing using buffer
		DONE 	: out std_logic := '0'
	);
end entity key_counter;

architecture logic of key_counter is
begin
	process(CLK, RST) is
	begin
		if RST = '1' then
			Q <= "00";
		elsif rising_edge(CLK) then
			Q <= Q + 1;
		end if;
	end process;
		
	process(Q) is
	begin
		if Q = "11" then
			DONE <= '1';
		else 
			DONE <= '0';
		end if;
	end process;
end architecture logic;
