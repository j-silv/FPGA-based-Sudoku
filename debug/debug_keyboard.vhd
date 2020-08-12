library ieee;
use ieee.std_logic_1164.all;

entity debug_keyboard is
	port(
		clk, ROW_ON, COL_ON, DIG_ON : in std_logic;
		keyboard_in : in std_logic_vector(1 downto 0);
		
		column_select : out std_logic_vector(2 downto 0);
		row0, row1 : out std_logic_vector(6 downto 0) := "0000000"
	);

end entity debug_keyboard;

architecture logic of debug_keyboard is
	--this signal goes through the open drain primitive
	signal pre_column_select : std_logic_vector(2 downto 0) := "111";
	
	--open drain buffer
	component debug_open_drain 
		port(
			d : in std_logic_vector(2 downto 0);
			q : out std_logic_vector(2 downto 0)
		);
	end component;
begin
	--connecting signals for the open drain buffer
	open_drain: debug_open_drain 
	port map (
		d => pre_column_select, 
		q => column_select
	);

	process(ROW_ON, COL_ON, DIG_ON, keyboard_in)
	begin
		if keyboard_in(0) = '1' then
			if ROW_ON = '1' then
				--if row was selected, turn on 1st column and print number 1 on the first row
				pre_column_select <= "110";
				row0 <= "0110000";				
			elsif COL_ON = '1' then
				--if col was selected, turn on 2nd column and print number 2 on the first row
				pre_column_select <= "101";
				row0 <= "1101101";
			elsif DIG_ON = '1' then
				--if dig was selected, turn on 3rd column and print number 3 on the first row
				pre_column_select <= "011";
				row0 <= "1111001";
				--else turn of all columns
			else 
				pre_column_select <= "111";
				row0 <= "0000000";
			end if;
		elsif keyboard_in(1) = '1' then
			if ROW_ON = '1' then
				--if row was selected, turn on 1st column and print number 1 on the 2nd row
				pre_column_select <= "110";
				row1 <= "0110000";				
			elsif COL_ON = '1' then
				--if col was selected, turn on 2nd column and print number 2 on the 2nd row
				pre_column_select <= "101";
				row1 <= "1101101";
			elsif DIG_ON = '1' then
				--if dig was selected, turn on 3rd column and print number 3 on the 2nd row
				pre_column_select <= "011";
				row1 <= "1111001";
				--else turn of all columns
			else 
				pre_column_select <= "111";
				row1 <= "0000000";
			end if;
			
		else 
			pre_column_select <= "111";
			row0 <= "0000000";
			row1 <= "0000000";
		end if;
	end process;
end architecture logic;



/* PIN ASSIGNMENTS
row_0[7]	Output	PIN_W17	4	B4_N0	3.3-V LVTTL		Maximum Current	
row_0[6]	Output	PIN_U15	4	B4_N0	3.3-V LVTTL		Maximum Current	
row_0[5]	Output	PIN_V14	4	B4_N0	3.3-V LVTTL		Maximum Current	
row_0[4]	Output	PIN_V13	4	B4_N0	3.3-V LVTTL		Maximum Current	
row_0[3]	Output	PIN_Y13	4	B4_N0	3.3-V LVTTL		Maximum Current	
row_0[2]	Output	PIN_Y10	3	B3_N0	3.3-V LVTTL		Maximum Current	
row_0[1]	Output	PIN_V9	3	B3_N0	3.3-V LVTTL		Maximum Current	
row_1[7]	Output	PIN_V17	4	B4_N0	3.3-V LVTTL		Maximum Current	
row_1[6]	Output	PIN_V16	4	B4_N0	3.3-V LVTTL		Maximum Current	
row_1[5]	Output	PIN_W15	4	B4_N0	3.3-V LVTTL		Maximum Current	
row_1[4]	Output	PIN_W14	4	B4_N0	3.3-V LVTTL		Maximum Current	
row_1[3]	Output	PIN_Y14	4	B4_N0	3.3-V LVTTL		Maximum Current	
row_1[2]	Output	PIN_AA10	3	B3_N0	3.3-V LVTTL	Maximum Current	
row_1[1]	Output	PIN_V10	3	B3_N0	3.3-V LVTTL		Maximum Current	

column_select[2]	Output	PIN_B4	8	B8_N0	3.3-V LVTTL						On
column_select[1]	Output	PIN_A4	8	B8_N0	3.3-V LVTTL						On
column_select[0]	Output	PIN_B3	8	B8_N0	3.3-V LVTTL						On


*/