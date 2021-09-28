onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /system_tb/CLK
add wave -noupdate /system_tb/nRST
add wave -noupdate -divider PC
add wave -noupdate /system_tb/DUT/CPU/DP/dpif/imemload
add wave -noupdate /system_tb/DUT/CPU/DP/pcif/npc
add wave -noupdate /system_tb/DUT/CPU/DP/pcif/newpc
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
add wave -noupdate /system_tb/DUT/CPU/DP/rfif/WEN
add wave -noupdate /system_tb/DUT/CPU/DP/rfif/wsel
add wave -noupdate /system_tb/DUT/CPU/DP/rfif/rsel1
add wave -noupdate /system_tb/DUT/CPU/DP/rfif/rsel2
add wave -noupdate /system_tb/DUT/CPU/DP/rfif/wdat
add wave -noupdate /system_tb/DUT/CPU/DP/rfif/rdat1
add wave -noupdate /system_tb/DUT/CPU/DP/rfif/rdat2
add wave -noupdate /system_tb/DUT/RAM/ramif/ramREN
add wave -noupdate /system_tb/DUT/RAM/ramif/ramWEN
add wave -noupdate /system_tb/DUT/RAM/ramif/ramaddr
add wave -noupdate /system_tb/DUT/RAM/ramif/ramstore
add wave -noupdate /system_tb/DUT/RAM/ramif/ramload
add wave -noupdate /system_tb/DUT/RAM/ramif/ramstate
add wave -noupdate /system_tb/DUT/RAM/ramif/memREN
add wave -noupdate /system_tb/DUT/RAM/ramif/memWEN
add wave -noupdate /system_tb/DUT/RAM/ramif/memaddr
add wave -noupdate /system_tb/DUT/RAM/ramif/memstore
add wave -noupdate -divider dpif
add wave -noupdate /system_tb/DUT/CPU/DP/dpif/halt
add wave -noupdate /system_tb/DUT/CPU/DP/dpif/ihit
add wave -noupdate /system_tb/DUT/CPU/DP/dpif/imemREN
add wave -noupdate /system_tb/DUT/CPU/DP/dpif/imemload
add wave -noupdate /system_tb/DUT/CPU/DP/dpif/imemaddr
add wave -noupdate /system_tb/DUT/CPU/DP/dpif/dhit
add wave -noupdate /system_tb/DUT/CPU/DP/dpif/datomic
add wave -noupdate /system_tb/DUT/CPU/DP/dpif/dmemREN
add wave -noupdate /system_tb/DUT/CPU/DP/dpif/dmemWEN
add wave -noupdate /system_tb/DUT/CPU/DP/dpif/flushed
add wave -noupdate /system_tb/DUT/CPU/DP/dpif/dmemload
add wave -noupdate /system_tb/DUT/CPU/DP/dpif/dmemstore
add wave -noupdate /system_tb/DUT/CPU/DP/dpif/dmemaddr
add wave -noupdate -divider {Register file}
add wave -noupdate /system_tb/DUT/CPU/DP/rfif/WEN
add wave -noupdate -radix hexadecimal /system_tb/DUT/CPU/DP/rfif/wsel
add wave -noupdate /system_tb/DUT/CPU/DP/rfif/rsel1
add wave -noupdate /system_tb/DUT/CPU/DP/rfif/rsel2
add wave -noupdate /system_tb/DUT/CPU/DP/rfif/wdat
add wave -noupdate /system_tb/DUT/CPU/DP/rfif/rdat1
add wave -noupdate /system_tb/DUT/CPU/DP/rfif/rdat2
add wave -noupdate -divider {if id}
add wave -noupdate /system_tb/DUT/CPU/DP/ifid/imemload
add wave -noupdate /system_tb/DUT/CPU/DP/ifid/npc
add wave -noupdate /system_tb/DUT/CPU/DP/ifid/instr
add wave -noupdate /system_tb/DUT/CPU/DP/ifid/pc
add wave -noupdate /system_tb/DUT/CPU/DP/ifid/pcout
add wave -noupdate /system_tb/DUT/CPU/DP/ifid/PC
add wave -noupdate /system_tb/DUT/CPU/DP/ifid/stall
add wave -noupdate /system_tb/DUT/CPU/DP/ifid/ihit
add wave -noupdate /system_tb/DUT/CPU/DP/ifid/flushed
add wave -noupdate -divider {id ex}
add wave -noupdate -childformat {{/system_tb/DUT/CPU/DP/idex/in.rt -radix hexadecimal}} -expand -subitemconfig {/system_tb/DUT/CPU/DP/idex/in.rt {-height 16 -radix hexadecimal}} /system_tb/DUT/CPU/DP/idex/in
add wave -noupdate -expand /system_tb/DUT/CPU/DP/idex/out
add wave -noupdate /system_tb/DUT/CPU/DP/idex/ihit
add wave -noupdate /system_tb/DUT/CPU/DP/idex/stall
add wave -noupdate /system_tb/DUT/CPU/DP/idex/flushed
add wave -noupdate -divider {ex mem}
add wave -noupdate /system_tb/DUT/CPU/DP/exmemif/EN
add wave -noupdate /system_tb/DUT/CPU/DP/exmemif/ihit
add wave -noupdate /system_tb/DUT/CPU/DP/exmemif/dhit
add wave -noupdate /system_tb/DUT/CPU/DP/exmemif/flushed
add wave -noupdate /system_tb/DUT/CPU/DP/exmemif/stallDmem
add wave -noupdate -expand /system_tb/DUT/CPU/DP/exmemif/ex_mem_in
add wave -noupdate -expand /system_tb/DUT/CPU/DP/exmemif/ex_mem_out
add wave -noupdate -divider {mem wb}
add wave -noupdate /system_tb/DUT/CPU/DP/memwbif/EN
add wave -noupdate /system_tb/DUT/CPU/DP/memwbif/flushed
add wave -noupdate -expand /system_tb/DUT/CPU/DP/memwbif/mem_wb_in
add wave -noupdate -expand /system_tb/DUT/CPU/DP/memwbif/mem_wb_out
add wave -noupdate -divider {Hazard unit}
add wave -noupdate /system_tb/DUT/CPU/DP/huif/flushed
add wave -noupdate /system_tb/DUT/CPU/DP/huif/zero
add wave -noupdate /system_tb/DUT/CPU/DP/huif/PCsrc
add wave -noupdate /system_tb/DUT/CPU/DP/REGISTER/regis
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {239155 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 303
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
WaveRestoreZoom {0 ps} {1155 ns}
