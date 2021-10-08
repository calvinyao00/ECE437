/*
  Eric Villasenor
  evillase@gmail.com

  datapath contains register file, control, hazard,
  muxes, and glue logic for processor
*/

// data path interface
`include "datapath_cache_if.vh"
`include "alu_if.vh"
`include "if_id_if.vh"
`include "id_ex_if.vh"
`include "ex_mem_if.vh"
`include "mem_wb_if.vh"
`include "control_unit_if.vh"
`include "program_counter_if.vh"
`include "register_file_if.vh"
`include "hazard_unit_if.vh"
`include "forward_unit_if.vh"
`include "BTB_if.vh"
`include "BPT_if.vh"
// alu op, mips op, and instruction type
`include "cpu_types_pkg.vh"

module datapath (
  input logic CLK, nRST,
  datapath_cache_if.dp dpif
);
  // import types
  import cpu_types_pkg::*;

  // pc init
  parameter PC_INIT = 0;

  alu_if_t aif();
  control_unit_if cuif();
  program_counter_if pcif();
  register_file_if rfif();
  if_id_if ifid();
  id_ex_if idex();
  ex_mem_if exmemif();
  mem_wb_if memwbif();
  hazard_unit_if huif();
  forward_unit_if fuif();
  BTB_if btbif();
  BPT_if bptif();
  alu ALU(nRST, aif);
  control_unit CONTROL(cuif);
  register_file REGISTER(CLK, nRST, rfif);
  program_counter PC(CLK, nRST, pcif);
  if_id II(CLK, nRST, ifid);
  id_ex IE(CLK, nRST, idex);
  ex_mem EXMEM(CLK, nRST, exmemif);
  mem_wb MEMWB(CLK, nRST, memwbif);
  hazard_unit HAZARD(huif);
  forward_unit FORWARD(fuif);
  BTB btb(CLK, nRST, btbif);
  BPT bpt(CLK, nRST, bptif);  
  word_t JumpAddr;
  logic halt, nxt_halt;
  word_t  newPc;
  word_t rdat1, rdat2;
  word_t exmem_forward;
  i_t cuit;
  r_t curt;
  j_t cujt;
  logic branch_taken;
  opcode_t opcode;
  assign cuit = i_t'(ifid.instr);
  assign cujt = j_t'(ifid.instr);
  assign curt = r_t'(ifid.instr);
  assign opcode = opcode_t'(dpif.imemload[31:26]);
  //assign npc = PC + 4;

  assign JumpAddr = {idex.out.npc[31:28], idex.out.instr[25:0], 2'b00};
  assign btbif.WEN = (cuif.opcode == BNE | cuif.opcode == BEQ);
  assign btbif.branch_index = ifid.PC[12:2];
  assign btbif.wdat = cuif.BranchAddr;
  assign btbif.lookup_index = pcif.PC[12:2];


  // IF/ID latch
  assign ifid.PC = pcif.PC; //// PC
  assign ifid.npc = pcif.npc;
  assign ifid.imemload = dpif.imemload;
  assign ifid.ihit = dpif.ihit;
  assign ifid.flushed = huif.flushed;
  assign ifid.stall = huif.ifid_stall;

  assign bptif.WEN = (exmemif.ex_mem_out.opcode == BNE | exmemif.ex_mem_out.opcode == BEQ);
  assign bptif.branch_index = exmemif.ex_mem_out.pc[12:2];
  assign bptif.result = 0;
  assign bptif.lookup_index = pcif.PC[12:2];
  // ID/EX latch
  assign idex.ihit = dpif.ihit;
  assign idex.in.SignedExt = cuif.SignedExt;
  assign idex.in.ZeroExt = cuif.ZeroExt;
  assign idex.in.BrAddr = cuif.BranchAddr;
  assign idex.in.pcsrc = cuif.PCsrc;
  assign idex.in.pc = ifid.pcout;
  assign idex.in.alusrc = cuif.ALUsrc;
  assign idex.in.RegSrc = cuif.RegSrc;
  assign idex.in.npc = ifid.pc;
  assign idex.in.RegDst = cuif.RegDst;
  assign idex.in.rdat1 = rfif.rdat1;
  assign idex.in.rdat2 = rfif.rdat2;
  assign idex.in.rd = cuif.rd;
  assign idex.in.rs = cuif.rs;
  assign idex.in.rt = cuif.rt;
  assign idex.in.jal = cuif.jal;
  assign idex.in.aluop = cuif.aluop;
  assign idex.in.func = cuif.func;
  assign idex.in.addr = cuif.addr;
  assign idex.in.halt = cuif.halt;
  //assign idex.in.flagZero Error (10161): Verilog HDL error at BPT.sv(28): object "btbif" is not declared File: /home/ecegrid/a/mg215/ece437/processors/source/BPT.sv Line:= cuif.flagZero;
  assign idex.in.imm = cuif.imm;
  assign idex.in.instr = ifid.instr;
  assign idex.in.opcode = cuif.opcode;
  assign idex.in.dREN = cuif.dREN;
  assign idex.in.dWEN = cuif.dWEN;
  assign idex.in.RegWrite = cuif.RegWrite;
  assign idex.flushed = huif.flushed;  /////////
  assign idex.stall = huif.idex_stall;
  assign idex.in.shamt = cuif.shamt;
  // EX/MEM latch
  assign exmemif.dhit = dpif.dhit;
  assign exmemif.ihit = dpif.ihit;
  //assign exmemif.ex_mem_in.newPc = newPc;
  assign exmemif.ex_mem_in.pc = idex.out.pc;
  assign exmemif.ex_mem_in.aluOut = aif.portOut;
  assign exmemif.ex_mem_in.dmemaddr = aif.portOut;
  //assign exmemif.ex_mem_in.imemaddr = aif.portOut;
  //assign exmemif.ex_mem_in.dmemstore = rfif.rdat2;
  assign exmemif.ex_mem_in.dmemstore = rdat2; /////
  assign exmemif.ex_mem_in.BrAddr = idex.out.BrAddr;
  assign exmemif.ex_mem_in.func = idex.out.func;
  assign exmemif.ex_mem_in.dWEN = idex.out.dWEN;
  assign exmemif.ex_mem_in.dREN = idex.out.dREN;
  assign exmemif.ex_mem_in.halt = idex.out.halt;
  assign exmemif.ex_mem_in.pcsrc = idex.out.pcsrc;
  assign exmemif.ex_mem_in.jal = idex.out.jal;
  assign exmemif.ex_mem_in.flagZero = aif.flagZero;
  assign exmemif.ex_mem_in.opcode = idex.out.opcode;
  assign exmemif.ex_mem_in.pcPlusFour = idex.out.npc;
  assign exmemif.ex_mem_in.RegWrite = idex.out.RegWrite;
  assign exmemif.ex_mem_in.RegSrc = idex.out.RegSrc;
  assign exmemif.ex_mem_in.imemload = idex.out.instr;
  assign exmemif.ex_mem_in.npc = pcif.npc;
  assign exmemif.ex_mem_in.RegDst = idex.out.RegDst;
  assign exmemif.ex_mem_in.rd = idex.out.rd;
  assign exmemif.ex_mem_in.rt = idex.out.rt;
  assign exmemif.ex_mem_in.rs = idex.out.rs;
  assign exmemif.ex_mem_in.imm16 = idex.out.imm;
  assign exmemif.ex_mem_in.shamt = idex.out.shamt;
  assign exmemif.ex_mem_in.rdat1 = idex.out.rdat1;
  //assign exmemif.ex_mem_in.BranchAddr = idex.out.BranchAddr;
  assign exmemif.ex_mem_in.JumpAddr = JumpAddr;
  
  assign exmemif.stall = huif.exmem_stall;//|| (~dpif.ihit);
  assign exmemif.flushed = huif.flushed;
  // MEM/WB latch
  assign memwbif.mem_wb_in.RegDst = exmemif.ex_mem_out.RegDst;
  assign memwbif.mem_wb_in.RegWrite = exmemif.ex_mem_out.RegWrite;
  assign memwbif.mem_wb_in.RegSrc = exmemif.ex_mem_out.RegSrc;
  assign memwbif.mem_wb_in.halt = exmemif.ex_mem_out.halt;
  assign memwbif.mem_wb_in.jal = exmemif.ex_mem_out.jal;
  assign memwbif.mem_wb_in.func = exmemif.ex_mem_out.func;
  assign memwbif.mem_wb_in.opcode = exmemif.ex_mem_out.opcode;
  assign memwbif.mem_wb_in.pc = exmemif.ex_mem_out.pc;
  assign memwbif.mem_wb_in.newPc = newPc;
  assign memwbif.mem_wb_in.BrAddr = exmemif.ex_mem_out.BrAddr;
  assign memwbif.mem_wb_in.dmemstore = exmemif.ex_mem_out.dmemstore;
  assign memwbif.mem_wb_in.pcPlusFour = exmemif.ex_mem_out.pcPlusFour;
  assign memwbif.mem_wb_in.aluOut = exmemif.ex_mem_out.aluOut;
  assign memwbif.mem_wb_in.dmemload = dpif.dmemload;
  assign memwbif.mem_wb_in.imemload = exmemif.ex_mem_out.imemload;
  assign memwbif.mem_wb_in.rd = exmemif.ex_mem_out.rd;
  assign memwbif.mem_wb_in.rt = exmemif.ex_mem_out.rt;
  assign memwbif.mem_wb_in.rs = exmemif.ex_mem_out.rs;
  assign memwbif.mem_wb_in.pcsrc = exmemif.ex_mem_out.pcsrc;
  assign memwbif.mem_wb_in.imm16 = exmemif.ex_mem_out.imm16;
  assign memwbif.EN = 1;//dpif.dhit;
  assign memwbif.flushed = 0;
  assign memwbif.stall = huif.memwb_stall ;//|| (~dpif.ihit);
  assign memwbif.mem_wb_in.shamt = exmemif.ex_mem_out.shamt;
  // HAZARD UNIT
  assign huif.PCsrc = exmemif.ex_mem_out.pcsrc;
  assign huif.zero = exmemif.ex_mem_out.flagZero;
  assign huif.rs = cuif.rs;
  assign huif.rt = cuif.rt;
  assign huif.exmem_rd = exmemif.ex_mem_out.rd;
  assign huif.idex_rd = idex.out.rd;
  assign huif.exmem_rt = exmemif.ex_mem_out.rt;
  assign huif.idex_rt = idex.out.rt;
  assign huif.idex_opcode = idex.out.opcode;
  assign huif.exmem_opcode = exmemif.ex_mem_out.opcode;
  assign huif.dhit = dpif.dhit;
  //assign huif.func = cuif.func;
  assign huif.exmem_RegWrite = exmemif.ex_mem_out.RegWrite;
  assign huif.idex_RegWrite = idex.out.RegWrite;
  assign huif.exmem_write = fuif.exmem_write;
  // FORWARD UNIT
  assign fuif.rs = idex.out.rs;
  assign fuif.rt = idex.out.rt;
  assign fuif.exmem_RegWrite = exmemif.ex_mem_out.RegWrite;
  assign fuif.memwb_RegWrite = memwbif.mem_wb_out.RegWrite;
  assign fuif.exmem_write = (exmemif.ex_mem_out.RegDst) ? exmemif.ex_mem_out.rt : (exmemif.ex_mem_out.pcsrc == 3'd3) ? 5'b11111 : exmemif.ex_mem_out.rd;
  assign fuif.memwb_write = (memwbif.mem_wb_out.RegDst) ? memwbif.mem_wb_out.rt : (memwbif.mem_wb_out.pcsrc == 3'd3) ? 5'b11111 : memwbif.mem_wb_out.rd;
  // decide exmem output
  always_comb begin
    exmem_forward = 0;
    casez(exmemif.ex_mem_out.RegSrc) 
      2'b00:exmem_forward = exmemif.ex_mem_out.aluOut;
      2'b01:exmem_forward = {exmemif.ex_mem_out.imm16, 16'b0};
      2'b10:exmem_forward = memwbif.mem_wb_in.dmemload;
      2'b11:exmem_forward = exmemif.ex_mem_out.pcPlusFour;
    endcase
  end
//Datapath glue logic
  //instruction fetch
  assign dpif.imemREN = 1;
  //assign dpif.imemaddr = exmemif.ex_mem_out.newPc; 
  //////////////////assign dpif.imemaddr = pcif.newpc; 
  assign dpif.imemaddr = pcif.PC; 

  // Control Unit & instruction decode stage
  assign cuif.imemload = ifid.instr;
  assign rfif.rsel1 = cuif.rs;
  assign rfif.rsel2 = cuif.rt;
  // ALU Excution
  //decide rdat
/*   always_comb begin
    casez(fuif.forwardA)
      2'b01: rdat1 = exmem_forward;
      2'b10: rdat1 = rfif.wdat;
      default: rdat1 = idex.out.rdat1; /////
    endcase
  end
  always_comb begin
    casez(fuif.forwardB)
      2'b01: rdat2 = exmem_forward;
      2'b10: rdat2 = rfif.wdat;
      default: rdat2 = idex.out.rdat2; /////
    endcase
  end */
  assign rdat1 = (fuif.forwardA == 2'b01) ? exmem_forward : (fuif.forwardA == 2'b10) ? rfif.wdat : idex.out.rdat1;
  assign rdat2 = (fuif.forwardB == 2'b01) ? exmem_forward : (fuif.forwardB == 2'b10) ? rfif.wdat : idex.out.rdat2;
  //assign aif.portA = rfif.rdat1;
  assign aif.portA = rdat1; ////
  always_comb begin
    casez(idex.out.alusrc)
      2'd3: aif.portB = idex.out.ZeroExt;
      2'd2: aif.portB = idex.out.SignedExt;
      2'd1: aif.portB = rdat2; /////
      2'd0: aif.portB = rdat2;  /////
    endcase
  end
  assign aif.op = idex.out.aluop;
  //Memory Read/Write stagsim:/system_tb/DUT/CPU/DP/dpif/imemload
  assign dpif.dmemREN = exmemif.ex_mem_out.dREN;
  assign dpif.dmemWEN = exmemif.ex_mem_out.dWEN;
  assign dpif.dmemstore = exmemif.ex_mem_out.dmemstore;
  assign dpif.dmemaddr = exmemif.ex_mem_out.dmemaddr;

  // Register File DUT
  always_comb begin 
    rfif.WEN = memwbif.mem_wb_out.RegWrite;
    rfif.wsel =  memwbif.mem_wb_out.jal ? regbits_t'(5'd31) : (memwbif.mem_wb_out.RegDst ? memwbif.mem_wb_out.rt: memwbif.mem_wb_out.rd);
    casez(memwbif.mem_wb_out.RegSrc) 
      2'b00:rfif.wdat = memwbif.mem_wb_out.aluOut;
      2'b01:rfif.wdat = {memwbif.mem_wb_out.imm16, 16'b0};
      2'b10:rfif.wdat = memwbif.mem_wb_out.dmemload;
      2'b11:rfif.wdat = memwbif.mem_wb_out.pcPlusFour;
    endcase
  end
/*   always_comb begin
    if(cuif.RegSrc == 2'b1) rfif.wdat = {cuif.imm[15:0], 16'b0};
    else if(cuif.RegSrc == 2'b10) rfif.wdat = dpif.dmemload; // memtoreg
    else if(cuif.RegSrc == 2'b11) rfif.wdat = pcif.npc;
    else rfif.wdat = aif.portOut;
  end
  assign rfif.wsel = (cuif.RegDst == 0) ? cuif.rd : cuif.rt; */
 

  // PC DUT
  /*always_comb begin
  if (opcode == BNE || opcode == BEQ) begin
    pcif.newpc
  end
  pcif.newpc = exmemif.ex_mem_out.pcsrc  == 0 ? pcif.npc : exmemif.ex_mem_out.newPc;
  end*/
  assign pcif.newpc = exmemif.ex_mem_out.pcsrc  == 0 ? pcif.npc : newPc;
  
  assign pcif.pcEN = (dpif.ihit & !huif.ifid_stall) || (exmemif.ex_mem_out.pcsrc != '0);
  //Resolving branches ang jumps in EX stage, updating PC in  stage
  always_comb begin
    newPc = exmemif.ex_mem_out.npc; // pc+4
    branch_taken = 1;
    casez(exmemif.ex_mem_out.pcsrc) 
      //3'd0: newPc = pcif.npc;
      3'd2: begin
        newPc = exmemif.ex_mem_out.rdat1;
      end
      3'd3: begin
        newPc = exmemif.ex_mem_out.JumpAddr;
      end
      3'd4: begin
        if(~exmemif.ex_mem_out.flagZero) newPc = exmemif.ex_mem_out.pcPlusFour + exmemif.ex_mem_out.BrAddr;
        //else newPc = idex.out.npc;
        else begin
          branch_taken = 0;
          newPc =  exmemif.ex_mem_out.npc;
        end
      end
      3'd5: begin
        if(exmemif.ex_mem_out.flagZero) newPc = exmemif.ex_mem_out.pcPlusFour + exmemif.ex_mem_out.BrAddr;
        //else newPc = idex.out.npc;
        else begin
          branch_taken = 0;
          newPc =  exmemif.ex_mem_out.npc;
        end
      end
    endcase
  end 

  always_ff @ (negedge nRST, posedge CLK) begin
    if(!nRST) halt <= 0;
    else halt <= nxt_halt;//memwbif.mem_wb_out.halt | halt;
  end
  always_comb begin
    nxt_halt = memwbif.mem_wb_out.halt | halt;
  end

  assign dpif.halt = halt;
endmodule
