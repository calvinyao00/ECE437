
`ifndef PIPE_TYPE_PKG_VH
`define PIPE_TYPE_PKG_VH
`include "cpu_types_pkg.vh"
package pipe_types_pkg;
  import cpu_types_pkg::*;
  typedef struct packed {
    word_t           newPc;
    word_t pc;
    word_t           aluOut;
    word_t           dmemaddr;
    word_t BrAddr;
    //word_t           imemaddr;
    word_t           imemload;
    word_t           dmemstore;
    word_t           pcPlusFour;
    //logic           dMemWrite;
    //logic           dMemRead;
    regbits_t       rd;
    regbits_t       rt;
    regbits_t rs;
    word_t     imm16;
    logic jal;
    funct_t func;
    logic[4:0]      shamt;
    logic           RegDst;
    opcode_t opcode;
    logic           RegWrite;
    logic[1:0]      RegSrc;
    logic           dWEN;
    logic           dREN;
    logic           halt;
    logic           flagZero;
    logic [2:0] pcsrc;
    } ex_mem_t;

    typedef struct packed {
    word_t SignedExt;
    word_t ZeroExt;
    word_t BrAddr;
    logic [2:0] pcsrc;
    logic [1:0] alusrc;
    word_t npc;
    word_t pc;
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
    logic jal;
    logic halt;
    word_t imm;
    word_t instr;
    logic dREN;
    logic dWEN;
    logic RegWrite;
    logic [4:0] shamt;
    logic flagZero;
     } ie_t;

    typedef enum logic [2:0] {
    NO_HAZARD = 3'b000,
    R_EXMEM_NO_DATA = 3'b001,
    R_IDEX_NO_DATA = 3'b010
    } hazard_t;

    typedef struct packed {
    word_t           pcPlusFour;
    opcode_t opcode;
    word_t pc;
    word_t newPc;
    word_t           aluOut;
    word_t           dmemload;
    word_t           imemload;
    word_t           BrAddr;
    //word_t           imemaddr;
    word_t dmemstore;
    regbits_t       rd;
    regbits_t       rt, rs;
    funct_t func;
    word_t     imm16;
    logic           RegDst;
    logic[4:0]      shamt;
    logic jal;
    logic           RegWrite;
    logic[1:0]      RegSrc;
    logic           halt;
    } mem_wb_t;

endpackage
`endif //PIPE_TYPE_PKG_VH
