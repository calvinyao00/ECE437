onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /system_tb/CLK
add wave -noupdate /system_tb/nRST
add wave -noupdate /system_tb/DUT/CPUCLK
add wave -noupdate -divider PC
add wave -noupdate /system_tb/DUT/CPU/DP0/dpif/imemload
add wave -noupdate /system_tb/DUT/CPU/DP0/cuit
add wave -noupdate /system_tb/DUT/CPU/DP0/curt
add wave -noupdate /system_tb/DUT/CPU/DP0/cujt
add wave -noupdate /system_tb/DUT/CPU/DP0/pcif/npc
add wave -noupdate /system_tb/DUT/CPU/DP0/pcif/newpc
add wave -noupdate /system_tb/DUT/CPU/DP0/pcif/PC
add wave -noupdate /system_tb/DUT/CPU/DP0/pcif/pcEN
add wave -noupdate -divider dpif
add wave -noupdate /system_tb/DUT/CPU/DP0/dpif/halt
add wave -noupdate /system_tb/DUT/CPU/DP0/dpif/ihit
add wave -noupdate /system_tb/DUT/CPU/DP0/dpif/imemREN
add wave -noupdate /system_tb/DUT/CPU/DP0/dpif/imemload
add wave -noupdate /system_tb/DUT/CPU/DP0/dpif/imemaddr
add wave -noupdate /system_tb/DUT/CPU/DP0/dpif/dhit
add wave -noupdate /system_tb/DUT/CPU/DP0/dpif/dmemREN
add wave -noupdate /system_tb/DUT/CPU/DP0/dpif/dmemWEN
add wave -noupdate /system_tb/DUT/CPU/DP0/dpif/flushed
add wave -noupdate /system_tb/DUT/CPU/DP0/dpif/dmemload
add wave -noupdate /system_tb/DUT/CPU/DP0/dpif/dmemstore
add wave -noupdate /system_tb/DUT/CPU/DP0/dpif/dmemaddr
add wave -noupdate -divider DCACHE0
add wave -noupdate /system_tb/DUT/CPU/CM0/DCACHE/CLK
add wave -noupdate /system_tb/DUT/CPU/CM0/DCACHE/nRST
add wave -noupdate /system_tb/DUT/CPU/CM0/DCACHE/dhit
add wave -noupdate /system_tb/DUT/CPU/CM0/DCACHE/miss
add wave -noupdate /system_tb/DUT/CPU/CM0/DCACHE/hit
add wave -noupdate /system_tb/DUT/CPU/CM0/DCACHE/recent
add wave -noupdate /system_tb/DUT/CPU/CM0/DCACHE/nxt_recent
add wave -noupdate /system_tb/DUT/CPU/CM0/DCACHE/iteration
add wave -noupdate /system_tb/DUT/CPU/CM0/DCACHE/nxt_iteration
add wave -noupdate /system_tb/DUT/CPU/CM0/DCACHE/itera
add wave -noupdate /system_tb/DUT/CPU/CM0/DCACHE/addr
add wave -noupdate /system_tb/DUT/CPU/CM0/DCACHE/snoopaddr
add wave -noupdate /system_tb/DUT/CPU/CM0/DCACHE/dcaches
add wave -noupdate /system_tb/DUT/CPU/CM0/DCACHE/nxt_dcaches
add wave -noupdate /system_tb/DUT/CPU/CM0/DCACHE/empty
add wave -noupdate /system_tb/DUT/CPU/CM0/DCACHE/state
add wave -noupdate /system_tb/DUT/CPU/CM0/DCACHE/nxt_state
add wave -noupdate -divider DCACHE1
add wave -noupdate /system_tb/DUT/CPU/CM1/DCACHE/CLK
add wave -noupdate /system_tb/DUT/CPU/CM1/DCACHE/nRST
add wave -noupdate /system_tb/DUT/CPU/CM1/DCACHE/dhit
add wave -noupdate /system_tb/DUT/CPU/CM1/DCACHE/miss
add wave -noupdate /system_tb/DUT/CPU/CM1/DCACHE/hit
add wave -noupdate /system_tb/DUT/CPU/CM1/DCACHE/recent
add wave -noupdate /system_tb/DUT/CPU/CM1/DCACHE/nxt_recent
add wave -noupdate /system_tb/DUT/CPU/CM1/DCACHE/iteration
add wave -noupdate /system_tb/DUT/CPU/CM1/DCACHE/nxt_iteration
add wave -noupdate /system_tb/DUT/CPU/CM1/DCACHE/itera
add wave -noupdate /system_tb/DUT/CPU/CM1/DCACHE/addr
add wave -noupdate /system_tb/DUT/CPU/CM1/DCACHE/snoopaddr
add wave -noupdate /system_tb/DUT/CPU/CM1/DCACHE/dcaches
add wave -noupdate /system_tb/DUT/CPU/CM1/DCACHE/nxt_dcaches
add wave -noupdate /system_tb/DUT/CPU/CM1/DCACHE/empty
add wave -noupdate /system_tb/DUT/CPU/CM1/DCACHE/state
add wave -noupdate /system_tb/DUT/CPU/CM1/DCACHE/nxt_state
add wave -noupdate -divider {Memory Control}
add wave -noupdate /system_tb/DUT/CPU/CC/state
add wave -noupdate /system_tb/DUT/CPU/CC/nxt_state
add wave -noupdate /system_tb/DUT/CPU/CC/drequestor
add wave -noupdate /system_tb/DUT/CPU/CC/nxt_drequestor
add wave -noupdate /system_tb/DUT/CPU/CC/irequestor
add wave -noupdate /system_tb/DUT/CPU/CC/nxt_irequestor
add wave -noupdate /system_tb/DUT/CPU/CC/snooper
add wave -noupdate /system_tb/DUT/CPU/CC/nxt_snooper
add wave -noupdate /system_tb/DUT/CPU/CC/dtestbit
add wave -noupdate /system_tb/DUT/CPU/CC/itestbit
add wave -noupdate /system_tb/DUT/CPU/CC/nxt_dtestbit
add wave -noupdate /system_tb/DUT/CPU/CC/nxt_itestbit
add wave -noupdate -divider CIF0
add wave -noupdate /system_tb/DUT/CPU/cif0/iwait
add wave -noupdate /system_tb/DUT/CPU/cif0/dwait
add wave -noupdate /system_tb/DUT/CPU/cif0/iREN
add wave -noupdate /system_tb/DUT/CPU/cif0/dREN
add wave -noupdate /system_tb/DUT/CPU/cif0/dWEN
add wave -noupdate /system_tb/DUT/CPU/cif0/iload
add wave -noupdate /system_tb/DUT/CPU/cif0/dload
add wave -noupdate /system_tb/DUT/CPU/cif0/dstore
add wave -noupdate /system_tb/DUT/CPU/cif0/iaddr
add wave -noupdate /system_tb/DUT/CPU/cif0/daddr
add wave -noupdate /system_tb/DUT/CPU/cif0/ccwait
add wave -noupdate /system_tb/DUT/CPU/cif0/ccinv
add wave -noupdate /system_tb/DUT/CPU/cif0/ccwrite
add wave -noupdate /system_tb/DUT/CPU/cif0/cctrans
add wave -noupdate /system_tb/DUT/CPU/cif0/ccsnoopaddr
add wave -noupdate -divider CIF1
add wave -noupdate /system_tb/DUT/CPU/cif1/iwait
add wave -noupdate /system_tb/DUT/CPU/cif1/dwait
add wave -noupdate /system_tb/DUT/CPU/cif1/iREN
add wave -noupdate /system_tb/DUT/CPU/cif1/dREN
add wave -noupdate /system_tb/DUT/CPU/cif1/dWEN
add wave -noupdate /system_tb/DUT/CPU/cif1/iload
add wave -noupdate /system_tb/DUT/CPU/cif1/dload
add wave -noupdate /system_tb/DUT/CPU/cif1/dstore
add wave -noupdate /system_tb/DUT/CPU/cif1/iaddr
add wave -noupdate /system_tb/DUT/CPU/cif1/daddr
add wave -noupdate /system_tb/DUT/CPU/cif1/ccwait
add wave -noupdate /system_tb/DUT/CPU/cif1/ccinv
add wave -noupdate /system_tb/DUT/CPU/cif1/ccwrite
add wave -noupdate /system_tb/DUT/CPU/cif1/cctrans
add wave -noupdate /system_tb/DUT/CPU/cif1/ccsnoopaddr
add wave -noupdate -divider CCIF
add wave -noupdate /system_tb/DUT/CPU/ccif/iwait
add wave -noupdate /system_tb/DUT/CPU/ccif/dwait
add wave -noupdate /system_tb/DUT/CPU/ccif/iREN
add wave -noupdate /system_tb/DUT/CPU/ccif/dREN
add wave -noupdate /system_tb/DUT/CPU/ccif/dWEN
add wave -noupdate -expand /system_tb/DUT/CPU/ccif/iload
add wave -noupdate -expand /system_tb/DUT/CPU/ccif/dload
add wave -noupdate /system_tb/DUT/CPU/ccif/dstore
add wave -noupdate /system_tb/DUT/CPU/ccif/iaddr
add wave -noupdate /system_tb/DUT/CPU/ccif/daddr
add wave -noupdate /system_tb/DUT/CPU/ccif/ccwait
add wave -noupdate /system_tb/DUT/CPU/ccif/ccinv
add wave -noupdate /system_tb/DUT/CPU/ccif/ccwrite
add wave -noupdate /system_tb/DUT/CPU/ccif/cctrans
add wave -noupdate /system_tb/DUT/CPU/ccif/ccsnoopaddr
add wave -noupdate /system_tb/DUT/CPU/ccif/ramWEN
add wave -noupdate /system_tb/DUT/CPU/ccif/ramREN
add wave -noupdate /system_tb/DUT/CPU/ccif/ramstate
add wave -noupdate /system_tb/DUT/CPU/ccif/ramaddr
add wave -noupdate /system_tb/DUT/CPU/ccif/ramstore
add wave -noupdate /system_tb/DUT/CPU/ccif/ramload
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1208589 ps} 0}
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
WaveRestoreZoom {522500 ps} {1567500 ps}
