
`ifndef IF_ID_IF_VH
`define IF_ID_IF_VH

// types
`include "cpu_types_pkg.vh"
`include "pipe_types_pkg.vh"

interface if_id_if;
  // import types
  import cpu_types_pkg::*;
  import pipe_types_pkg::*;
// request unit signals
  // hit and enable
  word_t              imemload, npc, instr, pc, pcout, PC;

  logic               stall, ihit, flushed;

  // datapath ports
  modport  pipe (
    input   npc, imemload, stall, ihit, flushed, PC,
    output  pc, instr, pcout
  );

endinterface

`endif //PROGRAM_COUNTER_IF_VH
