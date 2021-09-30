`ifndef HAZARD_UNIT_IF_VH
`define HAZARD_UNIT_IF_VH

// types
`include "cpu_types_pkg.vh"
`include "pipe_types_pkg.vh"

interface hazard_unit_if;
  // import types
  import cpu_types_pkg::*;
  import pipe_types_pkg::*;
// request unit signals
  // hit and enable
  logic               zero, ifid_stall, idex_stall, exmem_stall, memwb_stall, exmem_RegWrite, idex_RegWrite, halt;
  logic       flushed,ifid_flushed, idex_flushed, exmem_flushed, memwb_flushed; 

  logic [2:0] PCsrc;

  hazard_t   hazard;

  opcode_t   idex_opcode, exmem_opcode;

  funct_t    func;

  regbits_t  rs, rt, exmem_rd, idex_rd, exmem_rt, idex_rt;

  // datapath ports
  modport  pipe (
    input   zero, PCsrc, rs, rt, exmem_rd, idex_rd, idex_opcode, exmem_opcode, func, exmem_rt, idex_rt, exmem_RegWrite, idex_RegWrite,// halt,
    output  flushed, hazard, ifid_stall, idex_stall, exmem_stall, memwb_stall
  );

endinterface

`endif //HAZARD_UNIT_IF_VH
