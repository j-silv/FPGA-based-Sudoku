# Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions 
# and other software and tools, and its AMPP partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License 
# Subscription Agreement, the Altera Quartus II License Agreement,
# the Altera MegaCore Function License Agreement, or other 
# applicable license agreement, including, without limitation, 
# that your use is for the sole purpose of programming logic 
# devices manufactured by Altera and sold by Altera or its 
# authorized distributors.  Please refer to the applicable 
# agreement for further details.

# Quartus II 64-Bit Version 15.0.0 Build 145 04/22/2015 SJ Web Edition
# File: C:\Users\idontseeit\Desktop\Justins_Files\electronics\Projects\sudoku\quartus\pins\pinoutmanuallyexported.tcl
# Generated on: Sun Aug 09 12:40:53 2020

package require ::quartus::project

set_location_assignment PIN_V17 -to row_1[7]
set_location_assignment PIN_V16 -to row_1[6]
set_location_assignment PIN_W15 -to row_1[5]
set_location_assignment PIN_W14 -to row_1[4]
set_location_assignment PIN_Y14 -to row_1[3]
set_location_assignment PIN_AA10 -to row_1[2]
set_location_assignment PIN_V10 -to row_1[1]
set_location_assignment PIN_W17 -to row_0[7]
set_location_assignment PIN_U15 -to row_0[6]
set_location_assignment PIN_V14 -to row_0[5]
set_location_assignment PIN_V13 -to row_0[4]
set_location_assignment PIN_Y13 -to row_0[3]
set_location_assignment PIN_Y10 -to row_0[2]
set_location_assignment PIN_V9 -to row_0[1]

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to row_1[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to row_1[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to row_1[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to row_1[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to row_1[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to row_1[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to row_1[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to row_0[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to row_0[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to row_0[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to row_0[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to row_0[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to row_0[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to row_0[1]

set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to row_1[7]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to row_1[6]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to row_1[5]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to row_1[4]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to row_1[3]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to row_1[2]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to row_1[1]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to row_0[7]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to row_0[6]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to row_0[5]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to row_0[4]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to row_0[3]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to row_0[2]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to row_0[1]

set_location_assignment PIN_B4 -to column_select[2]
set_location_assignment PIN_A4 -to column_select[1]
set_location_assignment PIN_B3 -to column_select[0]

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to column_select[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to column_select[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to column_select[0]

set_location_assignment PIN_N14 -to SYS_CLK
set_instance_assignment -name IO_STANDARD "3.3-V LVCMOS" -to SYS_CLK

set_location_assignment PIN_A2 -to ROW_ON
set_location_assignment PIN_C3 -to COL_ON
set_location_assignment PIN_A3 -to DIG_ON
set_location_assignment PIN_B1 -to keyboard_in[0]
set_location_assignment PIN_B2 -to keyboard_in[1]
set_location_assignment PIN_D13 -to keyboard_in[2]
set_location_assignment PIN_E13 -to keyboard_in[3]
set_location_assignment PIN_B14 -to keyboard_in[4]
set_location_assignment PIN_C13 -to keyboard_in[5]
set_location_assignment PIN_J13 -to keyboard_in[6]
set_location_assignment PIN_C17 -to keyboard_in[7]
set_location_assignment PIN_E15 -to keyboard_in[8]
set_location_assignment PIN_K15 -to keyboard_in[9]


set_location_assignment PIN_M1 -to RESET


set_instance_assignment -name IO_STANDARD "3.3 V Schmitt Trigger" -to ROW_ON
set_instance_assignment -name IO_STANDARD "3.3 V Schmitt Trigger" -to COL_ON
set_instance_assignment -name IO_STANDARD "3.3 V Schmitt Trigger" -to DIG_ON
set_instance_assignment -name IO_STANDARD "3.3 V Schmitt Trigger" -to keyboard_in[0]
set_instance_assignment -name IO_STANDARD "3.3 V Schmitt Trigger" -to keyboard_in[1]
set_instance_assignment -name IO_STANDARD "3.3 V Schmitt Trigger" -to keyboard_in[2]
set_instance_assignment -name IO_STANDARD "3.3 V Schmitt Trigger" -to keyboard_in[3]
set_instance_assignment -name IO_STANDARD "3.3 V Schmitt Trigger" -to keyboard_in[4]
set_instance_assignment -name IO_STANDARD "3.3 V Schmitt Trigger" -to keyboard_in[5]
set_instance_assignment -name IO_STANDARD "3.3 V Schmitt Trigger" -to keyboard_in[6]
set_instance_assignment -name IO_STANDARD "3.3 V Schmitt Trigger" -to keyboard_in[7]
set_instance_assignment -name IO_STANDARD "3.3 V Schmitt Trigger" -to keyboard_in[8]
set_instance_assignment -name IO_STANDARD "3.3 V Schmitt Trigger" -to keyboard_in[9]
set_instance_assignment -name IO_STANDARD "3.3 V Schmitt Trigger" -to RESET

set_instance_assignment -name WEAK_PULL_UP_RESISTOR OFF -to ROW_ON
set_instance_assignment -name WEAK_PULL_UP_RESISTOR OFF -to COL_ON
set_instance_assignment -name WEAK_PULL_UP_RESISTOR OFF -to DIG_ON
set_instance_assignment -name WEAK_PULL_UP_RESISTOR OFF -to keyboard_in[0]
set_instance_assignment -name WEAK_PULL_UP_RESISTOR OFF -to keyboard_in[1]
set_instance_assignment -name WEAK_PULL_UP_RESISTOR OFF -to keyboard_in[2]
set_instance_assignment -name WEAK_PULL_UP_RESISTOR OFF -to keyboard_in[3]
set_instance_assignment -name WEAK_PULL_UP_RESISTOR OFF -to keyboard_in[4]
set_instance_assignment -name WEAK_PULL_UP_RESISTOR OFF -to keyboard_in[5]
set_instance_assignment -name WEAK_PULL_UP_RESISTOR OFF -to keyboard_in[6]
set_instance_assignment -name WEAK_PULL_UP_RESISTOR OFF -to keyboard_in[7]
set_instance_assignment -name WEAK_PULL_UP_RESISTOR OFF -to keyboard_in[8]
set_instance_assignment -name WEAK_PULL_UP_RESISTOR OFF -to keyboard_in[9]
set_instance_assignment -name WEAK_PULL_UP_RESISTOR OFF -to RESET




#USER_LED_1 corresponds to DELAY_RST
#USER_LED_2 corresponds to KEY_CNT
#USER_LED_3 corresponds to KEY_RST
#USER_LED_4 corresponds to ADDR_CNT
#USER_LED_5 corresponds to SHIFT_EN
#USER_LED_6 corresponds to RAM_WR
#USER_LED_7 corresponds to ADDR_OE (decode_in[8])
#USER_LED_8 corresponds to REG_OE

set_location_assignment PIN_M2 -to DELAY_RST
set_location_assignment PIN_N1 -to KEY_CNT
set_location_assignment PIN_R2 -to KEY_RST
set_location_assignment PIN_T1 -to ADDR_CNT
set_location_assignment PIN_V4 -to SHIFT_EN
set_location_assignment PIN_T6 -to RAM_WR
set_location_assignment PIN_AB4 -to decode_in[8]
set_location_assignment PIN_AA5 -to REG_OE




set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DELAY_RST
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to KEY_CNT
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to KEY_RST
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ADDR_CNT
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SHIFT_EN
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to RAM_WR
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to decode_in[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to REG_OE