onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /system_tb/CLK
add wave -noupdate /system_tb/nRST
add wave -noupdate /system_tb/DUT/halt
add wave -noupdate /system_tb/DUT/CPU/DP/cuif/imemload
add wave -noupdate -divider PC
add wave -noupdate /system_tb/DUT/CPU/DP/pcif/PC
add wave -noupdate /system_tb/DUT/CPU/DP/pcif/pcEN
add wave -noupdate /system_tb/DUT/CPU/DP/pcif/newpc
add wave -noupdate /system_tb/DUT/CPU/DP/pcif/npc
add wave -noupdate /system_tb/DUT/CPU/DP/cuif/PCsrc
add wave -noupdate /system_tb/DUT/CPU/DP/cuif/BranchAddr
add wave -noupdate -divider ALU
add wave -noupdate /system_tb/DUT/CPU/DP/aif/flagZero
add wave -noupdate /system_tb/DUT/CPU/DP/aif/portA
add wave -noupdate /system_tb/DUT/CPU/DP/aif/portB
add wave -noupdate /system_tb/DUT/CPU/DP/aif/portOut
add wave -noupdate /system_tb/DUT/CPU/DP/aif/op
add wave -noupdate -divider {Control Unit}
add wave -noupdate /system_tb/DUT/CPU/DP/cuif/ALUsrc
add wave -noupdate /system_tb/DUT/CPU/DP/cuif/shamt
add wave -noupdate /system_tb/DUT/CPU/DP/cuif/dWEN
add wave -noupdate /system_tb/DUT/CPU/DP/cuif/dREN
add wave -noupdate /system_tb/DUT/CPU/ccif/iREN
add wave -noupdate -divider cache
add wave -noupdate /system_tb/DUT/CPU/ccif/ramstate
add wave -noupdate /system_tb/DUT/CPU/ccif/iwait
add wave -noupdate /system_tb/DUT/CPU/dcif/ihit
add wave -noupdate -divider {Register file}
add wave -noupdate /system_tb/DUT/CPU/DP/rfif/rdat1
add wave -noupdate /system_tb/DUT/CPU/DP/rfif/rdat2
add wave -noupdate /system_tb/DUT/CPU/DP/rfif/rsel1
add wave -noupdate /system_tb/DUT/CPU/DP/rfif/rsel2
add wave -noupdate /system_tb/DUT/CPU/DP/cuif/rs
add wave -noupdate /system_tb/DUT/CPU/DP/cuif/rt
add wave -noupdate -divider {RF write data}
add wave -noupdate /system_tb/DUT/CPU/DP/rfif/WEN
add wave -noupdate /system_tb/DUT/CPU/DP/rfif/wsel
add wave -noupdate /system_tb/DUT/CPU/DP/rfif/wdat
add wave -noupdate -divider registers
add wave -noupdate -expand /system_tb/DUT/CPU/DP/REGISTER/regis
add wave -noupdate /system_tb/DUT/CPU/DP/cuif/dWEN
add wave -noupdate /system_tb/DUT/CPU/DP/cuif/dREN
add wave -noupdate /system_tb/DUT/CPU/DP/ruif/dWEN
add wave -noupdate /system_tb/DUT/CPU/DP/ruif/dREN
add wave -noupdate /system_tb/DUT/CPU/DP/ruif/dmemREN
add wave -noupdate /system_tb/DUT/CPU/DP/ruif/dmemWEN
add wave -noupdate /system_tb/DUT/CPU/dcif/dmemREN
add wave -noupdate /system_tb/DUT/CPU/dcif/dmemWEN
add wave -noupdate /system_tb/DUT/CPU/DP/ruif/dhit
add wave -noupdate /system_tb/DUT/CPU/ccif/dREN
add wave -noupdate /system_tb/DUT/CPU/ccif/dWEN
add wave -noupdate /system_tb/DUT/CPU/dcif/imemaddr
add wave -noupdate /system_tb/DUT/prif/ramaddr
add wave -noupdate /system_tb/DUT/RAM/addr
add wave -noupdate /system_tb/DUT/CPU/dcif/imemload
add wave -noupdate /system_tb/DUT/CPU/dcif/dmemload
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {339221 ps} 0} {{Cursor 2} {424620 ps} 0} {{Cursor 3} {1776765 ps} 0} {{Cursor 4} {256201 ps} 0} {{Cursor 5} {80660 ps} 0} {{Cursor 6} {282289 ps} 0}
quietly wave cursor active 6
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
WaveRestoreZoom {0 ps} {1995 ns}
