onerror {resume}
quietly WaveActivateNextPane {} 0
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
add wave -noupdate -divider {if id}
add wave -noupdate -color {Dark Orchid} -itemcolor {Dark Orchid} /system_tb/DUT/CPU/DP0/ifid/imemload
add wave -noupdate -color {Dark Orchid} -itemcolor {Dark Orchid} /system_tb/DUT/CPU/DP0/ifid/npc
add wave -noupdate -color {Dark Orchid} -itemcolor {Dark Orchid} /system_tb/DUT/CPU/DP0/ifid/instr
add wave -noupdate -color {Dark Orchid} -itemcolor {Dark Orchid} /system_tb/DUT/CPU/DP0/ifid/pc
add wave -noupdate -color {Dark Orchid} -itemcolor {Dark Orchid} /system_tb/DUT/CPU/DP0/ifid/pcout
add wave -noupdate -color {Dark Orchid} -itemcolor {Dark Orchid} /system_tb/DUT/CPU/DP0/ifid/PC
add wave -noupdate -color {Dark Orchid} -itemcolor {Dark Orchid} /system_tb/DUT/CPU/DP0/ifid/stall
add wave -noupdate -color {Dark Orchid} -itemcolor {Dark Orchid} /system_tb/DUT/CPU/DP0/ifid/ihit
add wave -noupdate -color {Dark Orchid} -itemcolor {Dark Orchid} /system_tb/DUT/CPU/DP0/ifid/flushed
add wave -noupdate -divider icache
add wave -noupdate /system_tb/DUT/CPU/CM0/ICACHE/ihit
add wave -noupdate /system_tb/DUT/CPU/CM0/ICACHE/cache_hit
add wave -noupdate /system_tb/DUT/CPU/CM0/ICACHE/addr
add wave -noupdate /system_tb/DUT/CPU/CM0/ICACHE/icaches
add wave -noupdate /system_tb/DUT/CPU/CM0/ICACHE/next_icaches
add wave -noupdate -divider {control unit}
add wave -noupdate /system_tb/DUT/RAM/ramif/memstore
add wave -noupdate /system_tb/DUT/CPU/DP0/cuif/imm
add wave -noupdate /system_tb/DUT/CPU/DP0/cuif/imemload
add wave -noupdate /system_tb/DUT/CPU/DP0/cuif/addr
add wave -noupdate /system_tb/DUT/CPU/DP0/cuif/SignedExt
add wave -noupdate /system_tb/DUT/CPU/DP0/cuif/ZeroExt
add wave -noupdate /system_tb/DUT/CPU/DP0/cuif/BranchAddr
add wave -noupdate /system_tb/DUT/CPU/DP0/cuif/halt
add wave -noupdate /system_tb/DUT/CPU/DP0/cuif/WEN
add wave -noupdate /system_tb/DUT/CPU/DP0/cuif/dWEN
add wave -noupdate /system_tb/DUT/CPU/DP0/cuif/dREN
add wave -noupdate /system_tb/DUT/CPU/DP0/cuif/RegWrite
add wave -noupdate /system_tb/DUT/CPU/DP0/cuif/RegDst
add wave -noupdate /system_tb/DUT/CPU/DP0/cuif/jal
add wave -noupdate /system_tb/DUT/CPU/DP0/cuif/flagZero
add wave -noupdate /system_tb/DUT/CPU/DP0/cuif/opcode
add wave -noupdate /system_tb/DUT/CPU/DP0/cuif/func
add wave -noupdate /system_tb/DUT/CPU/DP0/cuif/aluop
add wave -noupdate /system_tb/DUT/CPU/DP0/cuif/rs
add wave -noupdate /system_tb/DUT/CPU/DP0/cuif/rt
add wave -noupdate /system_tb/DUT/CPU/DP0/cuif/rd
add wave -noupdate /system_tb/DUT/CPU/DP0/cuif/RegSrc
add wave -noupdate /system_tb/DUT/CPU/DP0/cuif/ALUsrc
add wave -noupdate /system_tb/DUT/CPU/DP0/cuif/PCsrc
add wave -noupdate /system_tb/DUT/CPU/DP0/cuif/shamt
add wave -noupdate -divider {id ex}
add wave -noupdate -color Cyan -itemcolor Cyan -childformat {{/system_tb/DUT/CPU/DP0/idex/in.rt -radix hexadecimal}} -subitemconfig {/system_tb/DUT/CPU/DP0/idex/in.SignedExt {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP0/idex/in.ZeroExt {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP0/idex/in.BrAddr {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP0/idex/in.pcsrc {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP0/idex/in.alusrc {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP0/idex/in.npc {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP0/idex/in.pc {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP0/idex/in.RegSrc {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP0/idex/in.RegDst {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP0/idex/in.rdat1 {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP0/idex/in.rdat2 {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP0/idex/in.rd {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP0/idex/in.rs {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP0/idex/in.rt {-color Cyan -height 16 -itemcolor Cyan -radix hexadecimal} /system_tb/DUT/CPU/DP0/idex/in.opcode {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP0/idex/in.aluop {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP0/idex/in.func {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP0/idex/in.addr {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP0/idex/in.jal {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP0/idex/in.halt {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP0/idex/in.imm {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP0/idex/in.instr {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP0/idex/in.dREN {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP0/idex/in.dWEN {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP0/idex/in.RegWrite {-color Cyan -height 16 -itemcolor Cyan} /system_tb/DUT/CPU/DP0/idex/in.shamt {-color Cyan -height 16 -itemcolor Cyan}} /system_tb/DUT/CPU/DP0/idex/in
add wave -noupdate -color Cyan -itemcolor Cyan /system_tb/DUT/CPU/DP0/idex/out
add wave -noupdate /system_tb/DUT/CPU/DP0/idex/stall
add wave -noupdate -color Cyan -itemcolor Cyan /system_tb/DUT/CPU/DP0/idex/ihit
add wave -noupdate -color Cyan -itemcolor Cyan /system_tb/DUT/CPU/DP0/idex/stall
add wave -noupdate -color Cyan -itemcolor Cyan /system_tb/DUT/CPU/DP0/idex/flushed
add wave -noupdate -divider ALU
add wave -noupdate /system_tb/DUT/CPU/DP0/aif/op
add wave -noupdate /system_tb/DUT/CPU/DP0/aif/portA
add wave -noupdate /system_tb/DUT/CPU/DP0/aif/portB
add wave -noupdate /system_tb/DUT/CPU/DP0/aif/portOut
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
add wave -noupdate -divider {Register file}
add wave -noupdate /system_tb/DUT/CPU/DP0/rfif/WEN
add wave -noupdate /system_tb/DUT/CPU/DP0/rfif/wsel
add wave -noupdate /system_tb/DUT/CPU/DP0/rfif/rsel1
add wave -noupdate /system_tb/DUT/CPU/DP0/rfif/rsel2
add wave -noupdate /system_tb/DUT/CPU/DP0/rfif/wdat
add wave -noupdate /system_tb/DUT/CPU/DP0/rfif/rdat1
add wave -noupdate /system_tb/DUT/CPU/DP0/rfif/rdat2
add wave -noupdate -divider {ex mem}
add wave -noupdate -color Yellow -itemcolor Yellow /system_tb/DUT/CPU/DP0/exmemif/ihit
add wave -noupdate -color Yellow -itemcolor Yellow /system_tb/DUT/CPU/DP0/exmemif/dhit
add wave -noupdate -color Yellow -itemcolor Yellow /system_tb/DUT/CPU/DP0/exmemif/flushed
add wave -noupdate -color Yellow -itemcolor Yellow /system_tb/DUT/CPU/DP0/exmemif/stallDmem
add wave -noupdate -color Yellow -itemcolor Yellow /system_tb/DUT/CPU/DP0/exmemif/ex_mem_in.pc
add wave -noupdate -color Yellow -itemcolor Yellow /system_tb/DUT/CPU/DP0/exmemif/ex_mem_in
add wave -noupdate -color Yellow -itemcolor Yellow -expand -subitemconfig {/system_tb/DUT/CPU/DP0/exmemif/ex_mem_out.pc {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP0/exmemif/ex_mem_out.aluOut {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP0/exmemif/ex_mem_out.dmemaddr {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP0/exmemif/ex_mem_out.BrAddr {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP0/exmemif/ex_mem_out.imemload {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP0/exmemif/ex_mem_out.dmemstore {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP0/exmemif/ex_mem_out.pcPlusFour {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP0/exmemif/ex_mem_out.rdat1 {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP0/exmemif/ex_mem_out.JumpAddr {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP0/exmemif/ex_mem_out.rd {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP0/exmemif/ex_mem_out.rt {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP0/exmemif/ex_mem_out.rs {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP0/exmemif/ex_mem_out.imm16 {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP0/exmemif/ex_mem_out.jal {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP0/exmemif/ex_mem_out.func {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP0/exmemif/ex_mem_out.shamt {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP0/exmemif/ex_mem_out.RegDst {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP0/exmemif/ex_mem_out.opcode {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP0/exmemif/ex_mem_out.RegWrite {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP0/exmemif/ex_mem_out.RegSrc {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP0/exmemif/ex_mem_out.dWEN {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP0/exmemif/ex_mem_out.dREN {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP0/exmemif/ex_mem_out.halt {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP0/exmemif/ex_mem_out.flagZero {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP0/exmemif/ex_mem_out.npc {-color Yellow -height 16 -itemcolor Yellow} /system_tb/DUT/CPU/DP0/exmemif/ex_mem_out.pcsrc {-color Yellow -height 16 -itemcolor Yellow}} /system_tb/DUT/CPU/DP0/exmemif/ex_mem_out
add wave -noupdate -divider DCACHE0
add wave -noupdate /system_tb/DUT/CPU/CM0/DCACHE/CLK
add wave -noupdate /system_tb/DUT/CPU/CM0/DCACHE/nRST
add wave -noupdate /system_tb/DUT/CPU/CM0/DCACHE/miss
add wave -noupdate /system_tb/DUT/CPU/CM0/DCACHE/recent
add wave -noupdate /system_tb/DUT/CPU/CM0/DCACHE/nxt_recent
add wave -noupdate /system_tb/DUT/CPU/CM0/DCACHE/iteration
add wave -noupdate /system_tb/DUT/CPU/CM0/DCACHE/nxt_iteration
add wave -noupdate /system_tb/DUT/CPU/CM0/DCACHE/itera
add wave -noupdate -expand /system_tb/DUT/CPU/CM0/DCACHE/addr
add wave -noupdate -expand -subitemconfig {{/system_tb/DUT/CPU/CM0/DCACHE/dcaches[1]} -expand {/system_tb/DUT/CPU/CM0/DCACHE/dcaches[1][0]} -expand {/system_tb/DUT/CPU/CM0/DCACHE/dcaches[1][0].data} -expand {/system_tb/DUT/CPU/CM0/DCACHE/dcaches[0]} -expand {/system_tb/DUT/CPU/CM0/DCACHE/dcaches[0][0]} -expand} /system_tb/DUT/CPU/CM0/DCACHE/dcaches
add wave -noupdate /system_tb/DUT/CPU/CM0/DCACHE/nxt_dcaches
add wave -noupdate /system_tb/DUT/CPU/CM0/DCACHE/empty
add wave -noupdate /system_tb/DUT/CPU/CM0/DCACHE/state
add wave -noupdate /system_tb/DUT/CPU/CM0/DCACHE/nxt_state
add wave -noupdate -divider EX_MEM1
add wave -noupdate -color Yellow /system_tb/DUT/CPU/DP1/exmemif/ihit
add wave -noupdate -color Yellow /system_tb/DUT/CPU/DP1/exmemif/dhit
add wave -noupdate -color Yellow /system_tb/DUT/CPU/DP1/exmemif/flushed
add wave -noupdate -color Yellow /system_tb/DUT/CPU/DP1/exmemif/stallDmem
add wave -noupdate -color Yellow /system_tb/DUT/CPU/DP1/exmemif/stall
add wave -noupdate -color Yellow /system_tb/DUT/CPU/DP1/exmemif/ex_mem_in
add wave -noupdate -color Yellow -expand -subitemconfig {/system_tb/DUT/CPU/DP1/exmemif/ex_mem_out.pc {-color Yellow -height 16} /system_tb/DUT/CPU/DP1/exmemif/ex_mem_out.aluOut {-color Yellow -height 16} /system_tb/DUT/CPU/DP1/exmemif/ex_mem_out.dmemaddr {-color Yellow -height 16} /system_tb/DUT/CPU/DP1/exmemif/ex_mem_out.BrAddr {-color Yellow -height 16} /system_tb/DUT/CPU/DP1/exmemif/ex_mem_out.imemload {-color Yellow -height 16} /system_tb/DUT/CPU/DP1/exmemif/ex_mem_out.dmemstore {-color Yellow -height 16} /system_tb/DUT/CPU/DP1/exmemif/ex_mem_out.pcPlusFour {-color Yellow -height 16} /system_tb/DUT/CPU/DP1/exmemif/ex_mem_out.rdat1 {-color Yellow -height 16} /system_tb/DUT/CPU/DP1/exmemif/ex_mem_out.JumpAddr {-color Yellow -height 16} /system_tb/DUT/CPU/DP1/exmemif/ex_mem_out.rd {-color Yellow -height 16} /system_tb/DUT/CPU/DP1/exmemif/ex_mem_out.rt {-color Yellow -height 16} /system_tb/DUT/CPU/DP1/exmemif/ex_mem_out.rs {-color Yellow -height 16} /system_tb/DUT/CPU/DP1/exmemif/ex_mem_out.imm16 {-color Yellow -height 16} /system_tb/DUT/CPU/DP1/exmemif/ex_mem_out.jal {-color Yellow -height 16} /system_tb/DUT/CPU/DP1/exmemif/ex_mem_out.func {-color Yellow -height 16} /system_tb/DUT/CPU/DP1/exmemif/ex_mem_out.shamt {-color Yellow -height 16} /system_tb/DUT/CPU/DP1/exmemif/ex_mem_out.RegDst {-color Yellow -height 16} /system_tb/DUT/CPU/DP1/exmemif/ex_mem_out.opcode {-color Yellow -height 16} /system_tb/DUT/CPU/DP1/exmemif/ex_mem_out.RegWrite {-color Yellow -height 16} /system_tb/DUT/CPU/DP1/exmemif/ex_mem_out.RegSrc {-color Yellow -height 16} /system_tb/DUT/CPU/DP1/exmemif/ex_mem_out.dWEN {-color Yellow -height 16} /system_tb/DUT/CPU/DP1/exmemif/ex_mem_out.dREN {-color Yellow -height 16} /system_tb/DUT/CPU/DP1/exmemif/ex_mem_out.halt {-color Yellow -height 16} /system_tb/DUT/CPU/DP1/exmemif/ex_mem_out.flagZero {-color Yellow -height 16} /system_tb/DUT/CPU/DP1/exmemif/ex_mem_out.npc {-color Yellow -height 16} /system_tb/DUT/CPU/DP1/exmemif/ex_mem_out.pcsrc {-color Yellow -height 16}} /system_tb/DUT/CPU/DP1/exmemif/ex_mem_out
add wave -noupdate -divider DCACHE1
add wave -noupdate /system_tb/DUT/CPU/CM1/DCACHE/state
add wave -noupdate -expand -subitemconfig {{/system_tb/DUT/CPU/CM1/DCACHE/dcaches[1]} -expand {/system_tb/DUT/CPU/CM1/DCACHE/dcaches[1][0]} -expand {/system_tb/DUT/CPU/CM1/DCACHE/dcaches[0]} -expand {/system_tb/DUT/CPU/CM1/DCACHE/dcaches[0][0]} -expand {/system_tb/DUT/CPU/CM1/DCACHE/dcaches[0][0].data} -expand} /system_tb/DUT/CPU/CM1/DCACHE/dcaches
add wave -noupdate /system_tb/DUT/CPU/CM1/DCACHE/recent
add wave -noupdate /system_tb/DUT/CPU/CM1/DCACHE/nxt_recent
add wave -noupdate /system_tb/DUT/CPU/CM1/DCACHE/iteration
add wave -noupdate /system_tb/DUT/CPU/CM1/DCACHE/nxt_iteration
add wave -noupdate /system_tb/DUT/CPU/CM1/DCACHE/itera
add wave -noupdate /system_tb/DUT/CPU/CM1/DCACHE/addr
add wave -noupdate /system_tb/DUT/CPU/CM1/dcif/dmemREN
add wave -noupdate /system_tb/DUT/CPU/CM1/dcif/dmemWEN
add wave -noupdate /system_tb/DUT/CPU/CM1/dcif/dmemload
add wave -noupdate -divider memory_control
add wave -noupdate /system_tb/DUT/CPU/CC/state
add wave -noupdate /system_tb/DUT/CPU/CC/snooper
add wave -noupdate /system_tb/DUT/CPU/CC/dtestbit
add wave -noupdate /system_tb/DUT/CPU/CC/itestbit
add wave -noupdate /system_tb/DUT/CPU/CC/ccif/iwait
add wave -noupdate /system_tb/DUT/CPU/CC/ccif/dwait
add wave -noupdate /system_tb/DUT/CPU/CC/ccif/iREN
add wave -noupdate /system_tb/DUT/CPU/CC/ccif/dREN
add wave -noupdate /system_tb/DUT/CPU/CC/ccif/dWEN
add wave -noupdate /system_tb/DUT/CPU/CC/ccif/iload
add wave -noupdate /system_tb/DUT/CPU/CC/ccif/dload
add wave -noupdate /system_tb/DUT/CPU/CC/ccif/dstore
add wave -noupdate /system_tb/DUT/CPU/CC/ccif/iaddr
add wave -noupdate -expand /system_tb/DUT/CPU/CC/ccif/daddr
add wave -noupdate -expand /system_tb/DUT/CPU/CC/ccif/ccwait
add wave -noupdate /system_tb/DUT/CPU/CC/ccif/ccinv
add wave -noupdate -expand /system_tb/DUT/CPU/CC/ccif/ccwrite
add wave -noupdate -expand /system_tb/DUT/CPU/CC/ccif/cctrans
add wave -noupdate -divider CIF
add wave -noupdate /system_tb/DUT/CPU/CM0/cif/iwait
add wave -noupdate /system_tb/DUT/CPU/CM0/cif/dwait
add wave -noupdate /system_tb/DUT/CPU/CM0/cif/iREN
add wave -noupdate /system_tb/DUT/CPU/CM0/cif/dREN
add wave -noupdate /system_tb/DUT/CPU/CM0/cif/dWEN
add wave -noupdate /system_tb/DUT/CPU/CM0/cif/iload
add wave -noupdate /system_tb/DUT/CPU/CM0/cif/dload
add wave -noupdate /system_tb/DUT/CPU/CM0/cif/dstore
add wave -noupdate /system_tb/DUT/CPU/CM0/cif/iaddr
add wave -noupdate /system_tb/DUT/CPU/CM0/cif/daddr
add wave -noupdate /system_tb/DUT/CPU/CM0/cif/ccwait
add wave -noupdate /system_tb/DUT/CPU/CM0/cif/ccinv
add wave -noupdate /system_tb/DUT/CPU/CC/ccif/ccsnoopaddr
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
add wave -noupdate -divider {Hazard Unit}
add wave -noupdate /system_tb/DUT/CPU/DP0/huif/zero
add wave -noupdate /system_tb/DUT/CPU/DP0/huif/ifid_stall
add wave -noupdate /system_tb/DUT/CPU/DP0/huif/idex_stall
add wave -noupdate /system_tb/DUT/CPU/DP0/huif/exmem_stall
add wave -noupdate /system_tb/DUT/CPU/DP0/huif/memwb_stall
add wave -noupdate /system_tb/DUT/CPU/DP0/huif/exmem_RegWrite
add wave -noupdate /system_tb/DUT/CPU/DP0/huif/idex_RegWrite
add wave -noupdate /system_tb/DUT/CPU/DP0/huif/flushed
add wave -noupdate /system_tb/DUT/CPU/DP0/huif/PCsrc
add wave -noupdate /system_tb/DUT/CPU/DP0/huif/hazard
add wave -noupdate /system_tb/DUT/CPU/DP0/huif/rs
add wave -noupdate /system_tb/DUT/CPU/DP0/huif/rt
add wave -noupdate /system_tb/DUT/CPU/DP0/huif/exmem_rd
add wave -noupdate /system_tb/DUT/CPU/DP0/huif/idex_rd
add wave -noupdate /system_tb/DUT/CPU/DP0/huif/exmem_rt
add wave -noupdate /system_tb/DUT/CPU/DP0/huif/idex_rt
add wave -noupdate /system_tb/DUT/CPU/DP0/REGISTER/regis
add wave -noupdate -divider {Forward Unit}
add wave -noupdate /system_tb/DUT/CPU/DP0/rdat1
add wave -noupdate /system_tb/DUT/CPU/DP0/rdat2
add wave -noupdate /system_tb/DUT/CPU/DP0/fuif/exmem_RegWrite
add wave -noupdate /system_tb/DUT/CPU/DP0/fuif/memwb_RegWrite
add wave -noupdate /system_tb/DUT/CPU/DP0/fuif/forwardA
add wave -noupdate /system_tb/DUT/CPU/DP0/fuif/forwardB
add wave -noupdate /system_tb/DUT/CPU/DP0/fuif/rs
add wave -noupdate /system_tb/DUT/CPU/DP0/fuif/rt
add wave -noupdate /system_tb/DUT/CPU/DP0/fuif/exmem_write
add wave -noupdate /system_tb/DUT/CPU/DP0/fuif/memwb_write
add wave -noupdate -divider halt
add wave -noupdate /system_tb/DUT/CPU/DP0/halt
add wave -noupdate /system_tb/DUT/CPU/DP0/nxt_halt
add wave -noupdate /system_tb/DUT/CPU/DP0/memwbif/mem_wb_out.halt
add wave -noupdate /system_tb/DUT/CPU/CM1/dcif/dmemstore
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3452897 ps} 0}
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
WaveRestoreZoom {3175200 ps} {3931200 ps}
