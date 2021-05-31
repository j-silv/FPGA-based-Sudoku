onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group Clocks -label {50 MHz system clock} /full_design_all_signals/SYS_CLK
add wave -noupdate -expand -group Clocks -label {Data clock} /full_design_all_signals/INV_CLK
add wave -noupdate -expand -group Clocks -label {FSM clock} /full_design_all_signals/CLK
add wave -noupdate -expand -group {ON keyboard signals (active low)} -color Gold -itemcolor Gold -label COL_ON /full_design_all_signals/COL_ON
add wave -noupdate -expand -group {ON keyboard signals (active low)} -color Gold -itemcolor Gold -label ROW_ON /full_design_all_signals/ROW_ON
add wave -noupdate -expand -group {ON keyboard signals (active low)} -color Gold -itemcolor Gold -label DIG_ON /full_design_all_signals/DIG_ON
add wave -noupdate -expand -group Keyboard -color Gold -label {Keyboard bus (9..0)} /full_design_all_signals/keyboard_in
add wave -noupdate -expand -group Keyboard -label {Synchronized keyboard bus (9..0)} /full_design_all_signals/keyboard_out
add wave -noupdate -expand -group {Input timeout} -label {Reset input timeout} /full_design_all_signals/DELAY_RST
add wave -noupdate -expand -group {Input timeout} -label {Input timeout DONE} /full_design_all_signals/DELAY_DONE
add wave -noupdate -expand -group {Key counter} -label {Key count} /full_design_all_signals/KEY_CNT
add wave -noupdate -expand -group {Key counter} -label {Reset key counter} /full_design_all_signals/KEY_RST
add wave -noupdate -expand -group {Key counter} -label {Key count DONE} /full_design_all_signals/KEY_DONE
add wave -noupdate -expand -group {Sudoku grid} -color Gold -itemcolor Gold -label {Column selection} /full_design_all_signals/column_select
add wave -noupdate -expand -group {Sudoku grid} -label {1st row} -radix hexadecimal /full_design_all_signals/row_0
add wave -noupdate -expand -group {Sudoku grid} -label {2nd row} -radix hexadecimal /full_design_all_signals/row_1
add wave -noupdate -expand -group {Sudoku grid} -color Gold -itemcolor Gold -label {3rd row} -radix hexadecimal /full_design_all_signals/row_2
add wave -noupdate -expand -group {Sudoku grid} -label {4th row} -radix hexadecimal /full_design_all_signals/row_3
add wave -noupdate -expand -group {Sudoku grid} -label {5th row} -radix hexadecimal /full_design_all_signals/row_4
add wave -noupdate -expand -group {Sudoku grid} -label {6th row} -radix hexadecimal /full_design_all_signals/row_5
add wave -noupdate -expand -group {Sudoku grid} -label {7th row} -radix hexadecimal /full_design_all_signals/row_6
add wave -noupdate -expand -group {Sudoku grid} -label {8th row} -radix hexadecimal /full_design_all_signals/row_7
add wave -noupdate -expand -group {Sudoku grid} -label {9th row} -radix hexadecimal /full_design_all_signals/row_8
add wave -noupdate -group Debouncer -label {Debouncer reset} /full_design_all_signals/BOUNCE_RST
add wave -noupdate -group Debouncer -label {Debouncer DONE} /full_design_all_signals/BOUNCE_DONE
add wave -noupdate -group {RAM address counter} -label {RAM address count enable} /full_design_all_signals/ADDR_CNT
add wave -noupdate -group {RAM address counter} -label {RAM address counter OUT} /full_design_all_signals/decode_in
add wave -noupdate -group {Keyboard registers} -label {Column enable} /full_design_all_signals/COL_EN
add wave -noupdate -group {Keyboard registers} -label {Row enable } /full_design_all_signals/ROW_EN
add wave -noupdate -group {Keyboard registers} -label {Digit enable} /full_design_all_signals/DIG_EN
add wave -noupdate -group {Shift register stage} -label {Shift register stage OUT} /full_design_all_signals/SHIFT_OUT
add wave -noupdate -group {Shift register stage} -label {Shift stage enable} /full_design_all_signals/SHIFT_EN
add wave -noupdate -group Encoders -label {Encoded LED segment data} /full_design_all_signals/encoded_ledseg
add wave -noupdate -group Encoders -label {Encoded position data} /full_design_all_signals/encoded_position
add wave -noupdate -group GRAM -label {GRAM address} /full_design_all_signals/ram_addr
add wave -noupdate -group GRAM -label {GRAM data IN} /full_design_all_signals/ram_in
add wave -noupdate -group GRAM -label {GRAM data OUT} -radix hexadecimal /full_design_all_signals/ram_out
add wave -noupdate -group GRAM -label {GRAM write} /full_design_all_signals/RAM_WR
add wave -noupdate -group GRAM -label {GRAM address mux select} /full_design_all_signals/REG_OE
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 354
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits us
update
WaveRestoreZoom {0 ps} {688197800 ps}
