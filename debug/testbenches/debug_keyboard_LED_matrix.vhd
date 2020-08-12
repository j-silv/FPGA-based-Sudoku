library ieee;
use ieee.std_logic_1164.all;

entity debug_keyboard_LED_matrix is
end;

architecture bench of debug_keyboard_LED_matrix is
	component debug
		PORT
		(
			clk : in std_logic;
			column_select : out std_logic_vector(2 downto 0);
			row0, row1 : out std_logic_vector(6 downto 0)
		);
	end component;
		
		signal clk : std_logic;
		signal column_select : std_logic_vector(2 downto 0);
		signal row0, row1 : std_logic_vector(6 downto 0);
		
		constant SYS_CLK_FREQ : integer := 50E+6;
		constant SYS_CLK_T : time := 20 ns;
		constant NUM_CLK_CYCLES : integer := 15;
		
		signal i : integer := 0; -- loop variable
begin
	comp : debug
	port map(clk => clk, column_select => column_select, row0 => row0, row1 => row1);


	--continuous system (in) clock 
	process 
	begin
		clk <= '0';
		wait for (SYS_CLK_T)/2;
		clk <= '1';
		wait for (SYS_CLK_T)/2;
		
		--stop simulation
		if i = NUM_CLK_CYCLES then
            wait;
        else
            i <= i + 1;
        end if;
	end process;
end bench;

