/*
  Zhijing Yao
  yao192@purdue.edu

  memory_control test bench
*/

// interface
`include "system_if.vh"
`include "cache_control_if.vh"
`include "caches_if.vh"
`include "control_unit_if.vh"

// types
`include "cpu_types_pkg.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module control_unit_tb;

  parameter PERIOD = 10;

  logic CLK = 0, nRST;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  control_unit_if cuif();
  // test program
  test PROG (CLK, nRST);
  // DUT
`ifndef MAPPED
  control_unit DUT(cuif);
`else
  control_unit DUT(
    .\cuif.imemload (cuif.imemload),
    .\cuif.imm (cuif.imm),
    .\cuif.addr (cuif.addr),
    .\cuif.SignedExt (cuif.SignedExt),
    .\cuif.ZeroExt (cuif.ZeroExt),
    .\cuif.BranchAddr (cuif.BranchAddr),
    .\cuif.halt (cuif.halt),
    .\cuif.WEN (cuif.WEN),
    .\cuif.dWEN (cuif.dWEN),
    .\cuif.dREN (cuif.dREN),
    .\cuif.RegWrite (cuif.RegWrite),
    .\cuif.MemtoReg (cuif.MemtoReg),
    .\cuif.lui (cuif.lui),
    .\cuif.opcode (cuif.opcode),
    .\cuif.func (cuif.func),
    .\cuif.aluop (cuif.aluop),
    .\cuif.rs (cuif.rs),
    .\cuif.rt (cuif.rt),
    .\cuif.rd (cuif.rd),
    .\cuif.RegDst (cuif.RegDst),
    .\cuif.ALUsrc (cuif.ALUsrc),
    .\cuif.PCsrc (cuif.PCsrc),
    .\cuif.shamt (cuif.shamt)
  );
`endif

endmodule

program test (input logic CLK, output logic nRST);
  // import word type
  import cpu_types_pkg::word_t;
  parameter PERIOD = 10;
  int test_case_num = 0;
  string test_case;

  initial 
  begin
    // *******************************************
    // Test Case 1: Power-on Reset of the DUT
    // *******************************************
    test_case_num += 1;
    test_case = "Reset dut";
    nRST = 0;
    @(posedge CLK);
    nRST = 1;
    #(PERIOD * 5)
  
    // *******************************************
    // Test Case 2: ori
    // *******************************************
    test_case_num += 1;
    test_case = "check ori";
    reset_bus();
    cuif.imemload = 32'h3401d269;
    #(PERIOD * 5)

    // *******************************************
    // Test Case 3: OR
    // *******************************************
    test_case_num += 1;
    test_case = "check or";
    reset_bus();
    cuif.imemload = 32'h00221825;
    #(PERIOD * 5);

  end

  task reset_bus;
    cuif.imemload = 0;
  endtask

  //$finish
endprogram