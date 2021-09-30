onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /memory_control_tb/PROG/test_case_num
add wave -noupdate /memory_control_tb/PROG/test_case
add wave -noupdate /memory_control_tb/CLK
add wave -noupdate /memory_control_tb/nRST
add wave -noupdate /memory_control_tb/DUT/ccif/ramstate
add wave -noupdate /memory_control_tb/DUT/ccif/ramstore
add wave -noupdate -divider {Read data}
add wave -noupdate /memory_control_tb/DUT/ccif/dREN
add wave -noupdate /memory_control_tb/DUT/ccif/dload
add wave -noupdate -divider {Read Instr}
add wave -noupdate /memory_control_tb/DUT/ccif/iREN
add wave -noupdate /memory_control_tb/DUT/ccif/iload
add wave -noupdate /memory_control_tb/DUT/ccif/ramload
add wave -noupdate -divider {Write data}
add wave -noupdate /memory_control_tb/DUT/ccif/dWEN
add wave -noupdate /memory_control_tb/DUT/ccif/dstore
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {163257 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {525 ns}
