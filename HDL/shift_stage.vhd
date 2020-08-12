library ieee;
use ieee.numeric_std.all, ieee.std_logic_1164.all;

entity shift_stage is

	port(
			CLK	   			: in std_logic;
			EN				: in std_logic; 	--stops shifting/latching data
			OE 				: in std_logic;  	--tristate buffer in between stages
			OUT_ALL			: in std_logic;
			RESET   		: in std_logic;
			SEL				: in std_logic;  	--SEL = '1' serial load, SEL = '0' parallel load
			SR_IN			: in std_logic; 	--serial IN
			SR_OUT			: out std_logic;	--serial OUT
			D				: in std_logic_vector(7 downto 0); 	--parallel IN
			ROW_0			: out std_logic_vector(7 downto 0); --parallel OUT
			ROW_1			: out std_logic_vector(7 downto 0); --parallel OUT
			ROW_2			: out std_logic_vector(7 downto 0); --parallel OUT
			ROW_3			: out std_logic_vector(7 downto 0); --parallel OUT
			ROW_4			: out std_logic_vector(7 downto 0); --parallel OUT
			ROW_5			: out std_logic_vector(7 downto 0); --parallel OUT
			ROW_6			: out std_logic_vector(7 downto 0); --parallel OUT
			ROW_7			: out std_logic_vector(7 downto 0); --parallel OUT
			ROW_8			: out std_logic_vector(7 downto 0) 	--parallel OUT

		);
	
end entity shift_stage;


architecture structure of shift_stage is

component sr

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
	
end component;


signal STAGE_1_OUT	:	std_logic_vector(7 downto 0); 
signal STAGE_2_OUT	:	std_logic_vector(7 downto 0);
signal STAGE_3_OUT	:	std_logic_vector(7 downto 0); 
signal STAGE_4_OUT	:	std_logic_vector(7 downto 0); 
signal STAGE_5_OUT	:	std_logic_vector(7 downto 0);
signal STAGE_6_OUT	:	std_logic_vector(7 downto 0); 
signal STAGE_7_OUT	:	std_logic_vector(7 downto 0); 
signal STAGE_8_OUT	:	std_logic_vector(7 downto 0); 
signal STAGE_9_OUT	:	std_logic_vector(7 downto 0); 


signal SR_OUT_1		:	std_logic;
signal SR_OUT_2		:	std_logic;
signal SR_OUT_3		:	std_logic;
signal SR_OUT_4		:	std_logic;
signal SR_OUT_5		:	std_logic;
signal SR_OUT_6		:	std_logic;
signal SR_OUT_7		:	std_logic;
signal SR_OUT_8		:	std_logic;



begin
	
	STAGE_1	: sr port map (CLK, EN, OE, RESET, SEL, SR_IN, SR_OUT_1, D, STAGE_1_OUT);
	STAGE_2	: sr port map (CLK, EN, OE, RESET, SEL, SR_OUT_1, SR_OUT_2, STAGE_1_OUT, STAGE_2_OUT);
	STAGE_3	: sr port map (CLK, EN, OE, RESET, SEL, SR_OUT_2, SR_OUT_3, STAGE_2_OUT, STAGE_3_OUT);
	STAGE_4	: sr port map (CLK, EN, OE, RESET, SEL, SR_OUT_3, SR_OUT_4, STAGE_3_OUT, STAGE_4_OUT);
	STAGE_5	: sr port map (CLK, EN, OE, RESET, SEL, SR_OUT_4, SR_OUT_5, STAGE_4_OUT, STAGE_5_OUT);
	STAGE_6	: sr port map (CLK, EN, OE, RESET, SEL, SR_OUT_5, SR_OUT_6, STAGE_5_OUT, STAGE_6_OUT);
	STAGE_7	: sr port map (CLK, EN, OE, RESET, SEL, SR_OUT_6, SR_OUT_7, STAGE_6_OUT, STAGE_7_OUT);
	STAGE_8	: sr port map (CLK, EN, OE, RESET, SEL, SR_OUT_7, SR_OUT_8, STAGE_7_OUT, STAGE_8_OUT);
	STAGE_9	: sr port map (CLK, EN, OE, RESET, SEL, SR_OUT_8, SR_OUT, STAGE_8_OUT, STAGE_9_OUT);
	
	
--VERSION 2
	process (OUT_ALL) is
	begin
		if OUT_ALL = '1' then
			ROW_8 <= STAGE_1_OUT; 			
			ROW_7 <= STAGE_2_OUT;			
			ROW_6 <= STAGE_3_OUT;			
			ROW_5 <= STAGE_4_OUT;			
			ROW_4 <= STAGE_5_OUT;			
			ROW_3 <= STAGE_6_OUT;			
			ROW_2 <= STAGE_7_OUT;			
			ROW_1 <= STAGE_8_OUT;			
			ROW_0 <= STAGE_9_OUT;		
		end if;
	end process;

	
--VERSION 1	
	-- process (OUT_ALL,STAGE_1_OUT,STAGE_2_OUT,STAGE_3_OUT,STAGE_4_OUT,STAGE_5_OUT,STAGE_6_OUT,STAGE_7_OUT,STAGE_8_OUT,STAGE_9_OUT) is
	-- begin
		-- if OUT_ALL = '1' then
			-- ROW_8 <= STAGE_1_OUT; 			
			-- ROW_7 <= STAGE_2_OUT;			
			-- ROW_6 <= STAGE_3_OUT;			
			-- ROW_5 <= STAGE_4_OUT;			
			-- ROW_4 <= STAGE_5_OUT;			
			-- ROW_3 <= STAGE_6_OUT;			
			-- ROW_2 <= STAGE_7_OUT;			
			-- ROW_1 <= STAGE_8_OUT;			
			-- ROW_0 <= STAGE_9_OUT;		
		
		
		-- else 
			-- ROW_8 <= x"ZZ"; 			
			-- ROW_7 <= x"ZZ"; 			
			-- ROW_6 <= x"ZZ"; 		
			-- ROW_5 <= x"ZZ"; 			
			-- ROW_4 <= x"ZZ"; 			
			-- ROW_3 <= x"ZZ"; 		
			-- ROW_2 <= x"ZZ"; 			
			-- ROW_1 <= x"ZZ"; 			
			-- ROW_0 <= x"ZZ"; 
			
		-- end if;
	-- end process;


--the row numbers and the stage numbers are inversed because 
--we're loading in the segment data from the bottom of the shift registers! 	
	
end; 