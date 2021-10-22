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
add wave -noupdate /dcache_tb/dcif/dmemaddr
add wave -noupdate /dcache_tb/PROG/cache_op/tag
add wave -noupdate /dcache_tb/PROG/cache_op/index
add wave -noupdate /dcache_tb/PROG/cache_op/block_offset
add wave -noupdate -divider {Memory control side}
add wave -noupdate /dcache_tb/DUT/cif/dwait
add wave -noupdate /dcache_tb/DUT/cif/dREN
add wave -noupdate /dcache_tb/DUT/cif/dWEN
add wave -noupdate /dcache_tb/DUT/cif/daddr
add wave -noupdate /dcache_tb/DUT/cif/dload
add wave -noupdate /dcache_tb/DUT/cif/dstore
add wave -noupdate -divider DUT
add wave -noupdate /dcache_tb/DUT/state
add wave -noupdate /dcache_tb/DUT/nxt_state
add wave -noupdate /dcache_tb/DUT/dcaches
add wave -noupdate /dcache_tb/DUT/nxt_dcaches
add wave -noupdate /dcache_tb/DUT/recent
add wave -noupdate /dcache_tb/DUT/hit_counter
add wave -noupdate /dcache_tb/DUT/miss
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1275 ns} 0}
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
WaveRestoreZoom {1208 ns} {1286 ns}
