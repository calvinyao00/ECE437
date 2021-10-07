/*
  Zhijing Yao
  yao192@purdue.edu

  hazard unit test bench
*/

// interface
`include "system_if.vh"
`include "cache_control_if.vh"
`include "caches_if.vh"
`include "forward_unit_if.vh"

// types
`include "cpu_types_pkg.vh"
//`include "forward_unit_if.vh"
`include "pipe_types_pkg.vh"


// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns
import cpu_types_pkg::*;
import pipe_types_pkg::*;
module forward_unit_tb;

  parameter PERIOD = 10;

  logic CLK = 0, nRST;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  forward_unit_if fuif();
  // test program
  test PROG (CLK, nRST);
  // DUT
`ifndef MAPPED
  forward_unit DUT(fuif);
`else
  forward_unit DUT(
    .\fuif.forwardA (fuif.forwardA),
    .\fuif.forwardB (fuif.forwardB),
    .\fuif.rs (fuif.rs),
    .\fuif.rt (fuif.rt),
    .\fuif.exmem_write (fuif.exmem_write),
    .\fuif.memwb_write (fuif.memwb_write),
    .\fuif.exmem_RegWrite (fuif.exmem_RegWrite),
    .\fuif.memwb_RegWrite (fuif.memwb_RegWrite),
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
    // Test Case 2: forward exmem
    // *******************************************
    test_case_num += 1;
    test_case = "forward exmem";
    reset_bus();
    fuif.exmem_write = 5;
    fuif.rs = 5;
    fuif.exmem_RegWrite = 1;
    #(PERIOD * 5)

    // *******************************************
    // Test Case 3: forward memwb
    // *******************************************
    test_case_num += 1;
    test_case = "forward memwb";
    reset_bus();
    fuif.memwb_write = 6;
    fuif.rt = 6;
    fuif.memwb_RegWrite = 1;
    #(PERIOD * 5)

    // *******************************************
    // Test Case 4: no forward exmem
    // *******************************************
    test_case_num += 1;
    test_case = "forward exmem";
    reset_bus();
    fuif.exmem_write = 5;
    fuif.rs = 5;
    fuif.exmem_RegWrite = 0;
    #(PERIOD * 5)

    // *******************************************
    // Test Case 5: no forward memwb
    // *******************************************
    test_case_num += 1;
    test_case = "forward memwb";
    reset_bus();
    fuif.memwb_write = 10;
    fuif.rs = 10;
    fuif.memwb_RegWrite = 0;
    #(PERIOD * 5);

  end

  task reset_bus;
    fuif.rs = '0;
    fuif.rt = '0;
    fuif.exmem_write = '0;
    fuif.memwb_write = '0;
    fuif.exmem_RegWrite = 0;
    fuif.memwb_RegWrite = 0;
  endtask

  //$finish
endprogram