library ieee;
use ieee.std_logic_1164.all;

entity fsm is
	port(
		--GENERAL--
		CLK		 	: in std_logic;
		RESET	 	: in std_logic;

		DELAY_DONE 	: in std_logic;
		KEY_DONE 	: in std_logic;
	
				
		--INPUTS--
		COL_ON 		: in std_logic;
		ROW_ON 		: in std_logic;
		DIG_ON		: in std_logic;
		
		--OUTPUTS--
		
		----DELAY_CNT 	: out std_logic;  this will always be high!! We don't need to disable the counting only reset it! 
		DELAY_RST 	: out std_logic;
		KEY_CNT		: out std_logic;
		KEY_RST		: out std_logic;
		ADDR_CNT 	: out std_logic;
		SHIFT_EN 	: out std_logic;
		RAM_WR 		: out std_logic;
		ROW_EN 		: out std_logic;
		COL_EN 		: out std_logic;
		ADDR_OE 	: out std_logic;
		REG_OE 		: out std_logic;
		DIG_EN 		: out std_logic
												--for the moment im going to tie REG_OE and DIG_OE together
												--but I should know that for when im writing from an EEPROM DIG_OE has to be
												--a seperate control signal (so no 2 devices are accessing the data bus of the RAM

	);
end entity;


-- VERSION 2 - i deleted the 9th state that doesn't seem necessary but we'll see

architecture logic of fsm is
	-- Build an enumerated type for the state machine
	type state_type is (s0, s1, s2, s3, s4, s5, s6, s7);

	-- register to hold the current state
	signal state : state_type;
begin
	-- logic to advance to the next state
	process (CLK, RESET)
	begin
		-- complete reset (asynchronous!)
		if RESET = '1' then
			state <= s0;
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
		case state is
			when s0 =>
				COL_EN 		<= '0';
				ROW_EN 		<= '0';
				DIG_EN 		<= '0';
				REG_OE 		<= '0';
				--DELAY_CNT 	<= '1';
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
				--DELAY_CNT 	<= '0';
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
				--DELAY_CNT 	<= '0';
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
				--DELAY_CNT 	<= '0';
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
				--DELAY_CNT 	<= '0';
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
				--DELAY_CNT 	<= '0';
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
				--DELAY_CNT 	<= '0';
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
				--DELAY_CNT 	<= '0';
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



-- VERSION 1
-- architecture logic of fsm is
	-- -- Build an enumerated type for the state machine
	-- type state_type is (s0, s1, s2, s3, s4, s5, s6, s7, s8);

	-- -- Register to hold the current state
	-- signal state : state_type;
-- begin
	-- -- Logic to advance to the next state
	-- process (CLK, RESET)
	-- begin
		-- --complete reset
		-- if RESET = '1' then
			-- state <= s0;
		-- elsif (rising_edge(CLK)) then
			-- case state is
				-- when s0 =>
					-- if COL_ON = '1' then
						-- state <= s1;
					-- elsif ROW_ON = '1' then
						-- state <= s2;
					-- elsif DIG_ON = '1' then
						-- state <= s3;		
					-- elsif DELAY_DONE = '1' then
						-- state <= s4;					
					-- else 
						-- state <= s0;
					-- end if;
		
				-- when s1 =>
					-- state <= s5;
					
				-- when s2 =>
					-- state <= s5;
					
				-- when s3 =>
					-- state <= s5;
					
				-- when s4 =>
					-- state <= s0;
					
				-- when s5 =>
					-- if ((COL_ON OR ROW_ON OR DIG_ON) = '1') then
						-- state <= s5;
					-- elsif KEY_DONE = '0' then
						-- state <= s0;
					-- else
						-- state <= s6;
					-- end if;
		
				-- when s6 =>
					-- state <= s7;
				
				-- when s7 =>
					-- state <= s8;
					
				-- when s8 =>
					-- state <= s0;
			-- end case;
		-- end if;
	-- end process;

	-- process (state)
	-- begin
		-- case state is
			-- when s0 =>
				-- COL_EN 		<= '0';
				-- ROW_EN 		<= '0';
				-- DIG_EN 		<= '0';
				-- REG_OE 		<= '0';
				-- --DELAY_CNT 	<= '1';
				-- DELAY_RST 	<= '0';
				-- KEY_CNT		<= '0';
				-- KEY_RST		<= '0';
				-- ADDR_CNT 	<= '1';
				-- ADDR_OE 	<= '1';
				-- RAM_WR 		<= '0';
				-- SHIFT_EN 	<= '1';
				
			-- when s1 =>
				-- COL_EN 		<= '1';
				-- ROW_EN 		<= '0';
				-- DIG_EN 		<= '0';
				-- REG_OE 		<= '0';
				-- --DELAY_CNT 	<= '0';
				-- DELAY_RST 	<= '0';
				-- KEY_CNT		<= '1';
				-- KEY_RST		<= '0';
				-- ADDR_CNT 	<= '1';
				-- ADDR_OE 	<= '1';
				-- RAM_WR 		<= '0';
				-- SHIFT_EN 	<= '1';

			-- when s2 =>
				-- COL_EN 		<= '0';
				-- ROW_EN 		<= '1';
				-- DIG_EN 		<= '0';
				-- REG_OE 		<= '0';
				-- --DELAY_CNT 	<= '0';
				-- DELAY_RST 	<= '0';
				-- KEY_CNT		<= '1';
				-- KEY_RST		<= '0';
				-- ADDR_CNT 	<= '1';
				-- ADDR_OE 	<= '1';
				-- RAM_WR 		<= '0';
				-- SHIFT_EN 	<= '1';

			-- when s3 =>
				-- COL_EN 		<= '0';
				-- ROW_EN 		<= '0';
				-- DIG_EN 		<= '1';
				-- REG_OE 		<= '0';
				-- --DELAY_CNT 	<= '0';
				-- DELAY_RST 	<= '0';
				-- KEY_CNT		<= '1';
				-- KEY_RST		<= '0';
				-- ADDR_CNT 	<= '1';
				-- ADDR_OE 	<= '1';
				-- RAM_WR 		<= '0';
				-- SHIFT_EN 	<= '1';

			-- when s4 =>
				-- COL_EN 		<= '0';
				-- ROW_EN 		<= '0';
				-- DIG_EN 		<= '0';
				-- REG_OE 		<= '0';
				-- --DELAY_CNT 	<= '0';
				-- DELAY_RST 	<= '0';
				-- KEY_CNT		<= '0';
				-- KEY_RST		<= '1';
				-- ADDR_CNT 	<= '1';
				-- ADDR_OE 	<= '1';
				-- RAM_WR 		<= '0';
				-- SHIFT_EN 	<= '1';

			-- when s5 =>
				-- COL_EN 		<= '0';
				-- ROW_EN 		<= '0';
				-- DIG_EN 		<= '0';
				-- REG_OE 		<= '0';
				-- --DELAY_CNT 	<= '0';
				-- DELAY_RST 	<= '1';
				-- KEY_CNT		<= '0';
				-- KEY_RST		<= '0';
				-- ADDR_CNT 	<= '1';
				-- ADDR_OE 	<= '1';
				-- RAM_WR 		<= '0';
				-- SHIFT_EN 	<= '1';

			-- when s6 =>
				-- COL_EN 		<= '0';
				-- ROW_EN 		<= '0';
				-- DIG_EN 		<= '0';
				-- REG_OE 		<= '1';
				-- --DELAY_CNT 	<= '0';
				-- DELAY_RST 	<= '0';
				-- KEY_CNT		<= '0';
				-- KEY_RST		<= '1';
				-- ADDR_CNT 	<= '0';
				-- ADDR_OE 	<= '0';
				-- RAM_WR 		<= '1';
				-- SHIFT_EN 	<= '1';

			-- when s7 =>
				-- COL_EN 		<= '0';
				-- ROW_EN 		<= '0';
				-- DIG_EN 		<= '0';
				-- REG_OE 		<= '0';
				-- --DELAY_CNT 	<= '0';
				-- DELAY_RST 	<= '0';
				-- KEY_CNT		<= '0';
				-- KEY_RST		<= '0';
				-- ADDR_CNT 	<= '1';
				-- ADDR_OE 	<= '1';
				-- RAM_WR 		<= '0';
				-- SHIFT_EN 	<= '0';

			-- when s8 =>
				-- COL_EN 		<= '0';
				-- ROW_EN 		<= '0';
				-- DIG_EN 		<= '0';
				-- REG_OE 		<= '0';
				-- --DELAY_CNT 	<= '0';
				-- DELAY_RST 	<= '0';
				-- KEY_CNT		<= '0';
				-- KEY_RST		<= '0';
				-- ADDR_CNT 	<= '0';
				-- ADDR_OE 	<= '0';
				-- RAM_WR 		<= '0';
				-- SHIFT_EN 	<= '1';			
		-- end case;
	-- end process;
-- end logic; 