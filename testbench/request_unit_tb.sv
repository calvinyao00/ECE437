/*
  Zhijing Yao
  yao192@purdue.edu

  memory_control test bench
*/

// interface
`include "system_if.vh"
`include "cache_control_if.vh"
`include "caches_if.vh"
`include "request_unit_if.vh"

// types
`include "cpu_types_pkg.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module request_unit_tb;

  parameter PERIOD = 10;

  logic CLK = 0, nRST;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  request_unit_if ruif();
  // test program
  test PROG (CLK, nRST);
  // DUT
`ifndef MAPPED
  request_unit DUT(CLK, nRST, ruif);
`else
  request_unit DUT(
    .\ruif.ihit (ruif.ihit),
    .\ruif.dhit (ruif.dhit),
    .\ruif.imemREN (ruif.imemREN),
    .\ruif.dmemREN (ruif.dmemREN),
    .\ruif.dmemWEN (ruif.dmemWEN),
    .\ruif.dWEN (ruif.dWEN),
    .\ruif.dREN (ruif.dREN),
    .\ruif.pcEN (ruif.pcEN),
    .\nRST (nRST),
    .\CLK (CLK)
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
    // Test Case 2: ihit
    // *******************************************
    test_case_num += 1;
    test_case = "ihit";
    reset_bus();
    ruif.ihit = 1;
    #(PERIOD * 5)

    // *******************************************
    // Test Case 3: dhit
    // *******************************************
    test_case_num += 1;
    test_case = "dhit";
    reset_bus();
    ruif.dhit = 1;
    #(PERIOD * 5)

    // *******************************************
    // Test Case 4: dhit when dWEN
    // *******************************************
    test_case_num += 1;
    test_case = "dhit when dWEN";
    reset_bus();
    ruif.dhit = 1;
    ruif.dWEN = 1;
    #(PERIOD * 5)

    // *******************************************
    // Test Case 5: dhit when dREN
    // *******************************************
    test_case_num += 1;
    test_case = "dhit when dREN";
    reset_bus();
    ruif.dhit = 1;
    ruif.dREN = 1;
    #(PERIOD * 5);

  end

  task reset_bus;
    ruif.ihit = 0;
    ruif.dhit = 0;
    ruif.dWEN = 0;
    ruif.dREN = 0;
  endtask

  //$finish
endprogram