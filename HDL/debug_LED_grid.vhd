library ieee;
use ieee.std_logic_1164.all;

entity debug_LED_grid is
	port(
		clk : in std_logic;
		column_select : out std_logic_vector(2 downto 0);
		row0, row1 : out std_logic_vector(6 downto 0) := "0000000"
	);

end entity debug_LED_grid;

architecture logic of debug_LED_grid is
	signal pre_column_select : std_logic_vector(2 downto 0) := "110";
	
	component debug_open_drain 
		port(
			d : in std_logic_vector(2 downto 0);
			q : out std_logic_vector(2 downto 0)
		);
	end component;
begin

	
	open_drain: debug_open_drain 
	port map (
		d => pre_column_select, 
		q => column_select
	);

	process(clk)
		variable tick_col : integer := 0;
	begin
		if rising_edge(clk) then
			--this should correspond to a frequency of around 1.2 kHz for flickering the screen!
			if tick_col = 41667 then
				tick_col := 0;
				
				--scroll through all 3 columns, print a different number for each column
				case pre_column_select is
					when "110" => --sequential? ghosting?
						pre_column_select <= "111";
						row0 <= "0110000"; -- "1"
						row1 <= "1101101"; -- "2" etc..
						pre_column_select <= "101";
					when "101" =>
						pre_column_select <= "111";
						row0 <= "1111001";
						row1 <= "0110011";
						pre_column_select <= "011";
					when "011" =>
						pre_column_select <= "111";
						row0 <= "1011011";
						row1 <= "1011111";
						pre_column_select <= "110";
					when others =>
						pre_column_select <= "111";
				end case;
			else
				tick_col := tick_col + 1;
			end if;
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