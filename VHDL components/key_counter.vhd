library ieee;
use ieee.std_logic_1164.all,
	ieee.numeric_std.all;
	
entity key_counter is
	port(
		CLK 	: in std_logic; 	--had to use a DFF otherwise the logic was not working - likely a race condition with the d-latch 
		RST		: in std_logic;
		
		Q		: buffer unsigned(1 downto 0) := "00";  --testing using buffer
		DONE 	: out std_logic := '0'
	
	);
end entity key_counter;

architecture logic of key_counter is
	--Counts how many times keyboard input was detected
	--signal temp_Q : std_logic_vector(1 downto 0):="00"; 			--possible bug if these values are not initially assigned
	--constant ONE : std_logic_vector(1 downto 0):="01";				--might have to look into quartus documentation to make sure KEY_CNT is 0
																	--or just have a global reset at the beginning of the program
																	--> when RESET ='1' then also KEY_RST ='1', DELAY_RST='1' etc.

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