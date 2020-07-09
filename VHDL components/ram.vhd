library ieee;
use ieee.std_logic_1164.all;

entity ram is
	port 
	(
		CLK		: in std_logic;
		A		: in natural range 0 to 2**8 - 1;
		D		: in std_logic_vector((8-1) downto 0);
		WE		: in std_logic := '1';
		OE 		: in std_logic := '1';
		Q		: out std_logic_vector((8 -1) downto 0)
	);
end entity;

architecture logic of ram is
	--2-D array type for memory
	subtype word_t is std_logic_vector((8-1) downto 0);
	type memory_t is array(2**8-1 downto 0) of word_t;

	--RAM signal
	signal ram : memory_t;

begin
	process(CLK)
	begin
		if(rising_edge(CLK)) then
			if(WE = '1') then
				ram(A) <= D;
			end if;
			
			if OE = '1' then
				Q <= ram(A);
			else 
				Q <= "ZZZZZZZZ";
			end if;
		end if;
	end process;
end logic;



