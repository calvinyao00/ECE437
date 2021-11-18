onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /memory_control_tb/CLK
add wave -noupdate /memory_control_tb/nRST
add wave -noupdate /memory_control_tb/PROG/test_case_num
add wave -noupdate /memory_control_tb/PROG/test_case
add wave -noupdate -divider {Cache 0}
add wave -noupdate /memory_control_tb/CM0/dcif/ihit
add wave -noupdate /memory_control_tb/CM0/dcif/imemREN
add wave -noupdate /memory_control_tb/CM0/dcif/imemload
add wave -noupdate /memory_control_tb/CM0/dcif/imemaddr
add wave -noupdate /memory_control_tb/CM0/dcif/dhit
add wave -noupdate /memory_control_tb/CM0/dcif/dmemREN
add wave -noupdate /memory_control_tb/CM0/dcif/dmemWEN
add wave -noupdate /memory_control_tb/CM0/dcif/dmemaddr
add wave -noupdate /memory_control_tb/CM0/dcif/dmemload
add wave -noupdate /memory_control_tb/CM0/dcif/dmemstore
add wave -noupdate /memory_control_tb/CM0/cif/iload
add wave -noupdate /memory_control_tb/CM0/cif/dload
add wave -noupdate /memory_control_tb/CM0/cif/dstore
add wave -noupdate /memory_control_tb/CM0/cif/iaddr
add wave -noupdate /memory_control_tb/CM0/cif/daddr
add wave -noupdate -divider Cache1
add wave -noupdate /memory_control_tb/CM1/dcif/ihit
add wave -noupdate /memory_control_tb/CM1/dcif/imemREN
add wave -noupdate /memory_control_tb/CM1/dcif/imemload
add wave -noupdate /memory_control_tb/CM1/dcif/imemaddr
add wave -noupdate /memory_control_tb/CM1/dcif/dhit
add wave -noupdate /memory_control_tb/CM1/dcif/dmemREN
add wave -noupdate /memory_control_tb/CM1/dcif/dmemWEN
add wave -noupdate /memory_control_tb/CM1/dcif/dmemaddr
add wave -noupdate /memory_control_tb/CM1/dcif/dmemload
add wave -noupdate /memory_control_tb/CM1/dcif/dmemstore
add wave -noupdate /memory_control_tb/CM1/cif/iload
add wave -noupdate /memory_control_tb/CM1/cif/dload
add wave -noupdate /memory_control_tb/CM1/cif/dstore
add wave -noupdate /memory_control_tb/CM1/cif/iaddr
add wave -noupdate /memory_control_tb/CM1/cif/daddr
add wave -noupdate -divider {memory contoller}
add wave -noupdate /memory_control_tb/DUT/state
add wave -noupdate /memory_control_tb/DUT/ccif/iREN
add wave -noupdate /memory_control_tb/DUT/ccif/iaddr
add wave -noupdate /memory_control_tb/DUT/ccif/iload
add wave -noupdate /memory_control_tb/DUT/ccif/dREN
add wave -noupdate /memory_control_tb/DUT/ccif/dWEN
add wave -noupdate /memory_control_tb/DUT/ccif/dload
add wave -noupdate /memory_control_tb/DUT/ccif/dstore
add wave -noupdate /memory_control_tb/DUT/ccif/daddr
add wave -noupdate /memory_control_tb/DUT/ccif/ccwait
add wave -noupdate /memory_control_tb/DUT/ccif/ccinv
add wave -noupdate /memory_control_tb/DUT/ccif/ccwrite
add wave -noupdate /memory_control_tb/DUT/ccif/cctrans
add wave -noupdate /memory_control_tb/DUT/ccif/ccsnoopaddr
add wave -noupdate -divider {RAM side}
add wave -noupdate /memory_control_tb/DUT/ccif/ramWEN
add wave -noupdate /memory_control_tb/DUT/ccif/ramREN
add wave -noupdate /memory_control_tb/DUT/ccif/ramstate
add wave -noupdate /memory_control_tb/DUT/ccif/ramaddr
add wave -noupdate /memory_control_tb/DUT/ccif/ramstore
add wave -noupdate /memory_control_tb/DUT/ccif/ramload
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {145259 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 293
configure wave -valuecolwidth 249
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
WaveRestoreZoom {38960 ps} {171634 ps}
