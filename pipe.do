onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /system_tb/CLK
add wave -noupdate /system_tb/nRST
add wave -noupdate /system_tb/DUT/CPU/DP/dpif/imemload
add wave -noupdate /system_tb/DUT/CPU/DP/REGISTER/regis
add wave -noupdate /system_tb/DUT/CPU/DP/memwbif/EN
add wave -noupdate /system_tb/DUT/CPU/DP/memwbif/flushed
add wave -noupdate /system_tb/DUT/CPU/DP/memwbif/mem_wb_in.newPc
add wave -noupdate -expand /system_tb/DUT/CPU/DP/memwbif/mem_wb_in
add wave -noupdate /system_tb/DUT/CPU/DP/memwbif/mem_wb_out
add wave -noupdate -divider PC
add wave -noupdate /system_tb/DUT/CPU/DP/pcif/npc
add wave -noupdate /system_tb/DUT/CPU/DP/pcif/PC
add wave -noupdate /system_tb/DUT/CPU/DP/pcif/pcEN
add wave -noupdate -divider ALU
add wave -noupdate /system_tb/DUT/CPU/DP/aif/op
add wave -noupdate /system_tb/DUT/CPU/DP/aif/portA
add wave -noupdate /system_tb/DUT/CPU/DP/aif/portB
add wave -noupdate /system_tb/DUT/CPU/DP/aif/portOut
add wave -noupdate -divider cuif
add wave -noupdate /system_tb/DUT/CPU/DP/cuif/RegDst
add wave -noupdate /system_tb/DUT/CPU/DP/cuif/RegWrite
add wave -noupdate /system_tb/DUT/CPU/DP/IE/idex/in.RegWrite
add wave -noupdate /system_tb/DUT/CPU/DP/IE/idex/in.RegDst
add wave -noupdate /system_tb/DUT/CPU/DP/IE/idex/out.RegWrite
add wave -noupdate /system_tb/DUT/CPU/DP/IE/idex/out.RegDst
add wave -noupdate /system_tb/DUT/CPU/DP/EXMEM/exmemif/ex_mem_in.RegWrite
add wave -noupdate /system_tb/DUT/CPU/DP/EXMEM/exmemif/ex_mem_in.RegDst
add wave -noupdate /system_tb/DUT/CPU/DP/MEMWB/memwbif/mem_wb_in.RegWrite
add wave -noupdate /system_tb/DUT/CPU/DP/MEMWB/memwbif/mem_wb_in.RegDst
add wave -noupdate /system_tb/DUT/CPU/DP/MEMWB/memwbif/mem_wb_out.RegWrite
add wave -noupdate /system_tb/DUT/CPU/DP/MEMWB/memwbif/mem_wb_out.RegDst
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2250461 ps} 0}
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
WaveRestoreZoom {0 ps} {2625 ns}
