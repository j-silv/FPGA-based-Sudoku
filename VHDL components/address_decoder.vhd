library ieee;
use ieee.numeric_std.all, 
	ieee.std_logic_1164.all;

entity address_decoder is
	port(
		
		D : in std_logic_vector(7 downto 0);
		COL_SEL : out std_logic_vector(8 downto 0);
		SHIFT_OUT : out std_logic
	);
end entity address_decoder;

architecture cathode of address_decoder is
begin
	SHIFT_OUT	<=	'1' when (D(3 downto 0)="0001") else 
					'0';
	
	with D(7 downto 4) select
		COL_SEL <=	"111111110" when "0001",
					"111111101" when "0010",
					"111111011" when "0011",
					"111110111" when "0100",
					"111101111" when "0101",
					"111011111" when "0110",
					"110111111" when "0111",
					"101111111" when "1000",
					"011111111" when "0000",
					"111111111" when others; --for common cathode this means that all segments are off			
end architecture cathode;

/* this is for a common anode display

	WITH D(7 downto 4) SELECT
		COL_SEL <= "000000001" when "0001",
				<= "000000010" when "0010",
				<= "000000100" when "0011",
				<= "000001000" when "0100",
				<= "000010000" when "0101",
				<= "000100000" when "0110",
				<= "001000000" when "0111",
				<= "010000000" when "1000",
				<= "100000000" when "0000",
				<= "000000000" when others; --for common anode this means everything is turned off
				
*/
				
			