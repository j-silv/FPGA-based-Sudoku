--------------------------------------------------------------------
-- single port synchronous RAM module 
--------------------------------------------------------------------

--------------------------------------------------------------------
-- The RAM has addresses corresponding to row and column positions 
-- where the memory at these addresses is LED segment data 
-- for displaying a certain digit.
--------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram is
	port 
	(
		CLK		: in std_logic;
		WE		: in std_logic := '1'; --write enable signal 
		A		: in std_logic_vector((8-1) downto 0);
		D		: in std_logic_vector((8-1) downto 0);
		Q		: out std_logic_vector((8 -1) downto 0)
	);
end entity;

architecture logic of ram is
	-- 2-D array type for memory
	subtype word_t is std_logic_vector((8-1) downto 0);
	type memory_t is array(2**8-1 downto 0) of word_t;

	-- RAM signal
	signal ram : memory_t;
	
	-- initalize memory with .mif
	-- attribute ram_init_file : string;
	-- attribute ram_init_file of ram :
	-- signal is "C:\Users\justin\files\Projects\sudoku\FPGA-based-Sudoku\memory_initialization\ram.mif";

begin
	process(CLK)
	begin
		-- if a clk transition is detected and the write enable signal is high
		-- write in the data at this address
		if(rising_edge(CLK)) then
			if(WE = '1') then
				ram(to_integer(unsigned(A))) <= D;
			end if;
			-- if the write enable is not active, then output data at input address
			Q <= ram(to_integer(unsigned(A)));	
		end if;
	end process;
end logic;



