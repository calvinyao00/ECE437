`ifndef BPT_IF_VH
`define BPT_IF_VH

// all types
`include "cpu_types_pkg.vh"

interface BPT_if;
  // import types
  import cpu_types_pkg::*;
  
  logic prediction, result;
  logic [10:0]lookup_index, branch_index;
  logic     WEN;

  // register file ports
  modport bpt (
    input   WEN, lookup_index, branch_index, result,
    output  prediction
  );

endinterface

`endif