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
  logic               flushed, zero;

  logic [2:0] PCsrc;

  // datapath ports
  modport  pipe (
    input   zero, PCsrc,
    output  flushed
  );

endinterface

`endif //HAZARD_UNIT_IF_VH
