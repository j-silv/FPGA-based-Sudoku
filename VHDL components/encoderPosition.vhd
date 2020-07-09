library ieee;
use ieee.numeric_std.all, 
	ieee.std_logic_1164.all;

entity encoderPosition is
	port( 
		D :  in std_logic_vector(8 downto 0);
		Q : out std_logic_vector(3 downto 0)
	);
end entity encoderPosition;

architecture logic of encoderPosition is
begin
	process(D) is	
	begin
		case D is
			when "000000001" =>								--the player selects the 1st row/column
			Q <= std_logic_vector(to_unsigned(0, 4));	
			when "000000010" =>								--the player selects the 2nd row/column
			Q <= std_logic_vector(to_unsigned(1, 4));
			when "000000100" =>								--...
			Q <= std_logic_vector(to_unsigned(2, 4));
			when "000001000" =>								
			Q <= std_logic_vector(to_unsigned(3, 4));
			when "000010000" =>								
			Q <= std_logic_vector(to_unsigned(4, 4));
			when "000100000" =>								
			Q <= std_logic_vector(to_unsigned(5, 4));
			when "001000000" =>								
			Q <= std_logic_vector(to_unsigned(6, 4));
			when "010000000" =>								
			Q <= std_logic_vector(to_unsigned(7, 4));
			when "100000000" =>								--the player selects the 9th row/column
			Q <= std_logic_vector(to_unsigned(8, 4));
			
			--the player is not expected to press two buttons simultaneously
			when others =>	
			Q(3 downto 0) <= "XXXX";
		end case;
	end process;
end architecture logic;