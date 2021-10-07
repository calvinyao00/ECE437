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
add wave -noupdate -divider BTB
add wave -noupdate /system_tb/DUT/CPU/DP/btbif/lookup_index
add wave -noupdate /system_tb/DUT/CPU/DP/btbif/branch_index
add wave -noupdate /system_tb/DUT/CPU/DP/btbif/WEN
add wave -noupdate /system_tb/DUT/CPU/DP/btbif/wdat
add wave -noupdate /system_tb/DUT/CPU/DP/btbif/branch_target
add wave -noupdate -divider {control unit}
add wave -noupdate /system_tb/DUT/RAM/ramif/memstore
add wave -noupdate /system_tb/DUT/CPU/DP/cuif/imm
add wave -noupdate /system_tb/DUT/CPU/DP/cuif/imemload
add wave -noupdate /system_tb/DUT/CPU/DP/cuif/addr
add wave -noupdate /system_tb/DUT/CPU/DP/cuif/SignedExt
add wave -noupdate /system_tb/DUT/CPU/DP/cuif/ZeroExt
add wave -noupdate /system_tb/DUT/CPU/DP/cuif/BranchAddr
add wave -noupdate /system_tb/DUT/CPU/DP/cuif/halt
add wave -noupdate /system_tb/DUT/CPU/DP/cuif/WEN
add wave -noupdate /system_tb/DUT/CPU/DP/cuif/dWEN
add wave -noupdate /system_tb/DUT/CPU/DP/cuif/dREN
add wave -noupdate /system_tb/DUT/CPU/DP/cuif/RegWrite
add wave -noupdate /system_tb/DUT/CPU/DP/cuif/RegDst
add wave -noupdate /system_tb/DUT/CPU/DP/cuif/jal
add wave -noupdate /system_tb/DUT/CPU/DP/cuif/flagZero
add wave -noupdate /system_tb/DUT/CPU/DP/cuif/opcode
add wave -noupdate /system_tb/DUT/CPU/DP/cuif/func
add wave -noupdate /system_tb/DUT/CPU/DP/cuif/aluop
add wave -noupdate /system_tb/DUT/CPU/DP/cuif/rs
add wave -noupdate /system_tb/DUT/CPU/DP/cuif/rt
add wave -noupdate /system_tb/DUT/CPU/DP/cuif/rd
add wave -noupdate /system_tb/DUT/CPU/DP/cuif/RegSrc
add wave -noupdate /system_tb/DUT/CPU/DP/cuif/ALUsrc
add wave -noupdate /system_tb/DUT/CPU/DP/cuif/PCsrc
add wave -noupdate /system_tb/DUT/CPU/DP/cuif/shamt
add wave -noupdate -divider {id ex}
add wave -noupdate -color Cyan -itemcolor Cyan -childformat {{/system_tb/DUT/CPU/DP/idex/in.rt -radix hexadecimal}} -subitemconfig {/system_tb/DUT/CPU/DP/idex/in.SignedExt {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.ZeroExt {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.BrAddr {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.pcsrc {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.alusrc {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.npc {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.pc {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.RegSrc {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.RegDst {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.rdat1 {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.rdat2 {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.rd {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.rs {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.rt {-color Cyan -height 16 -itemcolor Cyan -radix hexadecimal} /system_tb/DUT/CPU/DP/idex/in.opcode {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.aluop {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.func {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.addr {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.jal {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.halt {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.imm {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.instr {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.dREN {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.dWEN {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.RegWrite {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP/idex/in.shamt {-color Cyan -height 16 -itemcolor Cyan}} /system_tb/DUT/CPU/DP/idex/in
add wave -noupdate -color Cyan -itemcolor Cyan /system_tb/DUT/CPU/DP/idex/out
add wave -noupdate /system_tb/DUT/CPU/DP/idex/stall
add wave -noupdate -color Cyan -itemcolor Cyan /system_tb/DUT/CPU/DP/idex/ihit
add wave -noupdate -color Cyan -itemcolor Cyan /system_tb/DUT/CPU/DP/idex/stall
add wave -noupdate -color Cyan -itemcolor Cyan /system_tb/DUT/CPU/DP/idex/flushed
add wave -noupdate -divider ALU
add wave -noupdate /system_tb/DUT/CPU/DP/aif/op
add wave -noupdate /system_tb/DUT/CPU/DP/aif/portA
add wave -noupdate /system_tb/DUT/CPU/DP/aif/portB
add wave -noupdate /system_tb/DUT/CPU/DP/aif/portOut
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
add wave -noupdate /system_tb/DUT/CPU/DP/rfif/wsel
add wave -noupdate /system_tb/DUT/CPU/DP/rfif/rsel1
add wave -noupdate /system_tb/DUT/CPU/DP/rfif/rsel2
add wave -noupdate /system_tb/DUT/CPU/DP/rfif/wdat
add wave -noupdate /system_tb/DUT/CPU/DP/rfif/rdat1
add wave -noupdate /system_tb/DUT/CPU/DP/rfif/rdat2
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
add wave -noupdate -divider {ex mem}
add wave -noupdate -color Yellow -itemcolor Yellow /system_tb/DUT/CPU/DP/exmemif/EN
add wave -noupdate -color Yellow -itemcolor Yellow /system_tb/DUT/CPU/DP/exmemif/ihit
add wave -noupdate -color Yellow -itemcolor Yellow /system_tb/DUT/CPU/DP/exmemif/dhit
add wave -noupdate -color Yellow -itemcolor Yellow /system_tb/DUT/CPU/DP/exmemif/flushed
add wave -noupdate -color Yellow -itemcolor Yellow /system_tb/DUT/CPU/DP/exmemif/stallDmem
add wave -noupdate -color Yellow -itemcolor Yellow /system_tb/DUT/CPU/DP/exmemif/ex_mem_in.pc
add wave -noupdate -color Yellow -itemcolor Yellow /system_tb/DUT/CPU/DP/exmemif/ex_mem_in
add wave -noupdate -color Yellow -itemcolor Yellow -expand -subitemconfig {/system_tb/DUT/CPU/DP/exmemif/ex_mem_out.newPc {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_out.pc {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_out.aluOut {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_out.dmemaddr {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_out.BrAddr {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_out.imemload {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_out.dmemstore {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_out.pcPlusFour {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_out.rd {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_out.rt {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_out.rs {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_out.imm16 {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_out.jal {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_out.func {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_out.shamt {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_out.RegDst {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_out.opcode {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_out.RegWrite {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_out.RegSrc {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_out.dWEN {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_out.dREN {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_out.halt {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_out.flagZero {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP/exmemif/ex_mem_out.pcsrc {-color Yellow -height 16 -itemcolor Yellow}} /system_tb/DUT/CPU/DP/exmemif/ex_mem_out
add wave -noupdate -divider {mem wb}
add wave -noupdate /system_tb/DUT/CPU/DP/memwbif/EN
add wave -noupdate /system_tb/DUT/CPU/DP/memwbif/stall
add wave -noupdate /system_tb/DUT/CPU/DP/memwbif/flushed
add wave -noupdate /system_tb/DUT/CPU/DP/memwbif/mem_wb_in
add wave -noupdate /system_tb/DUT/CPU/DP/memwbif/mem_wb_out
add wave -noupdate /system_tb/DUT/CPU/DP/rfif/WEN
add wave -noupdate -radix hexadecimal /system_tb/DUT/CPU/DP/rfif/wsel
add wave -noupdate /system_tb/DUT/CPU/DP/rfif/wdat
add wave -noupdate -divider {Hazard Unit}
add wave -noupdate /system_tb/DUT/CPU/DP/huif/zero
add wave -noupdate /system_tb/DUT/CPU/DP/huif/ifid_stall
add wave -noupdate /system_tb/DUT/CPU/DP/huif/idex_stall
add wave -noupdate /system_tb/DUT/CPU/DP/huif/exmem_stall
add wave -noupdate /system_tb/DUT/CPU/DP/huif/memwb_stall
add wave -noupdate /system_tb/DUT/CPU/DP/huif/exmem_RegWrite
add wave -noupdate /system_tb/DUT/CPU/DP/huif/idex_RegWrite
add wave -noupdate /system_tb/DUT/CPU/DP/huif/flushed
add wave -noupdate /system_tb/DUT/CPU/DP/huif/PCsrc
add wave -noupdate /system_tb/DUT/CPU/DP/huif/hazard
add wave -noupdate /system_tb/DUT/CPU/DP/huif/rs
add wave -noupdate /system_tb/DUT/CPU/DP/huif/rt
add wave -noupdate /system_tb/DUT/CPU/DP/huif/exmem_rd
add wave -noupdate /system_tb/DUT/CPU/DP/huif/idex_rd
add wave -noupdate /system_tb/DUT/CPU/DP/huif/exmem_rt
add wave -noupdate /system_tb/DUT/CPU/DP/huif/idex_rt
add wave -noupdate /system_tb/DUT/CPU/DP/REGISTER/regis
add wave -noupdate -divider {Forward Unit}
add wave -noupdate /system_tb/DUT/CPU/DP/rdat1
add wave -noupdate /system_tb/DUT/CPU/DP/rdat2
add wave -noupdate /system_tb/DUT/CPU/DP/fuif/exmem_RegWrite
add wave -noupdate /system_tb/DUT/CPU/DP/fuif/memwb_RegWrite
add wave -noupdate /system_tb/DUT/CPU/DP/fuif/forwardA
add wave -noupdate /system_tb/DUT/CPU/DP/fuif/forwardB
add wave -noupdate /system_tb/DUT/CPU/DP/fuif/rs
add wave -noupdate /system_tb/DUT/CPU/DP/fuif/rt
add wave -noupdate /system_tb/DUT/CPU/DP/fuif/exmem_write
add wave -noupdate /system_tb/DUT/CPU/DP/fuif/memwb_write
add wave -noupdate -divider prif
add wave -noupdate /system_tb/DUT/prif/ramREN
add wave -noupdate /system_tb/DUT/prif/ramWEN
add wave -noupdate /system_tb/DUT/prif/ramaddr
add wave -noupdate /system_tb/DUT/prif/ramstore
add wave -noupdate /system_tb/DUT/prif/ramload
add wave -noupdate /system_tb/DUT/prif/ramstate
add wave -noupdate /system_tb/DUT/prif/memREN
add wave -noupdate /system_tb/DUT/prif/memWEN
add wave -noupdate /system_tb/DUT/prif/memaddr
add wave -noupdate /system_tb/DUT/prif/memstore
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {595397 ps} 0}
quietly wave cursor active 0
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
WaveRestoreZoom {0 ps} {627638 ps}
