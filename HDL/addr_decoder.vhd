library ieee;
use ieee.numeric_std.all, ieee.std_logic_1164.all;

entity addr_decoder is
	port(	
		D : in std_logic_vector(7 downto 0);
		COL_SEL : out std_logic_vector(8 downto 0);
		SHIFT_OUT : out std_logic
	);
	
end entity addr_decoder;


--VERSION 4 ok....
architecture cathode of addr_decoder is
begin
	--this code outputs all the loaded shift register values to the output buffer
	SHIFT_OUT	<=	'1' when (D(3 downto 0)="0001") else 
					'0';
	
	--this code handles when to select the column as to not introduce LED ghosting, as well as when to switch columns once all 
	--the shift register output buffer is updated
	with D(7 downto 0) select
	COL_SEL <=  "111111110" when x"12" | x"13" | x"14" | x"15" | x"16" | x"17" | x"18",
				"111111101" when x"22" | x"23" | x"24" | x"25" | x"26" | x"27" | x"28",
				"111111011" when x"32" | x"33" | x"34" | x"35" | x"36" | x"37" | x"38",
				"111110111" when x"42" | x"43" | x"44" | x"45" | x"46" | x"47" | x"48",
				"111101111" when x"52" | x"53" | x"54" | x"55" | x"56" | x"57" | x"58",
				"111011111" when x"62" | x"63" | x"64" | x"65" | x"66" | x"67" | x"68",
				"110111111" when x"72" | x"73" | x"74" | x"75" | x"76" | x"77" | x"78",
				"101111111" when x"82" | x"83" | x"84" | x"85" | x"86" | x"87" | x"88",
				"011111111" when x"02" | x"03" | x"04" | x"05" | x"06" | x"07" | x"08",
				"111111111" when others;
end cathode;




--VERSION 3 this makes latches involved... i dont want latches!
-- architecture cathode of addr_decoder is
-- begin
	-- process(D)
	-- begin
		-- --this code outputs all the loaded shift register values to the output buffer
		-- if (D(3 downto 0) = "0001") then
			-- SHIFT_OUT <= '1';
		-- else
			-- SHIFT_OUT <= '0';
		-- end if;
		
		
	
		-- --this code handles which column to select
		-- if (D(3 downto 0) = "0000" OR D(3 downto 0) = "0001") then
			-- COL_SEL <= "111111111";
		-- else
			-- case D(7 downto 4) is
				-- when "0000" =>
					-- COL_SEL <= "111111110";
				-- when "0001" =>
					-- COL_SEL <= "111111101";
				-- when "0010" =>
					-- COL_SEL <= "111111011";
				-- when "0011" =>
					-- COL_SEL <= "111110111";
				-- when "0100" =>
					-- COL_SEL <= "111101111";
				-- when "0101" =>
					-- COL_SEL <= "111011111";
				-- when "0110" =>
					-- COL_SEL <= "110111111";
				-- when "0111" =>
					-- COL_SEL <= "101111111";
				-- when "1000" =>
					-- COL_SEL <= "011111111";
				-- when others => null;			
			-- end case;
		-- end if;
	-- end process;
-- end cathode;
					
					
					
--VERSION 2 it works but its priority mux! thats not good!! propagation of signal
-- architecture cathode of addr_decoder is
-- begin
	-- SHIFT_OUT	<=	'1' when (D(3 downto 0)="0001") else 
					-- '0';
					
	-- COL_SEL 	<= 	"111111111" when (D(3 downto 0)="0000" OR D(3 downto 0)="0001") else
	
					-- "111111110" when (D(7 downto 4)="0001") else
					-- "111111101" when (D(7 downto 4)="0010") else
					-- "111111011" when (D(7 downto 4)="0011") else
					-- "111110111" when (D(7 downto 4)="0100") else
					-- "111101111" when (D(7 downto 4)="0101") else
					-- "111011111" when (D(7 downto 4)="0110") else
					-- "110111111" when (D(7 downto 4)="0111") else
					-- "101111111" when (D(7 downto 4)="1000") else
					-- "011111111" when (D(7 downto 4)="0000") else
					
					-- "111111111";
					
					


--VERSION 1 
-- architecture cathode of addr_decoder is
-- begin
	-- SHIFT_OUT	<=	'1' when (D(3 downto 0)="0001") else 
					-- '0';
	
	-- with D(7 downto 4) select
		-- COL_SEL <=  "111111110" when "0001",
					-- "111111101" when "0010",
					-- "111111011" when "0011",
					-- "111110111" when "0100",
					-- "111101111" when "0101",
					-- "111011111" when "0110",
					-- "110111111" when "0111",
					-- "101111111" when "1000",
					-- "011111111" when "0000",
					
					-- "111111111" when others; 
								
					
				--for common cathode this means that everything is turned off
				--perhaps a small optimization is to allow "dont care" values but oh well
					
					
				
				--the order is really important: for example, at address 
				--"0000 1000" the address counter is pointing at COL 0 ROW 8. 
				--However we need another clock cycle for the digit in memory at this address 
				--to be latched into the last shift register, so we don't want to OUTPUT ENABLE until 
				--the counter increases by 1.. (i.e. it gets to 0001 0000). 
				--Now all the values are correctly inside the 9 shift registers... we can go ahead and 
				--set output enable (shift_out) HIGH to enable all the corresponding segments. This will always
				--happen when the 4 LSBs are at 0000.
				
				--^^ not quite!!! the column is fine i suppose because once the address is pointing at address 2, we can immediately set up for 
				--column 1 to go active and its not that important timing wise
				--however, the LSBss have to be at 0001!! this is because there are 2 clock cycles necessary to shift in the data. 1 clock
				--cycle gets the data on the line, and then another clock cycle to shift that data into the shift register stage
				--so if I want to get all the stages properly lined up i have to just pulse shift out when LSBs are at 0001 (because thats
				--2 clock cycles!!)
				--
				
				--Similarily, we can set the first column digit HIGH/LOW (depends on if we have a common anode or common cathode)
				--whenever the MSB of the address points at the NEXT column position! (in the previous case, 0001!)
				

/* THIS IS FOR A COMMON ANODE SETUP

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
				
			