onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /hazard_unit_tb/CLK
add wave -noupdate /hazard_unit_tb/nRST
add wave -noupdate /hazard_unit_tb/PROG/test_case_num
add wave -noupdate /hazard_unit_tb/PROG/test_case
add wave -noupdate /hazard_unit_tb/DUT/huif/zero
add wave -noupdate /hazard_unit_tb/DUT/huif/ifid_stall
add wave -noupdate /hazard_unit_tb/DUT/huif/idex_stall
add wave -noupdate /hazard_unit_tb/DUT/huif/exmem_stall
add wave -noupdate /hazard_unit_tb/DUT/huif/memwb_stall
add wave -noupdate /hazard_unit_tb/DUT/huif/exmem_RegWrite
add wave -noupdate /hazard_unit_tb/DUT/huif/idex_RegWrite
add wave -noupdate /hazard_unit_tb/DUT/huif/halt
add wave -noupdate /hazard_unit_tb/DUT/huif/flushed
add wave -noupdate /hazard_unit_tb/DUT/huif/PCsrc
add wave -noupdate /hazard_unit_tb/DUT/huif/hazard
add wave -noupdate /hazard_unit_tb/DUT/huif/idex_opcode
add wave -noupdate /hazard_unit_tb/DUT/huif/exmem_opcode
add wave -noupdate /hazard_unit_tb/DUT/huif/rs
add wave -noupdate /hazard_unit_tb/DUT/huif/rt
add wave -noupdate /hazard_unit_tb/DUT/huif/exmem_rd
add wave -noupdate /hazard_unit_tb/DUT/huif/idex_rd
add wave -noupdate /hazard_unit_tb/DUT/huif/exmem_rt
add wave -noupdate /hazard_unit_tb/DUT/huif/idex_rt
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {40 ns} 0}
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
WaveRestoreZoom {0 ns} {336 ns}
