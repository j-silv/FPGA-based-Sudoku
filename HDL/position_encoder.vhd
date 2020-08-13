--------------------------------------------------------------------
-- position encoder
--------------------------------------------------------------------

--------------------------------------------------------------------
-- the keyboard data is encoded in binary to represent 
-- row or column values
--------------------------------------------------------------------

library ieee;
use ieee.numeric_std.all, 
	ieee.std_logic_1164.all;

entity position_encoder is
	port( 
		D :  in std_logic_vector(8 downto 0);
		Q : out std_logic_vector(3 downto 0)
	);
end entity position_encoder;

architecture logic of position_encoder is
begin
	process(D) is	
	begin
		case D is
			when "000000001" =>	-- the player selects the 1st row/column
			Q <= std_logic_vector(to_unsigned(0, 4)); -- the output becomes 0 in encoded binary
			when "000000010" => -- the player selects the 2nd row/column
			Q <= std_logic_vector(to_unsigned(1, 4)); -- the output becomes 1 in encoded binary
			when "000000100" =>	-- ...
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
			when "100000000" =>	-- the player selects the 9th row/column
			Q <= std_logic_vector(to_unsigned(8, 4)); -- the output becomes 8 in encoded binary
			
			-- the player is not expected to press two buttons simultaneously
			-- so for now the output will be unknown
			-- a future version should incorporate a known state for this sort of situation
			when others =>	
			Q(3 downto 0) <= "XXXX";
		end case;
	end process;
end architecture logic;