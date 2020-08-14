-- Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- PROGRAM		"Quartus II 64-Bit"
-- VERSION		"Version 15.0.0 Build 145 04/22/2015 SJ Web Edition"
-- CREATED		"Fri Aug 14 23:22:47 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY full_design IS 
	PORT
	(
		ROW_ON :  IN  STD_LOGIC;
		COL_ON :  IN  STD_LOGIC;
		DIG_ON :  IN  STD_LOGIC;
		SYS_CLK :  IN  STD_LOGIC;
		RESET :  IN  STD_LOGIC;
		keyboard_in :  IN  STD_LOGIC_VECTOR(9 DOWNTO 0);
		DELAY_RST :  OUT  STD_LOGIC;
		KEY_CNT :  OUT  STD_LOGIC;
		KEY_RST :  OUT  STD_LOGIC;
		ADDR_CNT :  OUT  STD_LOGIC;
		SHIFT_EN :  OUT  STD_LOGIC;
		RAM_WR :  OUT  STD_LOGIC;
		REG_OE :  OUT  STD_LOGIC;
		addr_decoder :  OUT  STD_LOGIC_VECTOR(8 TO 8);
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
END full_design;

ARCHITECTURE bdf_type OF full_design IS 

COMPONENT pll
	PORT(inclk0 : IN STD_LOGIC;
		 c0 : OUT STD_LOGIC;
		 c1 : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT input_on_register
	PORT(CLK : IN STD_LOGIC;
		 RST : IN STD_LOGIC;
		 D0 : IN STD_LOGIC;
		 D1 : IN STD_LOGIC;
		 D2 : IN STD_LOGIC;
		 Q0 : OUT STD_LOGIC;
		 Q1 : OUT STD_LOGIC;
		 Q2 : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT fsm
	PORT(CLK : IN STD_LOGIC;
		 RESET : IN STD_LOGIC;
		 DELAY_DONE : IN STD_LOGIC;
		 KEY_DONE : IN STD_LOGIC;
		 COL_ON : IN STD_LOGIC;
		 ROW_ON : IN STD_LOGIC;
		 DIG_ON : IN STD_LOGIC;
		 DELAY_RST : OUT STD_LOGIC;
		 KEY_CNT : OUT STD_LOGIC;
		 KEY_RST : OUT STD_LOGIC;
		 ADDR_CNT : OUT STD_LOGIC;
		 SHIFT_EN : OUT STD_LOGIC;
		 RAM_WR : OUT STD_LOGIC;
		 ROW_EN : OUT STD_LOGIC;
		 COL_EN : OUT STD_LOGIC;
		 ADDR_OE : OUT STD_LOGIC;
		 REG_OE : OUT STD_LOGIC;
		 DIG_EN : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT position_encoder
	PORT(D : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
		 Q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT ledseg_encoder
	PORT(D : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		 Q : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT position_register
	PORT(CLK : IN STD_LOGIC;
		 ROW_EN : IN STD_LOGIC;
		 COL_EN : IN STD_LOGIC;
		 COL_IN : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 ROW_IN : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Q : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT ledseg_register
	PORT(CLK : IN STD_LOGIC;
		 EN : IN STD_LOGIC;
		 D : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 Q : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT addr_counter
	PORT(CLK : IN STD_LOGIC;
		 CNT_EN : IN STD_LOGIC;
		 Q : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT addr_decoder
	PORT(D : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
		 SHIFT_OUT : OUT STD_LOGIC;
		 COL_SEL : OUT STD_LOGIC_VECTOR(8 DOWNTO 0)
	);
END COMPONENT;

COMPONENT addr_bus_mux
	PORT(ADDR_OE : IN STD_LOGIC;
		 REG_OE : IN STD_LOGIC;
		 addr_counter : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 pos_register : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 ram_addr : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT open_drain
	PORT(d : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(8 DOWNTO 0)
	);
END COMPONENT;

COMPONENT ram
	PORT(CLK : IN STD_LOGIC;
		 WE : IN STD_LOGIC;
		 A : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 D : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 Q : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT shift_stage
	PORT(clk : IN STD_LOGIC;
		 shift_out : IN STD_LOGIC;
		 shift_en : IN STD_LOGIC;
		 rst : IN STD_LOGIC;
		 data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 row_0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 row_1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 row_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 row_3 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 row_4 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 row_5 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 row_6 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 row_7 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 row_8 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT input_key_register
	PORT(CLK : IN STD_LOGIC;
		 RST : IN STD_LOGIC;
		 D : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		 Q : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
	);
END COMPONENT;

COMPONENT input_timeout
	PORT(clk : IN STD_LOGIC;
		 rst : IN STD_LOGIC;
		 done : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT key_counter
	PORT(clk : IN STD_LOGIC;
		 rst : IN STD_LOGIC;
		 done : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	ADDR_CNT_ALTERA_SYNTHESIZED :  STD_LOGIC;
SIGNAL	addr_decoder_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL	CLK :  STD_LOGIC;
SIGNAL	COL_EN :  STD_LOGIC;
SIGNAL	DELAY_DONE :  STD_LOGIC;
SIGNAL	DELAY_RST_ALTERA_SYNTHESIZED :  STD_LOGIC;
SIGNAL	DIG_EN :  STD_LOGIC;
SIGNAL	encoded_ledseg :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	encoded_position :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	INV_CLK :  STD_LOGIC;
SIGNAL	KEY_CNT_ALTERA_SYNTHESIZED :  STD_LOGIC;
SIGNAL	KEY_DONE :  STD_LOGIC;
SIGNAL	KEY_RST_ALTERA_SYNTHESIZED :  STD_LOGIC;
SIGNAL	keyboard_out :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	NOT_RESET :  STD_LOGIC;
SIGNAL	pos_register :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	ram_addr :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	ram_in :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	ram_out :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	RAM_WR_ALTERA_SYNTHESIZED :  STD_LOGIC;
SIGNAL	REG_OE_ALTERA_SYNTHESIZED :  STD_LOGIC;
SIGNAL	ROW_EN :  STD_LOGIC;
SIGNAL	SHIFT_EN_ALTERA_SYNTHESIZED :  STD_LOGIC;
SIGNAL	SHIFT_OUT :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(8 DOWNTO 0);


BEGIN 



b2v_inst : pll
PORT MAP(inclk0 => SYS_CLK,
		 c0 => CLK,
		 c1 => INV_CLK);


b2v_inst1 : input_on_register
PORT MAP(CLK => INV_CLK,
		 RST => NOT_RESET,
		 D0 => COL_ON,
		 D1 => ROW_ON,
		 D2 => DIG_ON,
		 Q0 => SYNTHESIZED_WIRE_0,
		 Q1 => SYNTHESIZED_WIRE_1,
		 Q2 => SYNTHESIZED_WIRE_2);


b2v_inst11 : fsm
PORT MAP(CLK => CLK,
		 RESET => NOT_RESET,
		 DELAY_DONE => DELAY_DONE,
		 KEY_DONE => KEY_DONE,
		 COL_ON => SYNTHESIZED_WIRE_0,
		 ROW_ON => SYNTHESIZED_WIRE_1,
		 DIG_ON => SYNTHESIZED_WIRE_2,
		 DELAY_RST => DELAY_RST_ALTERA_SYNTHESIZED,
		 KEY_CNT => KEY_CNT_ALTERA_SYNTHESIZED,
		 KEY_RST => KEY_RST_ALTERA_SYNTHESIZED,
		 ADDR_CNT => ADDR_CNT_ALTERA_SYNTHESIZED,
		 SHIFT_EN => SHIFT_EN_ALTERA_SYNTHESIZED,
		 RAM_WR => RAM_WR_ALTERA_SYNTHESIZED,
		 ROW_EN => ROW_EN,
		 COL_EN => COL_EN,
		 ADDR_OE => addr_decoder_ALTERA_SYNTHESIZED(8),
		 REG_OE => REG_OE_ALTERA_SYNTHESIZED,
		 DIG_EN => DIG_EN);


b2v_inst12 : position_encoder
PORT MAP(D => keyboard_out(8 DOWNTO 0),
		 Q => encoded_position);


b2v_inst14 : ledseg_encoder
PORT MAP(D => keyboard_out,
		 Q => encoded_ledseg);


b2v_inst15 : position_register
PORT MAP(CLK => INV_CLK,
		 ROW_EN => ROW_EN,
		 COL_EN => COL_EN,
		 COL_IN => encoded_position,
		 ROW_IN => encoded_position,
		 Q => pos_register);


b2v_inst16 : ledseg_register
PORT MAP(CLK => INV_CLK,
		 EN => DIG_EN,
		 D => encoded_ledseg,
		 Q => ram_in);


b2v_inst17 : addr_counter
PORT MAP(CLK => CLK,
		 CNT_EN => ADDR_CNT_ALTERA_SYNTHESIZED,
		 Q => addr_decoder_ALTERA_SYNTHESIZED(7 DOWNTO 0));


b2v_inst18 : addr_decoder
PORT MAP(D => addr_decoder_ALTERA_SYNTHESIZED,
		 SHIFT_OUT => SHIFT_OUT,
		 COL_SEL => SYNTHESIZED_WIRE_3);


b2v_inst20 : addr_bus_mux
PORT MAP(ADDR_OE => addr_decoder_ALTERA_SYNTHESIZED(8),
		 REG_OE => REG_OE_ALTERA_SYNTHESIZED,
		 addr_counter => addr_decoder_ALTERA_SYNTHESIZED(7 DOWNTO 0),
		 pos_register => pos_register,
		 ram_addr => ram_addr);


b2v_inst21 : open_drain
PORT MAP(d => SYNTHESIZED_WIRE_3,
		 q => column_select);


b2v_inst22 : ram
PORT MAP(CLK => CLK,
		 WE => RAM_WR_ALTERA_SYNTHESIZED,
		 A => ram_addr,
		 D => ram_in,
		 Q => ram_out);


b2v_inst23 : shift_stage
PORT MAP(clk => CLK,
		 shift_out => SHIFT_OUT,
		 shift_en => SHIFT_EN_ALTERA_SYNTHESIZED,
		 rst => NOT_RESET,
		 data_in => ram_out,
		 row_0 => row_0,
		 row_1 => row_1,
		 row_2 => row_2,
		 row_3 => row_3,
		 row_4 => row_4,
		 row_5 => row_5,
		 row_6 => row_6,
		 row_7 => row_7,
		 row_8 => row_8);


b2v_inst4 : input_key_register
PORT MAP(CLK => INV_CLK,
		 RST => NOT_RESET,
		 D => keyboard_in,
		 Q => keyboard_out);


NOT_RESET <= NOT(RESET);



b2v_inst7 : input_timeout
PORT MAP(clk => CLK,
		 rst => DELAY_RST_ALTERA_SYNTHESIZED,
		 done => DELAY_DONE);


b2v_inst9 : key_counter
PORT MAP(clk => KEY_CNT_ALTERA_SYNTHESIZED,
		 rst => KEY_RST_ALTERA_SYNTHESIZED,
		 done => KEY_DONE);

DELAY_RST <= DELAY_RST_ALTERA_SYNTHESIZED;
KEY_CNT <= KEY_CNT_ALTERA_SYNTHESIZED;
KEY_RST <= KEY_RST_ALTERA_SYNTHESIZED;
ADDR_CNT <= ADDR_CNT_ALTERA_SYNTHESIZED;
SHIFT_EN <= SHIFT_EN_ALTERA_SYNTHESIZED;
RAM_WR <= RAM_WR_ALTERA_SYNTHESIZED;
REG_OE <= REG_OE_ALTERA_SYNTHESIZED;
addr_decoder(8) <= addr_decoder_ALTERA_SYNTHESIZED(8);

END bdf_type;