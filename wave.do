onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /dcache_tb/CLK
add wave -noupdate /dcache_tb/nRST
add wave -noupdate /dcache_tb/PROG/test_case_num
add wave -noupdate /dcache_tb/PROG/test_case
add wave -noupdate -divider {datapath side}
add wave -noupdate /dcache_tb/dcif/dmemREN
add wave -noupdate /dcache_tb/dcif/dmemWEN
add wave -noupdate /dcache_tb/dcif/dhit
add wave -noupdate /dcache_tb/DUT/dcif/dmemload
add wave -noupdate /dcache_tb/DUT/dcif/dmemstore
add wave -noupdate -divider {Memory control side}
add wave -noupdate /dcache_tb/DUT/cif/dwait
add wave -noupdate /dcache_tb/DUT/cif/dREN
add wave -noupdate /dcache_tb/DUT/cif/dWEN
add wave -noupdate /dcache_tb/DUT/cif/daddr
add wave -noupdate /dcache_tb/DUT/cif/dload
add wave -noupdate /dcache_tb/DUT/cif/dstore
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {32 ns} 0}
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
WaveRestoreZoom {10 ns} {522 ns}
