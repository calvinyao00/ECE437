/*
  Zhiyuan Yao
  calvinyaozy@gmail.com

  Memory/Write back pipeline register interface
*/
`ifndef MEM_WB_IF_VH
`define MEM_WB_IF_VH

// all types
`include "cpu_types_pkg.vh"
`include "pipe_types_pkg.vh"
interface mem_wb_if;
  // import types
  import cpu_types_pkg::*;
  
  import pipe_types_pkg::*;
/*   typedef struct packed {
    word_t           pcPlusFour, pc, newPc;
    word_t           aluOut;
    word_t           dmemload;
    word_t           BrAddr;
    word_t           imemaddr, dmemstore;
    regbits_t       rd;
    regbits_t       rt, rs;
    funct_t func;
    word_t     imm16;
    logic           RegDst;
    logic[4:0]      shamt;
    logic           RegWrite;
    logic[1:0]      RegSrc;
    logic           halt;
} mem_wb_t; */
  logic     EN, flushed, stall;
  mem_wb_t  mem_wb_in;
  mem_wb_t  mem_wb_out;
  

  // EX/MEM reg ports
  modport mem_wb (
    input   EN, mem_wb_in,flushed, stall,
    output  mem_wb_out
  );

endinterface

`endif //MEM_WRIF_VH