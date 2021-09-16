
`ifndef PROGRAM_COUNTER_IF_VH
`define PROGRAM_COUNTER_IF_VH

// types
`include "cpu_types_pkg.vh"

interface program_counter_if;
  // import types
  import cpu_types_pkg::*;

// request unit signals
  // hit and enable
  word_t              npc, newpc, PC;

  logic               pcEN;
  // datapath ports
  modport  pc (
    input   newpc, pcEN,
    output  npc, PC
  );

endinterface

`endif //PROGRAM_COUNTER_IF_VH
