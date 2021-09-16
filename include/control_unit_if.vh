`ifndef CONTROL_UNIT_IF_VH
`define CONTROL_UNIT_IF_VH

// types
`include "cpu_types_pkg.vh"

interface control_unit_if;
  // import types
  import cpu_types_pkg::*;

// request unit signals
  // hit and enable
  word_t              imemload, shamt;

  logic               halt, RegDst, WEN, dWEN, dREN, RegWrite, MemtoReg, lui, jal;

  aluop_t             aluop;

  regbits_t           rs, rt, rd;

  logic [1:0]         RegDst, ALUsrc; // ALUsrc - 0->rdat2, 1->shamt, 2->sign, 3->zero

  logic [2:0]         PCsrc; // 1->PC = npc, 2->JR, 3->PC = JumpAddr, 4->PC = BNE, 5->BEQ
  
  logic [15:0]        imm;
  // control unit ports
  modport  cu (
    input   imemload,
    output  shamt, halt, RegDst, WEN, dWEN, dREN, RegWrite, MemtoReg, lui, jal, aluop, rs, rt, rd, RegDst, ALUsrc, PCsrc, imm
  );

  modport  tb (
    output   imemload,
    input  shamt, halt, RegDst, WEN, dWEN, dREN, RegWrite, MemtoReg, lui, jal, aluop, rs, rt, rd, RegDst, ALUsrc, PCsrc, imm
  );

endinterface

`endif //CONTROL_UNIT_IF_VH
