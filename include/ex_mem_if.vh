/*
  Zhiyuan Yao
  calvinyaozy@gmail.com

  Excution/Memory pipeline register
*/
`ifndef EX_MEM_IF_VH
`define EX_MEM_IF_VH

// all types
`include "cpu_types_pkg.vh"
`include "pipe_types_pkg.vh"
interface ex_mem_if;
  // import types
  import cpu_types_pkg::*;

  import pipe_types_pkg::*;
  
  logic     ihit, dhit, flushed, stallDmem, stall;//EN, 
  ex_mem_t  ex_mem_in;
  ex_mem_t  ex_mem_out;
  //word_t    dmemstore, dmemREN, dmemREN, dmemaddr, aluOut_in, dmemstore_in, dmemstore_out, aluOut_out, rdat2_in, rdat2_out;

  // EX/MEM reg ports
  modport ex_mem (
    input   ihit, dhit,flushed, ex_mem_in, stall,//EN, 
    output  stallDmem, ex_mem_out
  );
endinterface

`endif //EX_MEM_IF_VH