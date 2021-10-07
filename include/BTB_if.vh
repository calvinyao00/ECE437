`ifndef BTB_IF_VH
`define BTB_IF_VH

// all types
`include "cpu_types_pkg.vh"

interface BTB_if;
  // import types
  import cpu_types_pkg::*;
  
  logic [10:0]lookup_index, branch_index;
  logic     WEN;
  word_t    wdat, branch_target;

  // register file ports
  modport btb (
    input    WEN, lookup_index,branch_index, wdat,
    output  branch_target
  );

endinterface

`endif