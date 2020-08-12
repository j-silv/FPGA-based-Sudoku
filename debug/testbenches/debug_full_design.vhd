library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity debug_full_design is
end;

architecture bench of debug_full_design is
	component schema_v09 
		PORT
		(
			ROW_ON :  IN  STD_LOGIC;
			COL_ON :  IN  STD_LOGIC;
			DIG_ON :  IN  STD_LOGIC;
			SYS_CLK :  IN  STD_LOGIC;
			RESET :  IN  STD_LOGIC;
			keyboard_in :  IN  STD_LOGIC_VECTOR(9 DOWNTO 0);
			column_select :  OUT  STD_LOGIC_VECTOR(8 DOWNTO 0);
			row_0 :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
			row_1 :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
			row_2 :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
			row_3 :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
			row_4 :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
			row_5 :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
			row_6 :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
			row_7 :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
			row_8 :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
	end component;

			signal ROW_ON :    STD_LOGIC;
			signal COL_ON :    STD_LOGIC;
			signal DIG_ON :    STD_LOGIC;
			signal SYS_CLK :    STD_LOGIC;
			signal RESET :    STD_LOGIC;
			signal keyboard_in :    STD_LOGIC_VECTOR(9 DOWNTO 0);
			signal column_select :    STD_LOGIC_VECTOR(8 DOWNTO 0);
			signal row_0 :    STD_LOGIC_VECTOR(7 DOWNTO 0);
			signal row_1 :    STD_LOGIC_VECTOR(7 DOWNTO 0);
			signal row_2 :    STD_LOGIC_VECTOR(7 DOWNTO 0);
			signal row_3 :    STD_LOGIC_VECTOR(7 DOWNTO 0);
			signal row_4 :    STD_LOGIC_VECTOR(7 DOWNTO 0);
			signal row_5 :    STD_LOGIC_VECTOR(7 DOWNTO 0);
			signal row_6 :    STD_LOGIC_VECTOR(7 DOWNTO 0);
			signal row_7 :    STD_LOGIC_VECTOR(7 DOWNTO 0);
			signal row_8 :    STD_LOGIC_VECTOR(7 DOWNTO 0);
		
		--input clock for the PLL
		constant SYS_CLK_FREQ : integer := 50E+6;
		constant SYS_CLK_T : time := 20 ns;
		constant STOP_SIMULATION_TIME : integer := 10; --(ns)
		constant NUM_CLK_CYCLES : integer := 60000;

		
		signal i : integer := 0; -- loop variable
		
begin

	comp : schema_v09
	port map(ROW_ON => ROW_ON, 
			 COL_ON => COL_ON, 
			 DIG_ON => DIG_ON, 
			 SYS_CLK => SYS_CLK,
			 RESET => RESET,
			 keyboard_in => keyboard_in, 
			 column_select => column_select, 
			 row_0 => row_0, 
			 row_1 => row_1, 
			 row_2 => row_2, 
			 row_3 => row_3, 
			 row_4 => row_4, 
			 row_5 => row_5, 
			 row_6 => row_6, 
			 row_7 => row_7, 
			 row_8 => row_8);

	
	--reset all
	RESET <= '0', '1' after 11 us;
	
	--input (ON) signals from the keyboard
	ROW_ON <= '0', '1' after 30 us, '0' after  60 us;
	COL_ON <= '0', '1' after 90 us, '0' after 120 us;
	DIG_ON <= '0', '1' after 150 us, '0' after 180 us;
	
	--input signals from the keyboard
	keyboard_in <=  "0000000000", 
					"0000000001" after 30 us,  "0000000000" after 60 us,
					"0000000010" after 90 us,  "0000000000" after 120 us,
					"0000000010" after 150 us, "0000000000" after 180 us;

	--continuous system (in) clock 
	process 
	begin
		SYS_CLK <= '0';
		wait for (SYS_CLK_T)/2;
		SYS_CLK <= '1';
		wait for (SYS_CLK_T)/2;
		
		--stop simulation
		if i = NUM_CLK_CYCLES then
            wait;
        else
            i <= i + 1;
        end if;
	end process;
end bench;

