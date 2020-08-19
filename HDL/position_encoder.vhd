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
			when "111111110" =>	-- the player selects the 0st row/column
			Q <= std_logic_vector(to_unsigned(0, 4)); -- the output becomes 1 in encoded binary
			when "111111101" => -- the player selects the 2nd row/column
			Q <= std_logic_vector(to_unsigned(1, 4)); -- the output becomes 0 in encoded binary
			when "111111011" =>	-- ...
			Q <= std_logic_vector(to_unsigned(2, 4));
			when "111110111" =>								
			Q <= std_logic_vector(to_unsigned(3, 4));
			when "111101111" =>								
			Q <= std_logic_vector(to_unsigned(4, 4));
			when "111011111" =>								
			Q <= std_logic_vector(to_unsigned(5, 4));
			when "110111111" =>								
			Q <= std_logic_vector(to_unsigned(6, 4));
			when "101111111" =>								
			Q <= std_logic_vector(to_unsigned(7, 4));
			when "011111111" =>	-- the player selects the 9th row/column
			Q <= std_logic_vector(to_unsigned(8, 4)); -- the output becomes 8 in encoded binary
			
			-- the player is not expected to press two buttons simultaneously
			-- so for now the output will be unknown
			-- a future version should incorporate a known state for this sort of situation
			when others =>	
			Q(3 downto 0) <= "XXXX";
		end case;
	end process;
end architecture logic;