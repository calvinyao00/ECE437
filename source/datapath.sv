/*
  Eric Villasenor
  evillase@gmail.com

  datapath contains register file, control, hazard,
  muxes, and glue logic for processor
*/

// data path interface
`include "datapath_cache_if.vh"
`include "alu_if.vh"
`include "control_unit_if.vh"
`include "program_counter_if.vh"
`include "register_file_if.vh"
`include "request_unit_if.vh"

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
  request_unit_if ruif();

  alu ALU(nRST, aif);
  control_unit CONTROL(cuif);
  request_unit REQUEST(CLK, nRST, ruif);
  register_file REGISTER(CLK, nRST, rfif);
  program_counter PC(CLK, nRST, pcif);

  word_t JumpAddr;
  logic nxt_halt;

  assign JumpAddr = {pcif.npc[31:28], dpif.imemload[25:0], 2'b00};
  

  // Control Unit DUT
  assign cuif.imemload = dpif.imemload;
  // ALU DUT
  //assign aif.portA = rfif.rdat1;
  assign aif.portA = rfif.rdat1;
  always_comb begin
    casez(cuif.ALUsrc)
      2'd3: aif.portB = cuif.ZeroExt;
      2'd2: aif.portB = cuif.SignedExt;
      2'd1: aif.portB = rfif.rdat2;
      2'd0: aif.portB = rfif.rdat2;
    endcase
  end
  assign aif.op = cuif.aluop;
  // Request Unit DUT
  assign ruif.ihit = dpif.ihit;
  assign ruif.dhit = dpif.dhit;
  assign ruif.dREN = cuif.dREN;
  assign ruif.dWEN = cuif.dWEN;
  assign ruif.halt = cuif.halt;
  // Register File DUT
  always_comb begin 
    if(cuif.MemtoReg) begin
      if(dpif.dhit | dpif.ihit) rfif.WEN = cuif.RegWrite;
      else rfif.WEN = 0;
    end
    else begin
      rfif.WEN = cuif.RegWrite & (dpif.ihit | dpif.dhit);
    end
  end
  assign rfif.wsel = (cuif.RegDst == '0) ? cuif.rd : (cuif.RegDst == 2'b1 ? cuif.rt : 5'd31);
  assign rfif.rsel1 = cuif.rs;
  assign rfif.rsel2 = cuif.rt;
  assign rfif.ihit = dpif.ihit;
  always_comb begin
    if(cuif.lui) rfif.wdat = {cuif.imm[15:0], 16'b0};
    else if(cuif.MemtoReg) rfif.wdat = dpif.dmemload;
    else if(cuif.RegDst == 2'b10) rfif.wdat = pcif.npc;
    else rfif.wdat = aif.portOut;
  end
  // PC DUT
  always_comb begin
    pcif.newpc = pcif.npc;
    casez(cuif.PCsrc) 
      3'd2: begin
        pcif.newpc = rfif.rdat1;
      end
      3'd3: begin
        pcif.newpc = JumpAddr;
      end
      3'd4: begin
        if(~aif.flagZero) pcif.newpc = pcif.npc + cuif.BranchAddr;
        else pcif.newpc = pcif.npc;
      end
      3'd5: begin
        if(aif.flagZero) pcif.newpc = pcif.npc + cuif.BranchAddr;
        else pcif.newpc = pcif.npc;
      end
      3'd0: pcif.newpc = pcif.npc;
    endcase
  end
  assign pcif.pcEN = ruif.pcEN;
  // Datapath DUT
  always_ff @ (posedge CLK, negedge nRST) begin
    if(!nRST) begin
      dpif.halt <= 0;
    end
    else begin
      dpif.halt <= cuif.halt;
    end
  end

  assign dpif.imemREN = ruif.imemREN;
  assign dpif.imemaddr = pcif.PC;
  assign dpif.dmemREN = ruif.dmemREN;
  assign dpif.dmemWEN = ruif.dmemWEN;
  assign dpif.dmemstore = rfif.rdat2;
  assign dpif.dmemaddr = aif.portOut;

  
endmodule
