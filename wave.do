onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /hazard_unit_tb/PROG/CLK
add wave -noupdate /hazard_unit_tb/PROG/nRST
add wave -noupdate /hazard_unit_tb/PROG/test_case_num
add wave -noupdate /hazard_unit_tb/PROG/test_case
add wave -noupdate /hazard_unit_tb/huif/flushed
add wave -noupdate /hazard_unit_tb/huif/zero
add wave -noupdate /hazard_unit_tb/huif/ifid_stall
add wave -noupdate /hazard_unit_tb/huif/idex_stall
add wave -noupdate /hazard_unit_tb/huif/exmem_stall
add wave -noupdate /hazard_unit_tb/huif/memwb_stall
add wave -noupdate /hazard_unit_tb/huif/RegWrite
add wave -noupdate /hazard_unit_tb/huif/PCsrc
add wave -noupdate /hazard_unit_tb/huif/hazard
add wave -noupdate /hazard_unit_tb/huif/opcode
add wave -noupdate /hazard_unit_tb/huif/func
add wave -noupdate /hazard_unit_tb/huif/rs
add wave -noupdate /hazard_unit_tb/huif/rt
add wave -noupdate /hazard_unit_tb/huif/exmem_rd
add wave -noupdate /hazard_unit_tb/huif/idex_rd
add wave -noupdate /hazard_unit_tb/huif/exmem_rt
add wave -noupdate /hazard_unit_tb/huif/idex_rt
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {114 ns} 0}
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
WaveRestoreZoom {0 ns} {320 ns}
