`ifndef ALU_IF_T_VH
`define ALU_IF_T_VH

`include "cpu_types_pkg.vh"

interface alu_if_t;
  // import types
  import cpu_types_pkg::*;

  logic     flagZero, flagNeg, flagOvf;
  aluop_t op;
  word_t    portA, portB, portOut;

  // alu ports
  modport alu (
    input   portA, portB, op,
    output  flagNeg, flagOvf, flagZero, portOut
  );
  // register file tb
  modport tb (
    output   portA, portB, op,
    input  flagNeg, flagOvf, flagZero, portOut
  );
endinterface

`endif //ALU_IF_VH
