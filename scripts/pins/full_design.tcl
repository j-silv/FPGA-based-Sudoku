# -----------------------------------------------------------------------
# Quartus (TCL) script for assigning various input/output pin parameters
#
# NOTE: set pin variable names correspond to BeMicro schematic naming, and
# the corresponding values correspond to Quartus full_design schematic naming
# (e.g. set EG_P1 row_3[3] means the BeMicro EG_P1 signal is associated with
# the row_3[3] Quartus signal)
# -----------------------------------------------------------------------

# necessary package declaration to pull in Quartus project
package require ::quartus::project

# various indexing variables
set NUM_LED_SEGMENTS 8
set NUM_COLUMNS 9
set NUM_KEYS 10

##### Relationship between BeMicro schematic signal names and design names #########

set GPIO_A keyboard_in[9]
set GPIO_B column_select[0]
set LVDS_TX_B- keyboard_in[8]
set LVDS_TX_B+ column_select[1]
set LVDS_TX_A- keyboard_in[7]
set LVDS_TX_A+ column_select[2]
set LVDS_TX_9- ROW_ON
set LVDS_TX_9+ column_select[3]
set LVDS_TX_8- DIG_ON
set LVDS_TX_8+ column_select[4]
set LVDS_TX_7- keyboard_in[6]
set LVDS_TX_7+ column_select[5]
set LVDS_TX_6- keyboard_in[5]
set LVDS_TX_6+ column_select[6]
set LVDS_TX_5- column_select[7]
set LVDS_TX_5+ keyboard_in[4]
set LVDS_TX_4- column_select[8]
set LVDS_TX_4+ keyboard_in[3]
set LVDS_TX_3- keyboard_in[2]
set LVDS_TX_3+ COL_ON
set LVDS_TX_2- keyboard_in[1]
set LVDS_TX_2+ keyboard_in[0]
set LVDS_TX_1- GIVEUP
set LVDS_TX_1+ CORRECT
set LVDS_TX_0- DIFFSET
set LVDS_TX_0+ WRONG

set DIFF_RX_2+ RSTGAME
set DIFF_RX_2- DIFFEASY
set DIFF_RX_1+ CHECKANS
set DIFF_RX_1- DIFFMED
set DIFF_RX_0+ NEWGAME
set DIFF_RX_0- DIFFHARD

set GPIO_01 row_0[0]
set GPIO_02 row_0[5]
set GPIO_03 row_0[1]
set GPIO_04 row_0[6]
set GPIO_05 row_0[7]
set GPIO_06 row_0[2]
set GPIO_07 row_0[3]
set GPIO_08 row_1[0]
set GPIO_09 row_0[4]
set GPIO_10 row_1[5]
set GPIO_11 row_1[1]
set GPIO_12 row_1[6]
set DIFF_RX_B+ row_1[2]
set DIFF_RX_B- row_1[7]
set DIFF_RX_A+ row_1[3]
set DIFF_RX_A- row_1[4]
set DIFF_RX_9+ row_2[0]
set DIFF_RX_9- row_2[5]
set DIFF_RX_8+ row_2[1]
set DIFF_RX_8- row_2[6]
set DIFF_RX_7+ row_2[2]
set DIFF_RX_7- row_2[7]
set DIFF_RX_6+ row_2[3]
set DIFF_RX_6- row_2[4]

set EG_P1 row_3[3] 
set EG_P2 row_3[4] 
set EG_P3 row_4[0] 
set EG_P4 row_4[5] 
set EG_P5 row_4[1] 
set EG_P6 row_4[6] 
set EG_P7 row_4[2] 
set EG_P8 row_4[7] 
set EG_P9 row_4[3] 
set EG_P10 row_4[4] 
set EG_P11 row_5[0] 
set EG_P12 row_5[5] 
set EG_P13 row_5[1] 
set EG_P14 row_5[6] 
set EG_P15 row_5[2] 
set EG_P16 row_6[2] 
set EG_P17 row_6[7] 
set EG_P18 row_6[3] 
set EG_P19 row_6[4] 
set EG_P20 row_7[0] 
set EG_P21 row_7[5] 
set EG_P22 row_7[1] 
set EG_P23 row_7[6] 
set EG_P24 row_7[2] 
set EG_P25 row_7[7] 
set EG_P26 row_7[3] 
set EG_P27 row_7[4] 
set EG_P28 row_8[0] 
set EG_P29 row_8[5] 
set EG_P35 row_3[0] 
set EG_P36 row_3[5] 
set EG_P37 row_3[1] 
set EG_P38 row_3[6] 
set EG_P39 row_3[2] 
set EG_P40 row_3[7] 
set EG_P46 row_5[7] 
set EG_P47 row_5[3] 
set EG_P48 row_5[4] 
set EG_P49 row_6[0] 
set EG_P51 row_6[5] 
set EG_P52 row_6[1] 
set EG_P53 row_6[6] 
set EG_P55 row_8[1] 
set EG_P56 row_8[6] 
set EG_P57 row_8[2] 
set EG_P58 row_8[7] 
set EG_P59 row_8[3] 
set EG_P60 row_8[4] 
################################

for {set i 0} {$i < $NUM_LED_SEGMENTS} {incr i} {
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to row_0[$i]
  set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to row_1[$i]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to row_2[$i]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to row_3[$i]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to row_4[$i]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to row_5[$i]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to row_6[$i]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to row_7[$i]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to row_8[$i]
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to row_0[$i]
  set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to row_1[$i]
  set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to row_2[$i]
  set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to row_3[$i]
  set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to row_4[$i]
  set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to row_5[$i]
  set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to row_6[$i]
  set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to row_7[$i]
  set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to row_8[$i]
}

for {set i 0} {$i < $NUM_COLUMNS} {incr i} {
    set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to column_select[$i]
}

# set pin location and logic level for input system clock (which goes to the PLL)
# this is the signal that comes from the on-board 50 MHz clock
set_location_assignment PIN_N14 -to SYS_CLK
set_instance_assignment -name IO_STANDARD "3.3-V LVCMOS" -to SYS_CLK

# set pin location, logic level and pullups for the ON signals from the keyboard
set_location_assignment PIN_AA6 -to ${LVDS_TX_7-}
set_location_assignment PIN_W15 -to ${LVDS_TX_2+}
set_location_assignment PIN_V16 -to ${LVDS_TX_1+}
set_instance_assignment -name IO_STANDARD "3.3 V Schmitt Trigger" -to ${LVDS_TX_1+}
set_instance_assignment -name IO_STANDARD "3.3 V Schmitt Trigger" -to ${LVDS_TX_7-}
set_instance_assignment -name IO_STANDARD "3.3 V Schmitt Trigger" -to ${LVDS_TX_2+}
set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to ${LVDS_TX_1+}
set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to ${LVDS_TX_7-}
set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to ${LVDS_TX_2+}

# set logic level and internal pullups for the input keyboard signals
for {set i 0} {$i < $NUM_KEYS} {incr i} {
  set_instance_assignment -name IO_STANDARD "3.3 V Schmitt Trigger" -to keyboard_in[$i]
	set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to keyboard_in[$i]
}

# set pin location and logic level for main reset signal
set_location_assignment PIN_M1 -to RESET
set_instance_assignment -name IO_STANDARD "3.3 V Schmitt Trigger" -to RESET

# set pin location and logic level for internal FSM signals (debugging)
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
# USER_LED_1 corresponds to DELAY_RST
# USER_LED_2 corresponds to KEY_CNT
# USER_LED_3 corresponds to KEY_RST
# USER_LED_4 corresponds to ADDR_CNT
# USER_LED_5 corresponds to SHIFT_EN
# USER_LED_6 corresponds to RAM_WR
# USER_LED_7 corresponds to ADDR_OE (decode_in[8])
# USER_LED_8 corresponds to REG_OE

# Jumper 5 (J5 BeMicro schematic) connector
set_location_assignment PIN_B2 -to $GPIO_01
set_location_assignment PIN_B1 -to $GPIO_02
set_location_assignment PIN_C3 -to $GPIO_03
set_location_assignment PIN_A2 -to $GPIO_04
set_location_assignment PIN_B3 -to $GPIO_05
set_location_assignment PIN_A3 -to $GPIO_06
set_location_assignment PIN_B4 -to $GPIO_07
set_location_assignment PIN_A4 -to $GPIO_08
set_location_assignment PIN_B5 -to $GPIO_09
set_location_assignment PIN_A5 -to $GPIO_10
set_location_assignment PIN_B7 -to $GPIO_11
set_location_assignment PIN_A6 -to $GPIO_12
set_location_assignment PIN_A7 -to ${DIFF_RX_B+}
set_location_assignment PIN_A8 -to ${DIFF_RX_B-}
set_location_assignment PIN_A9 -to ${DIFF_RX_A+}
set_location_assignment PIN_B8 -to ${DIFF_RX_A-}
set_location_assignment PIN_B10 -to ${DIFF_RX_9+}
set_location_assignment PIN_C9 -to ${DIFF_RX_9-}
set_location_assignment PIN_H12 -to ${DIFF_RX_8+}
set_location_assignment PIN_J11 -to ${DIFF_RX_8-}
set_location_assignment PIN_E12 -to ${DIFF_RX_7+}
set_location_assignment PIN_D13 -to ${DIFF_RX_7-}
set_location_assignment PIN_D14 -to ${DIFF_RX_6+}
set_location_assignment PIN_E13 -to ${DIFF_RX_6-}
set_location_assignment PIN_D17 -to ${DIFF_RX_2+}
set_location_assignment PIN_C17 -to ${DIFF_RX_2-}
set_location_assignment PIN_E16 -to ${DIFF_RX_1+}
set_location_assignment PIN_E15 -to ${DIFF_RX_1-}
set_location_assignment PIN_K14 -to ${DIFF_RX_0+}
set_location_assignment PIN_K15 -to ${DIFF_RX_0-}

# unused jumper connections
# set_location_assignment PIN_A14 -to ${DIFF_RX_5+}
# set_location_assignment PIN_B14 -to ${DIFF_RX_5-}
# set_location_assignment PIN_C14 -to ${DIFF_RX_4+}
# set_location_assignment PIN_C13 -to ${DIFF_RX_4-}
# set_location_assignment PIN_H14 -to ${DIFF_RX_3+}
# set_location_assignment PIN_J13 -to ${DIFF_RX_3-}

# Jumper 4 (J4 BeMicro schematic) connector
set_location_assignment PIN_AA15 -to ${GPIO_A}
set_location_assignment PIN_Y16 -to ${GPIO_B}
set_location_assignment PIN_W3 -to ${LVDS_TX_B+}
set_location_assignment PIN_W4 -to ${LVDS_TX_B-}
set_location_assignment PIN_W5 -to ${LVDS_TX_A+}
set_location_assignment PIN_W6 -to ${LVDS_TX_A-}
set_location_assignment PIN_U7 -to ${LVDS_TX_9+}
set_location_assignment PIN_U6 -to ${LVDS_TX_9-}
set_location_assignment PIN_W8 -to ${LVDS_TX_8+}
set_location_assignment PIN_W7 -to ${LVDS_TX_8-}
set_location_assignment PIN_AA7 -to ${LVDS_TX_7+}
set_location_assignment PIN_V10 -to ${LVDS_TX_6+}
set_location_assignment PIN_V9 -to ${LVDS_TX_6-}
set_location_assignment PIN_AA10 -to ${LVDS_TX_5+}
set_location_assignment PIN_Y10 -to ${LVDS_TX_5-}
set_location_assignment PIN_Y14 -to ${LVDS_TX_4+}
set_location_assignment PIN_Y13 -to ${LVDS_TX_4-}
set_location_assignment PIN_W14 -to ${LVDS_TX_3+}
set_location_assignment PIN_V13 -to ${LVDS_TX_3-}
set_location_assignment PIN_V14 -to ${LVDS_TX_2-}
set_location_assignment PIN_U15 -to ${LVDS_TX_1-}
set_location_assignment PIN_V17 -to ${LVDS_TX_0+}
set_location_assignment PIN_W17 -to ${LVDS_TX_0-}

# output LED segments for edge connector (these are fixed by PCB)
set_location_assignment PIN_C1 -to $EG_P1
set_location_assignment PIN_D2 -to $EG_P2
set_location_assignment PIN_D1 -to $EG_P3
set_location_assignment PIN_D3 -to $EG_P4
set_location_assignment PIN_E1 -to $EG_P5
set_location_assignment PIN_F2 -to $EG_P6
set_location_assignment PIN_F1 -to $EG_P7
set_location_assignment PIN_G1 -to $EG_P8
set_location_assignment PIN_H1 -to $EG_P9
set_location_assignment PIN_J1 -to $EG_P10
set_location_assignment PIN_K2 -to $EG_P11
set_location_assignment PIN_L2 -to $EG_P12
set_location_assignment PIN_N2 -to $EG_P13
set_location_assignment PIN_P3 -to $EG_P14
set_location_assignment PIN_P1 -to $EG_P15
set_location_assignment PIN_R3 -to $EG_P16
set_location_assignment PIN_T2 -to $EG_P17
set_location_assignment PIN_R4 -to $EG_P18
set_location_assignment PIN_T5 -to $EG_P19
set_location_assignment PIN_Y1 -to $EG_P20
set_location_assignment PIN_Y2 -to $EG_P21
set_location_assignment PIN_AA1 -to $EG_P22
set_location_assignment PIN_AA2 -to $EG_P23
set_location_assignment PIN_Y3 -to $EG_P24
set_location_assignment PIN_Y4 -to $EG_P25
set_location_assignment PIN_AB6 -to $EG_P26
set_location_assignment PIN_AB7 -to $EG_P27
set_location_assignment PIN_AA8 -to $EG_P28
set_location_assignment PIN_AB8 -to $EG_P29
set_location_assignment PIN_E11 -to $EG_P35
set_location_assignment PIN_E10 -to $EG_P36
set_location_assignment PIN_D9 -to $EG_P37
set_location_assignment PIN_E9 -to $EG_P38
set_location_assignment PIN_E8 -to $EG_P39
set_location_assignment PIN_D8 -to $EG_P40
set_location_assignment PIN_C6 -to $EG_P46
set_location_assignment PIN_D5 -to $EG_P47
set_location_assignment PIN_C5 -to $EG_P48
set_location_assignment PIN_C4 -to $EG_P49
set_location_assignment PIN_J10 -to $EG_P51
set_location_assignment PIN_M9 -to $EG_P52
set_location_assignment PIN_M8 -to $EG_P53
set_location_assignment PIN_N8 -to $EG_P55
set_location_assignment PIN_N5 -to $EG_P56
set_location_assignment PIN_N4 -to $EG_P57
set_location_assignment PIN_N3 -to $EG_P58
set_location_assignment PIN_P5 -to $EG_P59
set_location_assignment PIN_P4 -to $EG_P60

# unused edge connector pins
# set_location_assignment PIN_E6 -to $EG_P41
# set_location_assignment PIN_D7 -to $EG_P42
# set_location_assignment PIN_C8 -to $EG_P43
# set_location_assignment PIN_C7 -to $EG_P44
# set_location_assignment PIN_D6 -to $EG_P45
# set_location_assignment PIN_H11 -to $EG_P50
# set_location_assignment PIN_N9 -to $EG_P54


# unused BeMicro MAX 10 peripherals
# set_location_assignment PIN_C20 -to PMOD_A[0]
# set_location_assignment PIN_D19 -to PMOD_A[1]
# set_location_assignment PIN_D18 -to PMOD_A[2]
# set_location_assignment PIN_E18 -to PMOD_A[3]
# set_location_assignment PIN_E19 -to PMOD_B[0]
# set_location_assignment PIN_F18 -to PMOD_B[1]
# set_location_assignment PIN_F20 -to PMOD_B[2]
# set_location_assignment PIN_G19 -to PMOD_B[3]
# set_location_assignment PIN_U18 -to PMOD_C[0]
# set_location_assignment PIN_U17 -to PMOD_C[1]
# set_location_assignment PIN_R18 -to PMOD_C[2]
# set_location_assignment PIN_P18 -to PMOD_C[3]
# set_location_assignment PIN_R14 -to PMOD_D[0]
# set_location_assignment PIN_R15 -to PMOD_D[1]
# set_location_assignment PIN_P15 -to PMOD_D[2]
# set_location_assignment PIN_P14 -to PMOD_D[3]
# set_location_assignment PIN_R5 -to EXP_PRESENT
# set_location_assignment PIN_C2 -to RESET_EXPn
# set_location_assignment PIN_T20 -to SDRAM_A[0]
# set_location_assignment PIN_T19 -to SDRAM_A[1]
# set_location_assignment PIN_T18 -to SDRAM_A[2]
# set_location_assignment PIN_AA21 -to SDRAM_A[3]
# set_location_assignment PIN_AA22 -to SDRAM_A[4]
# set_location_assignment PIN_U22 -to SDRAM_A[5]
# set_location_assignment PIN_T22 -to SDRAM_A[6]
# set_location_assignment PIN_R22 -to SDRAM_A[7]
# set_location_assignment PIN_P20 -to SDRAM_A[8]
# set_location_assignment PIN_P22 -to SDRAM_A[9]
# set_location_assignment PIN_U21 -to SDRAM_A[10]
# set_location_assignment PIN_P19 -to SDRAM_A[11]
# set_location_assignment PIN_N20 -to SDRAM_A[12]
# set_location_assignment PIN_R20 -to SDRAM_BA[0]
# set_location_assignment PIN_T21 -to SDRAM_BA[1]
# set_location_assignment PIN_N21 -to SDRAM_CASn
# set_location_assignment PIN_N22 -to SDRAM_CKE
# set_location_assignment PIN_M22 -to SDRAM_CLK
# set_location_assignment PIN_P21 -to SDRAM_CSn
# set_location_assignment PIN_L22 -to SDRAM_DQMH
# set_location_assignment PIN_L20 -to SDRAM_DQML
# set_location_assignment PIN_C22 -to SDRAM_DQ[0]
# set_location_assignment PIN_D22 -to SDRAM_DQ[1]
# set_location_assignment PIN_E22 -to SDRAM_DQ[2]
# set_location_assignment PIN_F22 -to SDRAM_DQ[3]
# set_location_assignment PIN_G22 -to SDRAM_DQ[4]
# set_location_assignment PIN_H22 -to SDRAM_DQ[5]
# set_location_assignment PIN_J22 -to SDRAM_DQ[6]
# set_location_assignment PIN_K22 -to SDRAM_DQ[7]
# set_location_assignment PIN_K21 -to SDRAM_DQ[8]
# set_location_assignment PIN_J21 -to SDRAM_DQ[9]
# set_location_assignment PIN_H21 -to SDRAM_DQ[10]
# set_location_assignment PIN_G20 -to SDRAM_DQ[11]
# set_location_assignment PIN_F21 -to SDRAM_DQ[12]
# set_location_assignment PIN_E21 -to SDRAM_DQ[13]
# set_location_assignment PIN_D21 -to SDRAM_DQ[14]
# set_location_assignment PIN_C21 -to SDRAM_DQ[15]
# set_location_assignment PIN_M20 -to SDRAM_RASn
# set_location_assignment PIN_M21 -to SDRAM_WEn
# set_location_assignment PIN_N15 -to USER_CLK
# set_location_assignment PIN_F5 -to AIN[0]
# set_location_assignment PIN_E4 -to AIN[1]
# set_location_assignment PIN_F4 -to AIN[2]
# set_location_assignment PIN_E3 -to AIN[3]
# set_location_assignment PIN_J8 -to AIN[4]
# set_location_assignment PIN_G4 -to AIN[5]
# set_location_assignment PIN_J9 -to AIN[6]
# set_location_assignment PIN_F3 -to AIN[7]
# set_location_assignment PIN_N18 -to AD5681R_LDACn
# set_location_assignment PIN_L15 -to AD5681R_RSTn
# set_location_assignment PIN_G17 -to AD5681R_SCL
# set_location_assignment PIN_H17 -to AD5681R_SDA
# set_location_assignment PIN_N19 -to AD5681R_SYNCn
# set_location_assignment PIN_P13 -to ADT7420_CT
# set_location_assignment PIN_AB14 -to ADT7420_INT
# set_location_assignment PIN_W13 -to ADT7420_SCL
# set_location_assignment PIN_R13 -to ADT7420_SDA
# set_location_assignment PIN_L14 -to ADXL362_CS
# set_location_assignment PIN_L18 -to ADXL362_MISO
# set_location_assignment PIN_L19 -to ADXL362_MOSI
# set_location_assignment PIN_M18 -to ADXL362_SCLK
# set_location_assignment PIN_M15 -to ADXL362_INT1
# set_location_assignment PIN_M14 -to ADXL362_INT2
# set_location_assignment PIN_R1 -to PB[2]
# set_location_assignment PIN_V5 -to PB[3]
# set_location_assignment PIN_AB5 -to PB[4]
# set_location_assignment PIN_R11 -to SFLASH_ASDI
# set_location_assignment PIN_R10 -to SFLASH_CSn
# set_location_assignment PIN_P10 -to SFLASH_DATA
# set_location_assignment PIN_P11 -to SFLASH_DCLK
# set_location_assignment PIN_AB15 -to I2C_SCL
# set_location_assignment PIN_AA14 -to I2C_SDA

##################################