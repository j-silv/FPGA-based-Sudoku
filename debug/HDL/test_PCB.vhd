--------------------------------------------------------------------
-- Test PCB top level VHDL file
--------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; -- for shifting

entity test_PCB is
	port(
		keyboard_in : in std_logic_vector(9 downto 0);
		column_select : out std_logic_vector(8 downto 0) := "000000000";
		row_0, row_1, row_2 : out std_logic_vector(7 downto 0) := x"00"
	);
end entity test_PCB;

architecture logic of test_PCB is
	signal tmp : std_logic_vector(8 downto 0) := "000000001";
	signal tmp_led: std_logic_vector(7 downto 0) := x"FF";
begin
	process(keyboard_in)
	begin

		if falling_edge(keyboard_in(0)) then

			if (tmp = "100000000") then
				tmp <= "000000001";
			else 
				tmp <= std_logic_vector(shift_left(unsigned(tmp), 1));
			end if;
				

		end if;

	-- 	if falling_edge(keyboard_in(1)) then

	-- 		if (tmp_led = "10000000") then
	-- 			tmp_led <= "00000001";
	-- 		else 
	-- 			tmp_led <= std_logic_vector(shift_left(unsigned(tmp_led), 1));
	-- 		end if;
				

	-- 	end if;


	end process;

	column_select <= tmp;
	row_0 <= tmp_led;
	row_1 <= tmp_led;
	row_2 <= tmp_led;

end architecture logic;