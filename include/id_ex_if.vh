`ifndef ID_EX_IF_VH
`define ID_EX_IF_VH

// types
`include "cpu_types_pkg.vh"
`include "pipe_types_pkg.vh"
interface id_ex_if;
  // import types
  import cpu_types_pkg::*;
  import pipe_types_pkg::*;
 /*  typedef struct packed {
    word_t SignedExt;
    word_t ZeroExt;
    word_t BrAddr;
    logic [2:0] pcsrc;
    logic [1:0] alusrc;
    word_t npc, pc;
    logic [1:0] RegSrc;
    logic RegDst;
    word_t rdat1;
    word_t rdat2;
    regbits_t rd;
    regbits_t rs;
    regbits_t rt;
    opcode_t opcode;
    aluop_t   aluop;
    funct_t func;
    word_t addr;
    logic halt;
    word_t imm;
    word_t instr;
    logic dREN;
    logic dWEN;
    logic RegWrite;
    logic [4:0] shamt;
  } ie_t; */

// request unit signals
  // hit and enable
  ie_t              in;
  ie_t              out;

  logic               ihit, stall, flushed;

  // datapath ports
  modport  pipe (
    input   in, ihit, stall, flushed,
    output  out
  );

endinterface

`endif //ID_EX_IF_VH
