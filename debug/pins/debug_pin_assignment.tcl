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

set_location_assignment PIN_V17 -to row1[6]
set_location_assignment PIN_V16 -to row1[5]
set_location_assignment PIN_W15 -to row1[4]
set_location_assignment PIN_W14 -to row1[3]
set_location_assignment PIN_Y14 -to row1[2]
set_location_assignment PIN_AA10 -to row1[1]
set_location_assignment PIN_V10 -to row1[0]
set_location_assignment PIN_W17 -to row0[6]
set_location_assignment PIN_U15 -to row0[5]
set_location_assignment PIN_V14 -to row0[4]
set_location_assignment PIN_V13 -to row0[3]
set_location_assignment PIN_Y13 -to row0[2]
set_location_assignment PIN_Y10 -to row0[1]
set_location_assignment PIN_V9 -to row0[0]

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to row1[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to row1[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to row1[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to row1[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to row1[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to row1[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to row1[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to row0[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to row0[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to row0[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to row0[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to row0[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to row0[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to row0[0]

set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to row1[6]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to row1[5]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to row1[4]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to row1[3]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to row1[2]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to row1[1]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to row1[0]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to row0[6]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to row0[5]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to row0[4]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to row0[3]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to row0[2]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to row0[1]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to row0[0]

set_location_assignment PIN_B4 -to column_select[2]
set_location_assignment PIN_A4 -to column_select[1]
set_location_assignment PIN_B3 -to column_select[0]

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to column_select[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to column_select[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to column_select[0]

set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to column_select[2]
set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to column_select[1]
set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to column_select[0]

set_location_assignment PIN_N14 -to clk
set_instance_assignment -name IO_STANDARD "3.3-V LVCMOS" -to clk

set_location_assignment PIN_A2 -to ROW_ON
set_location_assignment PIN_C3 -to COL_ON
set_location_assignment PIN_A3 -to DIG_ON
set_location_assignment PIN_B1 -to keyboard_in[0]
set_location_assignment PIN_B2 -to keyboard_in[1]

set_instance_assignment -name IO_STANDARD "3.3 V Schmitt Trigger" -to ROW_ON
set_instance_assignment -name IO_STANDARD "3.3 V Schmitt Trigger" -to COL_ON
set_instance_assignment -name IO_STANDARD "3.3 V Schmitt Trigger" -to DIG_ON
set_instance_assignment -name IO_STANDARD "3.3 V Schmitt Trigger" -to keyboard_in[0]
set_instance_assignment -name IO_STANDARD "3.3 V Schmitt Trigger" -to keyboard_in[1]

