library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity full_design_all_signals is
end;

architecture bench of full_design_all_signals is
	component schema_v08 
		PORT
		(
			ROW_ON :  IN  STD_LOGIC;
			COL_ON :  IN  STD_LOGIC;
			DIG_ON :  IN  STD_LOGIC;
			FSM_RST :  IN  STD_LOGIC;
			SYS_CLK :  IN  STD_LOGIC;
			SHIFT_RST :  IN  STD_LOGIC;
			keyboard_in :  IN  STD_LOGIC_VECTOR(9 DOWNTO 0);
			DELAY_RST :  OUT  STD_LOGIC;
			KEY_CNT :  OUT  STD_LOGIC;
			KEY_RST :  OUT  STD_LOGIC;
			ADDR_CNT :  OUT  STD_LOGIC;
			SHIFT_EN :  OUT  STD_LOGIC;
			RAM_WR :  OUT  STD_LOGIC;
			ROW_EN :  OUT  STD_LOGIC;
			COL_EN :  OUT  STD_LOGIC;
			REG_OE :  OUT  STD_LOGIC;
			DIG_EN :  OUT  STD_LOGIC;
			DELAY_DONE :  OUT  STD_LOGIC;
			KEY_DONE :  OUT  STD_LOGIC;
			SHIFT_OUT :  OUT  STD_LOGIC;
			INV_CLK :  OUT  STD_LOGIC;
			CLK :  OUT  STD_LOGIC;
			addr_decoder :  OUT  STD_LOGIC_VECTOR(8 DOWNTO 0);
			column_select :  OUT  STD_LOGIC_VECTOR(8 DOWNTO 0);
			encoded_ledseg :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
			encoded_position :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
			keyboard_out :  OUT  STD_LOGIC_VECTOR(9 DOWNTO 0);
			pos_register :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
			ram_addr :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
			ram_in :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
			ram_out :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
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
		signal FSM_RST :    STD_LOGIC;
		signal SYS_CLK :    STD_LOGIC;
		signal SHIFT_RST :    STD_LOGIC;
		signal keyboard_in :    STD_LOGIC_VECTOR(9 DOWNTO 0);
		signal DELAY_RST :    STD_LOGIC;
		signal KEY_CNT :    STD_LOGIC;
		signal KEY_RST :    STD_LOGIC;
		signal ADDR_CNT :    STD_LOGIC;
		signal SHIFT_EN :    STD_LOGIC;
		signal RAM_WR :    STD_LOGIC;
		signal ROW_EN :    STD_LOGIC;
		signal COL_EN :    STD_LOGIC;
		signal REG_OE :    STD_LOGIC;
		signal DIG_EN :    STD_LOGIC;
		signal DELAY_DONE :    STD_LOGIC;
		signal KEY_DONE :    STD_LOGIC;
		signal SHIFT_OUT :    STD_LOGIC;
		signal INV_CLK :    STD_LOGIC;
		signal CLK :    STD_LOGIC;
		signal addr_decoder :  STD_LOGIC_VECTOR(8 DOWNTO 0);
		signal column_select :    STD_LOGIC_VECTOR(8 DOWNTO 0);
		signal encoded_ledseg :    STD_LOGIC_VECTOR(7 DOWNTO 0);
		signal encoded_position :    STD_LOGIC_VECTOR(3 DOWNTO 0);
		signal keyboard_out :    STD_LOGIC_VECTOR(9 DOWNTO 0);
		signal pos_register : STD_LOGIC_VECTOR(7 DOWNTO 0);
		signal ram_addr :    STD_LOGIC_VECTOR(7 DOWNTO 0);
		signal ram_in :    STD_LOGIC_VECTOR(7 DOWNTO 0);
		signal ram_out :    STD_LOGIC_VECTOR(7 DOWNTO 0);
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
		constant NUM_CLK_CYCLES : integer := 30000;

		
		signal i : integer := 0; -- loop variable
		
begin

	comp : schema_v08 
	port map(ROW_ON => ROW_ON, 
			 COL_ON => COL_ON, 
			 DIG_ON => DIG_ON,  
			 FSM_RST => FSM_RST, 
			 SYS_CLK => SYS_CLK, 
			 SHIFT_RST => SHIFT_RST,
			 keyboard_in => keyboard_in, 
			 DELAY_RST =>  DELAY_RST, 
			 KEY_CNT => KEY_CNT, 
			 KEY_RST => KEY_RST, 
			 ADDR_CNT => ADDR_CNT, 
			 SHIFT_EN => SHIFT_EN, 
			 RAM_WR => RAM_WR, 
			 ROW_EN => ROW_EN, 
			 COL_EN => COL_EN, 
			 REG_OE => REG_OE, 
			 DIG_EN => DIG_EN, 
			 DELAY_DONE => DELAY_DONE, 
			 KEY_DONE => KEY_DONE, 
			 SHIFT_OUT => SHIFT_OUT, 
			 INV_CLK => INV_CLK, 
			 CLK => CLK, 
			 addr_decoder => addr_decoder,
			 column_select => column_select, 
			 encoded_ledseg => encoded_ledseg, 
			 encoded_position => encoded_position, 
			 keyboard_out => keyboard_out,
			 pos_register => pos_register,
			 ram_addr => ram_addr, 
			 ram_in => ram_in, 
			 ram_out => ram_out, 
			 row_0 => row_0, 
			 row_1 => row_1, 
			 row_2 => row_2, 
			 row_3 => row_3, 
			 row_4 => row_4, 
			 row_5 => row_5, 
			 row_6 => row_6, 
			 row_7 => row_7, 
			 row_8 => row_8);

	
	--reset the FSM and shift register to initial state
	FSM_RST <= '1', '0' after 11 us;
	SHIFT_RST <= '1', '0' after 11 us;
	--here we would want to reset registers as well !!
	
	--input (ON) signals from the keyboard
	COL_ON <= '0', '1' after 30 us, '0' after  60 us;
	ROW_ON <= '0', '1' after 90 us, '0' after 120 us;
	DIG_ON <= '0', '1' after 150 us, '0' after 180 us;
	
	--input signals from the keyboard
	keyboard_in <=  "0000000000", 
					"0000000100" after 30 us,  "0000000000" after 60 us,
					"0000000100" after 90 us,  "0000000000" after 120 us,
					"0000100000" after 150 us, "0000000000" after 180 us;

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

