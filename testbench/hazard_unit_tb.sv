/*
  Zhijing Yao
  yao192@purdue.edu

  hazard unit test bench
*/

// interface
`include "system_if.vh"
`include "cache_control_if.vh"
`include "caches_if.vh"
`include "hazard_unit_if.vh"

// types
`include "cpu_types_pkg.vh"
`include "hazard_unit_if.vh"
`include "pipe_types_pkg.vh"


// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns
import cpu_types_pkg::*;
import pipe_types_pkg::*;
module hazard_unit_tb;

  parameter PERIOD = 10;

  logic CLK = 0, nRST;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  hazard_unit_if huif();
  // test program
  test PROG (CLK, nRST);
  // DUT
`ifndef MAPPED
  hazard_unit DUT(huif);
`else
  hazard_unit DUT(
    .\huif.PCsrc (huif.PCsrc),
    .\huif.zero (huif.zero),
    .\huif.rs (huif.rs),
    .\huif.rt (huif.rt),
    .\huif.exmem_rd (huif.exmem_rd),
    .\huif.exmem_rt (huif.exmem_rt),
    .\huif.idex_rd (huif.idex_rd),
    .\huif.idex_rt (huif.idex_rt),
    .\huif.idex_opcode (huif.idex_opcode),
    .\huif.exmem_opcode (huif.exmem_opcode),
    .\huif.exmem_RegWrite (huif.exmem_RegWrite),
    .\huif.idex_RegWrite (huif.idex_RegWrite),
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
    // Test Case 2: BEQ taken
    // *******************************************
    test_case_num += 1;
    test_case = "BEQ taken";
    reset_bus();
    huif.PCsrc = 3'd5;
    huif.zero = 1;
    #(PERIOD * 5)

    // *******************************************
    // Test Case 3: BEQ not taken
    // *******************************************
    test_case_num += 1;
    test_case = "BEQ not taken";
    reset_bus();
    huif.PCsrc = 3'd5;
    huif.zero = 0;
    #(PERIOD * 5)

    // *******************************************
    // Test Case 4: BNE taken
    // *******************************************
    test_case_num += 1;
    test_case = "BNE taken";
    reset_bus();
    huif.PCsrc = 3'd4;
    huif.zero = 0;
    #(PERIOD * 5)

    // *******************************************
    // Test Case 5: BNE not taken
    // *******************************************
    test_case_num += 1;
    test_case = "BNE not taken";
    reset_bus();
    huif.PCsrc = 3'd4;
    huif.zero = 1;
    #(PERIOD * 5)

    // *******************************************
    // Test Case 6: RAW 1 cycle hazard
    // *******************************************
    test_case_num += 1;
    test_case = "RAW R-type 1 cycle hazard";
    reset_bus();
    huif.idex_RegWrite = 1;
    huif.idex_opcode = RTYPE;
    //huif.func = ADD;
    huif.rt = 6;
    huif.rs = 5;
    huif.idex_rd = 6; 
    huif.idex_rt = 5;

    #(PERIOD * 5);
    
        // *******************************************
    // Test Case 7: RAW 2 cycle hazard
    // *******************************************
    test_case_num += 1;
    test_case = "RAW R-type 2 cycle hazard";
    reset_bus();
    huif.exmem_RegWrite = 1;
    huif.exmem_opcode = RTYPE;
    //huif.func = ADD;
    huif.rt = 5;
    huif.rs = 6;
    huif.exmem_rd = 6; 
    huif.exmem_rt = 5;

    #(PERIOD * 5);

// *******************************************
    // Test Case 8: RAW 1 cycle hazard
    // *******************************************
    test_case_num += 1;
    test_case = "RAW I-type 1 cycle hazard";
    reset_bus();
    huif.idex_RegWrite = 1;
    huif.idex_opcode = ADDI;
    //huif.func = ADD;
    huif.rt = 5;
    huif.rs = 6;
    huif.idex_rd = 5; 
    huif.idex_rt = 6;

    #(PERIOD * 5);
    
        // *******************************************
    // Test Case 9: RAW 2 cycle hazard
    // *******************************************
    test_case_num += 1;
    test_case = "RAW I-type 2 cycle hazard";
    reset_bus();
    huif.exmem_RegWrite = 1;
    huif.exmem_opcode = ADDI;
    //huif.func = ADD;
    huif.rs = 6;
    huif.rs = 5;
    huif.exmem_rd = 5; 
    huif.exmem_rt = 6;

    #(PERIOD * 5);

  end

  task reset_bus;
    huif.PCsrc = 0;
    huif.zero = 0;
    huif.PCsrc = '0;
    huif.rs = '0;
    huif.rt = '0;
    huif.exmem_rd = '0;
    huif.idex_rd = '0; 
    huif.idex_opcode = opcode_t'('0);
    huif.exmem_opcode = opcode_t'('0);
    huif.exmem_rt = 0; 
    huif.idex_rt = '0;
    huif.idex_RegWrite = 0;
    huif.exmem_RegWrite = 0;
  endtask

  //$finish
endprogram