--------------------------------------------------------------------
-- LED segment encoder
--------------------------------------------------------------------

--------------------------------------------------------------------
-- the keyboard data is encoded in binary to represent 
-- LED digit values
--------------------------------------------------------------------

library ieee;
use ieee.numeric_std.all, 
	ieee.std_logic_1164.all;

entitY ledseg_encoder is
	port( 
		D :  in std_logic_vector(9 downto 0);
		Q : out std_logic_vector(7 downto 0)	
	);
end entity ledseg_encoder;

architecture comCathode of ledseg_encoder is
	-- this array contains the associated LED segment data in hexadecimal for
	-- clearing and displaying numerical digits 1-9 for a common cathode 7 segment display
	-- order of segments = A,B,C,D,E,F,G,DP
	type SEG_DATA is array (0 to 9) of std_logic_vector (7 downto 0);
	constant DISPLAY_DIGIT : SEG_DATA:=(
		x"00", -- CLR the digit (all bits turned off)
		x"60", -- Display "1"
		x"DA", -- Display "2"
		x"F2", -- ...
		x"66",
		x"B6",
		x"BE",
		x"E0",
		x"FE",
		x"F6" -- Display "9"
	);
begin
	encode : process(D) is	
	begin
		case D is
			when std_logic_vector(to_unsigned(1, 10)) =>	-- button input: 000000001 (user presses CLR on keyboard)
			Q(7 downto 0) <= DISPLAY_DIGIT(0);
			when std_logic_vector(to_unsigned(2, 10)) =>	-- button input: 000000010 (user presses "1" on keyboard)
			Q(7 downto 0) <= DISPLAY_DIGIT(1);
			when std_logic_vector(to_unsigned(4, 10)) =>	-- ...
			Q(7 downto 0) <= DISPLAY_DIGIT(2);
			when std_logic_vector(to_unsigned(8, 10)) =>
			Q(7 downto 0) <= DISPLAY_DIGIT(3);
			when std_logic_vector(to_unsigned(16, 10)) =>
			Q(7 downto 0) <= DISPLAY_DIGIT(4);
			when std_logic_vector(to_unsigned(32, 10)) =>
			Q(7 downto 0) <= DISPLAY_DIGIT(5);
			when std_logic_vector(to_unsigned(64, 10)) =>
			Q(7 downto 0) <= DISPLAY_DIGIT(6);
			when std_logic_vector(to_unsigned(128, 10)) =>
			Q(7 downto 0) <= DISPLAY_DIGIT(7);
			when std_logic_vector(to_unsigned(256, 10)) =>
			Q(7 downto 0) <= DISPLAY_DIGIT(8);
			when std_logic_vector(to_unsigned(512, 10)) =>
			Q(7 downto 0) <= DISPLAY_DIGIT(9);
			when others =>
			Q(7 downto 0) <= x"00";  						-- no digit is displayed by default
		end case;
	end process;
end architecture comCathode;