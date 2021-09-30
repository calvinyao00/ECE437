onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /system_tb/CLK
add wave -noupdate /system_tb/nRST
add wave -noupdate /system_tb/DUT/CPUCLK
add wave -noupdate -divider PC
add wave -noupdate /system_tb/DUT/CPU/DP/dpif/imemload
add wave -noupdate /system_tb/DUT/CPU/DP/cuit
add wave -noupdate /system_tb/DUT/CPU/DP/curt
add wave -noupdate /system_tb/DUT/CPU/DP/cujt
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
add wave -noupdate /system_tb/DUT/CPU/DP/rfif/rsel1
add wave -noupdate /system_tb/DUT/CPU/DP/rfif/rsel2
add wave -noupdate /system_tb/DUT/CPU/DP/rfif/rdat1
add wave -noupdate -color {Lime Green} /system_tb/DUT/CPU/DP/rfif/rdat2
add wave -noupdate -divider {if id}
add wave -noupdate -color {Dark Orchid} -itemcolor {Dark Orchid} /system_tb/DUT/CPU/DP/ifid/imemload
add wave -noupdate -color {Dark Orchid} -itemcolor {Dark Orchid} /system_tb/DUT/CPU/DP/ifid/npc
add wave -noupdate -color {Dark Orchid} -itemcolor {Dark Orchid} /system_tb/DUT/CPU/DP/ifid/instr
add wave -noupdate -color {Dark Orchid} -itemcolor {Dark Orchid} /system_tb/DUT/CPU/DP/ifid/pc
add wave -noupdate -color {Dark Orchid} -itemcolor {Dark Orchid} /system_tb/DUT/CPU/DP/ifid/pcout
add wave -noupdate -color {Dark Orchid} -itemcolor {Dark Orchid} /system_tb/DUT/CPU/DP/ifid/PC
add wave -noupdate -color {Dark Orchid} -itemcolor {Dark Orchid} /system_tb/DUT/CPU/DP/ifid/stall
add wave -noupdate -color {Dark Orchid} -itemcolor {Dark Orchid} /system_tb/DUT/CPU/DP/ifid/ihit
add wave -noupdate -color {Dark Orchid} -itemcolor {Dark Orchid} /system_tb/DUT/CPU/DP/ifid/flushed
add wave -noupdate -divider {id ex}
add wave -noupdate -color Cyan -itemcolor Cyan -childformat {{/system_tb/DUT/CPU/DP/idex/in.rt -radix hexadecimal}} -subitemconfig {/system_tb/DUT/CPU/DP/idex/in.SignedExt {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.ZeroExt {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.BrAddr {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.pcsrc {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.alusrc {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.npc {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.pc {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.RegSrc {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.RegDst {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.rdat1 {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.rdat2 {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.rd {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.rs {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.rt {-color Cyan -height 16 -itemcolor Cyan -radix hexadecimal} /system_tb/DUT/CPU/DP/idex/in.opcode {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.aluop {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.func {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.addr {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.jal {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.halt {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.imm {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.instr {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.dREN {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.dWEN {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.RegWrite {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.shamt {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.flagZero {-color Cyan -height 16 -itemcolor Cyan}} /system_tb/DUT/CPU/DP/idex/in
add wave -noupdate -color Cyan -itemcolor Cyan /system_tb/DUT/CPU/DP/idex/out
add wave -noupdate -color Cyan -itemcolor Cyan /system_tb/DUT/CPU/DP/idex/ihit
add wave -noupdate -color Cyan -itemcolor Cyan /system_tb/DUT/CPU/DP/idex/stall
add wave -noupdate -color Cyan -itemcolor Cyan /system_tb/DUT/CPU/DP/idex/flushed
add wave -noupdate -divider {ex mem}
add wave -noupdate -color Yellow -itemcolor Yellow /system_tb/DUT/CPU/DP/exmemif/EN
add wave -noupdate -color Yellow -itemcolor Yellow /system_tb/DUT/CPU/DP/exmemif/ihit
add wave -noupdate -color Yellow -itemcolor Yellow /system_tb/DUT/CPU/DP/exmemif/dhit
add wave -noupdate -color Yellow -itemcolor Yellow /system_tb/DUT/CPU/DP/exmemif/flushed
add wave -noupdate -color Yellow -itemcolor Yellow /system_tb/DUT/CPU/DP/exmemif/stallDmem
add wave -noupdate -color Yellow -itemcolor Yellow -subitemconfig {/system_tb/DUT/CPU/DP/exmemif/ex_mem_in.newPc {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_in.pc {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_in.aluOut {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_in.dmemaddr {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_in.BrAddr {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_in.imemload {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_in.dmemstore {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_in.pcPlusFour {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_in.rd {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_in.rt {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_in.rs {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_in.imm16 {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_in.jal {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_in.func {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_in.shamt {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_in.RegDst {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_in.opcode {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_in.RegWrite {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_in.RegSrc {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_in.dWEN {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_in.dREN {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_in.halt {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_in.flagZero {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_in.pcsrc {-color Yellow -height 16 -itemcolor Yellow}} /system_tb/DUT/CPU/DP/exmemif/ex_mem_in
add wave -noupdate -color Yellow -itemcolor Yellow /system_tb/DUT/CPU/DP/exmemif/ex_mem_out
add wave -noupdate -divider {mem wb}
add wave -noupdate /system_tb/DUT/CPU/DP/memwbif/EN
add wave -noupdate /system_tb/DUT/CPU/DP/memwbif/flushed
add wave -noupdate /system_tb/DUT/CPU/DP/memwbif/mem_wb_in
add wave -noupdate /system_tb/DUT/CPU/DP/memwbif/mem_wb_out
add wave -noupdate /system_tb/DUT/CPU/DP/rfif/WEN
add wave -noupdate -radix hexadecimal /system_tb/DUT/CPU/DP/rfif/wsel
add wave -noupdate /system_tb/DUT/CPU/DP/rfif/wdat
add wave -noupdate -divider {Hazard Unit}
add wave -noupdate /system_tb/DUT/CPU/DP/huif/flushed
add wave -noupdate /system_tb/DUT/CPU/DP/huif/zero
add wave -noupdate /system_tb/DUT/CPU/DP/huif/ifid_stall
add wave -noupdate /system_tb/DUT/CPU/DP/huif/idex_stall
add wave -noupdate /system_tb/DUT/CPU/DP/huif/exmem_stall
add wave -noupdate /system_tb/DUT/CPU/DP/huif/memwb_stall
add wave -noupdate /system_tb/DUT/CPU/DP/huif/PCsrc
add wave -noupdate /system_tb/DUT/CPU/DP/huif/hazard
add wave -noupdate /system_tb/DUT/CPU/DP/huif/opcode
add wave -noupdate /system_tb/DUT/CPU/DP/huif/func
add wave -noupdate /system_tb/DUT/CPU/DP/huif/rs
add wave -noupdate /system_tb/DUT/CPU/DP/huif/rt
add wave -noupdate /system_tb/DUT/CPU/DP/huif/exmem_rd
add wave -noupdate /system_tb/DUT/CPU/DP/huif/idex_rd
add wave -noupdate /system_tb/DUT/CPU/DP/huif/exmem_rt
add wave -noupdate /system_tb/DUT/CPU/DP/huif/idex_rt
add wave -noupdate /system_tb/DUT/CPU/DP/REGISTER/regis
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {400000 ps} 0}
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
WaveRestoreZoom {0 ps} {672720 ps}
