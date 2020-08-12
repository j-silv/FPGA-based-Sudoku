--parallel in, parallel out 8-stage 8-bit shift register
--data is parallel shifted from the bottom to the top
--the first row LED segment data is shifted through to the last stage shift register
--the last stage shift register will be thus connected to the first row of the LED matrix
library ieee;
use ieee.std_logic_1164.all;


--seems as though the schematic editor doesn't like double arrays... grrr
--Ok, I'm just going to output all the signals and break them up into individual vectors
--I need to do this so that I can set an output signal for each vector during simulation/debug
entity shift_stage is
	port(
		--if shift_en = '1', parallel shifting is enabled
		--if shift_out = '1', output rows are updated
		clk, shift_out, shift_en, rst :  in std_logic;
	
		--this is where the data will come in
		data_in : in std_logic_vector(7 downto 0);
		
		--each row is connected to the LED matrix
		--each row is explicitly declared for schematic entry of the entire design
		--(the 2D array is converted into a std_logic type by the schematic entry, thus this is necessary)
		row_0,row_1,row_2,row_3,row_4,row_5,row_6,row_7,row_8 : out std_logic_vector(7 downto 0) := x"00"
	);
end entity shift_stage;

architecture logic of shift_stage is
	--internally shifting data
	type shift_register is array (8 downto 0) of std_logic_vector(7 downto 0);
	signal temp_row : shift_register := (others => (others => '0'));
begin
	process(rst,clk)
	begin 
		--asynchronous reset!
		if rst ='1' then
			temp_row <= (others => (others => '0'));
		else 
			if rising_edge(clk) then
				--is shifting through the stages enabled?
				if shift_en = '1' then
					--parallel shift in the first row information
					temp_row(8) <= data_in;
					
					--iterate and shift data through each stage once
					for i in 0 to 7 loop
						temp_row(7-i) <= temp_row(8-i);	
					end loop;
				end if;
			end if;
		end if;
	end process;
	
	process(shift_out)
	begin
		if rising_edge(shift_out) then
			--update LED segment data for LED matrix
			row_0 <= temp_row(0);
			row_1 <= temp_row(1);
			row_2 <= temp_row(2);
			row_3 <= temp_row(3);
			row_4 <= temp_row(4);
			row_5 <= temp_row(5);
			row_6 <= temp_row(6);
			row_7 <= temp_row(7);
			row_8 <= temp_row(8);
		end if;
	end process;
end architecture logic;