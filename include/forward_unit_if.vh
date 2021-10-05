`ifndef FORWARD_UNIT_IF_VH
`define FORWARD_UNIT_IF_VH

// types
`include "cpu_types_pkg.vh"
`include "pipe_types_pkg.vh"
interface forward_unit_if;
  // import types
  import cpu_types_pkg::*;
  import pipe_types_pkg::*;

// request unit signals
  // hit and enable
  logic               exmem_RegWrite, memwb_RegWrite;

  logic [1:0]         forwardA, forwardB;

  word_t              rs, rt, exmem_write, memwb_write;
  // datapath ports
  modport  pipe (
    input   exmem_RegWrite, memwb_RegWrite, rs, rt, exmem_write, memwb_write,
    output  forwardA, forwardB
  );

endinterface

`endif //FORWARD_UNIT_IF_VH
