--modeled after SN74LS395
library ieee;
use ieee.std_logic_1164.all;

entity shift_register is
	generic(
		NUM_STAGES : natural := 8
	);

	port(
		CLK	   			: in std_logic;
		EN				: in std_logic; 	--stops shifting/latching data
		OE 				: in std_logic;  	--tristate buffer
		RESET   		: in std_logic;
		SEL				: in std_logic;  	--SEL = '1' serial load, SEL = '0' parallel load
		
		SR_IN			: in std_logic; 	--serial IN
		SR_OUT			: out std_logic;	--serial OUT

		D				: in std_logic_vector(7 downto 0); --parallel IN
		Q				: out std_logic_vector(7 downto 0) --parallel OUT
	);
end entity;

architecture logic of shift_register is
	signal sr_contents : std_logic_vector((NUM_STAGES-1) downto 0);
begin

	data_in : process (CLK, RESET)
	begin
		--clear shift registers
		if (RESET = '1') then 
			sr_contents <= (others=>'0');
			
		elsif (rising_edge(CLK)) then
			if (EN = '1') then
				case SEL is
				
					--SERIAL
					when '1' =>
						-- Shift data by one stage; data from last stage is lost
						sr_contents((NUM_STAGES-1) downto 1) <= sr_contents((NUM_STAGES-2) downto 0);
						
						-- Load new data into the first stage
						sr_contents(0) <= SR_IN;
					
					--PARALLEL
					when '0' =>
						sr_contents <= D;
						
				end case;
			end if;
		end if;
	end process;

	data_out : process(sr_contents,OE) is
	begin
		if OE = '1' then
			-- Capture the data from the last stage, before it is lost
			SR_OUT <= sr_contents(NUM_STAGES-1);
			Q <= sr_contents;
		else 
			SR_OUT <= 'Z';
			Q <= "ZZZZZZZZ";
		end if;
	end process;
end logic;