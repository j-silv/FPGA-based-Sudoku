library ieee;
use ieee.std_logic_1164.all;

--DFFE registers to hold digit position information

entity registerPosition is
	port(
		--2 seperate registers for row and column position data
		CLK 			: in std_logic;
		ROW_IN,COL_IN 		: in std_logic_vector(3 downto 0);
		ROW_EN,COL_EN,OE 	: in std_logic;
		
		--bits 7-4 will be column number (MSBs)
		--bits 3-0 will be row number    (LSBs)
		--tri-state intialized to high-Z
		Q : out std_logic_vector(7 downto 0) := "ZZZZZZZZ" 
	);
end entity registerPosition;

architecture logic of registerPosition is 
	signal temp_Q_row,temp_Q_column : std_logic_vector(3 downto 0); --storage variable to hold data
begin 

	--if rising edge detected, we check enable
	--if enable is on, latch incoming data. If not, ignore change on input
	latch_row : process(CLK) is
	begin
		if rising_edge(CLK) then
			if ROW_EN='1' then	
				temp_Q_row <= ROW_IN;
			end if;	
		end if;
	end process;
	
	latch_column : process(CLK) is
	begin
		if rising_edge(CLK) then
			if COL_EN='1' then	
				temp_Q_column <= COL_IN;
			end if;	
		end if;
	end process;
	
	--tri state buffer -> if output enable is on, output data
	data_out : process(temp_Q_row,temp_Q_column,OE) is
	begin
		if OE='0' then
			Q <= "ZZZZZZZZ";
		else
			Q(3 downto 0) <= temp_Q_row;
			Q(7 downto 4) <= temp_Q_column;
		end if;
	end process;	
end architecture logic;
