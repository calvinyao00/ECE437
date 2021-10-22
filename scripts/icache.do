onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /icache_tb/CLK
add wave -noupdate /icache_tb/nRST
add wave -noupdate /icache_tb/PROG/test_case_num
add wave -noupdate /icache_tb/PROG/test_case
add wave -noupdate -divider {Datapath side}
add wave -noupdate /icache_tb/dcif/ihit
add wave -noupdate /icache_tb/dcif/imemREN
add wave -noupdate /icache_tb/dcif/imemload
add wave -noupdate -divider {Memory control side}
add wave -noupdate /icache_tb/dcif/imemaddr
add wave -noupdate /icache_tb/cif/iREN
add wave -noupdate /icache_tb/cif/iload
add wave -noupdate /icache_tb/cif/iaddr
add wave -noupdate -divider DUT
add wave -noupdate /icache_tb/DUT/cache_hit
add wave -noupdate /icache_tb/DUT/icaches
add wave -noupdate /icache_tb/DUT/addr
add wave -noupdate /icache_tb/DUT/next_icaches
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1024 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 210
configure wave -valuecolwidth 177
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
WaveRestoreZoom {227 ns} {1083 ns}
