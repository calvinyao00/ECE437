`ifndef CONTROL_UNIT_IF_VH
`define CONTROL_UNIT_IF_VH

// types
`include "cpu_types_pkg.vh"

interface control_unit_if;
  // import types
  import cpu_types_pkg::*;

// request unit signals
  // hit and enable
  word_t              imm, imemload, addr, SignedExt, ZeroExt, BranchAddr;

  logic               halt, WEN, dWEN, dREN, RegWrite, RegDst, jal, flagZero;

  opcode_t            opcode;

  funct_t             func;

  aluop_t             aluop;

  regbits_t           rs, rt, rd;

  logic [1:0]         RegSrc, ALUsrc; // ALUsrc - 0->rdat2, 1->shamt, 2->sign, 3->zero

  logic [2:0]         PCsrc; // 0->Default, 2->JR, 3->Jump& jal, 4->PC = BNE, 5->BEQ
  
  logic [4:0]         shamt;
  // control unit ports
  modport  cu (
    input   imemload,
    output  RegSrc, flagZero, jal, opcode, func, shamt, addr, SignedExt, ZeroExt, BranchAddr, halt, RegDst, WEN, dWEN, dREN, RegWrite, aluop, rs, rt, rd, ALUsrc, PCsrc, imm
  );

  modport  tb (
    output   imemload,
    input  RegSrc, flagZero, jal, opcode, func, shamt, addr, SignedExt, ZeroExt, BranchAddr, halt, RegDst, WEN, dWEN, dREN, RegWrite, aluop, rs, rt, rd, ALUsrc, PCsrc, imm
  );

endinterface

`endif //CONTROL_UNIT_IF_VH
