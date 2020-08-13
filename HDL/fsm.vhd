--------------------------------------------------------------------
-- FSM controller
--------------------------------------------------------------------

--------------------------------------------------------------------
-- handles all the control signals, such as output enabling 
-- and write/read control for RAM

-- in charge of circulating information between hardware components 
-- and regulating access to memory.
--------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity fsm is
	port(
		CLK		 	: in std_logic;
		RESET	 	: in std_logic; -- reset FSM to initial state
		DELAY_DONE 	: in std_logic; -- status of input timeout
		KEY_DONE 	: in std_logic; -- status of number of distinct keyboard inputs detected
		COL_ON 		: in std_logic; -- column input detected
		ROW_ON 		: in std_logic; -- row input detected
		DIG_ON		: in std_logic; -- digit input detected
		
		DELAY_RST 	: out std_logic; -- reset the input timeout
		KEY_CNT		: out std_logic; -- increment the number of distinct keyboard inputs detected
		KEY_RST		: out std_logic; -- set the number of distinct keyboard inputs detected to 0
		ADDR_CNT 	: out std_logic; -- enable the address counter to increment its current count
		SHIFT_EN 	: out std_logic; -- enable the shift register stages to internally shift data
		RAM_WR 		: out std_logic; -- set the RAM to write mode
		ROW_EN 		: out std_logic; -- enable the row register to latch in user input
		COL_EN 		: out std_logic; -- enable the column register to latch in user input
		ADDR_OE 	: out std_logic; -- enable the address counter to take control of the RAM address line
		REG_OE 		: out std_logic; -- enable the position register to take control of the RAM address line
		DIG_EN 		: out std_logic  -- enable the LED segment data register to latch in user input
	);
end entity;

architecture logic of fsm is
	-- for visibility, build an enumerated type for the state machine
	type state_type is (s0, s1, s2, s3, s4, s5, s6, s7);

	-- register to hold the current state
	signal state : state_type;
begin
	-- logic to advance to the next state
	process (CLK, RESET)
	begin
		-- complete reset (asynchronous)
		if RESET = '1' then
			state <= s0;
		-- otherwise, follow ASM diagram flow 
		-- determine next state based on current states and inputs
		elsif (rising_edge(CLK)) then
			case state is
				when s0 =>
					if COL_ON = '1' then
						state <= s1;
					elsif ROW_ON = '1' then
						state <= s2;
					elsif DIG_ON = '1' then
						state <= s3;		
					elsif DELAY_DONE = '1' then
						state <= s4;					
					else 
						state <= s0;
					end if;
		
				when s1 =>
					state <= s5;
					
				when s2 =>
					state <= s5;
					
				when s3 =>
					state <= s5;
					
				when s4 =>
					state <= s0;
					
				when s5 =>
					if ((COL_ON OR ROW_ON OR DIG_ON) = '1') then
						state <= s5;
					elsif KEY_DONE = '0' then
						state <= s0;
					else
						state <= s6;
					end if;
		
				when s6 =>
					state <= s7;
				
				when s7 =>
					state <= s0;
			end case;
		end if;
	end process;

	process (state)
	begin
		-- outputs for each state as shown in the ASM diagram
		case state is
			when s0 =>
				COL_EN 		<= '0';
				ROW_EN 		<= '0';
				DIG_EN 		<= '0';
				REG_OE 		<= '0';
				DELAY_RST 	<= '0';
				KEY_CNT		<= '0';
				KEY_RST		<= '0';
				ADDR_CNT 	<= '1';
				ADDR_OE 	<= '1';
				RAM_WR 		<= '0';
				SHIFT_EN 	<= '1';
				
			when s1 =>
				COL_EN 		<= '1';
				ROW_EN 		<= '0';
				DIG_EN 		<= '0';
				REG_OE 		<= '0';
				DELAY_RST 	<= '0';
				KEY_CNT		<= '1';
				KEY_RST		<= '0';
				ADDR_CNT 	<= '1';
				ADDR_OE 	<= '1';
				RAM_WR 		<= '0';
				SHIFT_EN 	<= '1';

			when s2 =>
				COL_EN 		<= '0';
				ROW_EN 		<= '1';
				DIG_EN 		<= '0';
				REG_OE 		<= '0';
				DELAY_RST 	<= '0';
				KEY_CNT		<= '1';
				KEY_RST		<= '0';
				ADDR_CNT 	<= '1';
				ADDR_OE 	<= '1';
				RAM_WR 		<= '0';
				SHIFT_EN 	<= '1';

			when s3 =>
				COL_EN 		<= '0';
				ROW_EN 		<= '0';
				DIG_EN 		<= '1';
				REG_OE 		<= '0';
				DELAY_RST 	<= '0';
				KEY_CNT		<= '1';
				KEY_RST		<= '0';
				ADDR_CNT 	<= '1';
				ADDR_OE 	<= '1';
				RAM_WR 		<= '0';
				SHIFT_EN 	<= '1';

			when s4 =>
				COL_EN 		<= '0';
				ROW_EN 		<= '0';
				DIG_EN 		<= '0';
				REG_OE 		<= '0';
				DELAY_RST 	<= '0';
				KEY_CNT		<= '0';
				KEY_RST		<= '1';
				ADDR_CNT 	<= '1';
				ADDR_OE 	<= '1';
				RAM_WR 		<= '0';
				SHIFT_EN 	<= '1';

			when s5 =>
				COL_EN 		<= '0';
				ROW_EN 		<= '0';
				DIG_EN 		<= '0';
				REG_OE 		<= '0';
				DELAY_RST 	<= '1';
				KEY_CNT		<= '0';
				KEY_RST		<= '0';
				ADDR_CNT 	<= '1';
				ADDR_OE 	<= '1';
				RAM_WR 		<= '0';
				SHIFT_EN 	<= '1';

			when s6 =>
				COL_EN 		<= '0';
				ROW_EN 		<= '0';
				DIG_EN 		<= '0';
				REG_OE 		<= '1';
				DELAY_RST 	<= '0';
				KEY_CNT		<= '0';
				KEY_RST		<= '1';
				ADDR_CNT 	<= '0';
				ADDR_OE 	<= '0';
				RAM_WR 		<= '1';
				SHIFT_EN 	<= '1';

			when s7 =>
				COL_EN 		<= '0';
				ROW_EN 		<= '0';
				DIG_EN 		<= '0';
				REG_OE 		<= '0';
				DELAY_RST 	<= '0';
				KEY_CNT		<= '0';
				KEY_RST		<= '0';
				ADDR_CNT 	<= '1';
				ADDR_OE 	<= '1';
				RAM_WR 		<= '0';
				SHIFT_EN 	<= '0';
		end case;
	end process;
end logic; 