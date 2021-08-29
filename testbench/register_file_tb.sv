/*
  Eric Villasenor
  evillase@gmail.com

  register file test bench
*/

// mapped needs this
`include "register_file_if.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module register_file_tb;

  parameter PERIOD = 10;

  logic CLK = 0, nRST;

  // test vars
  int v1 = 1;
  int v2 = 4721;
  int v3 = 25119;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  register_file_if rfif ();
  // test program
  test #(.PERIOD (PERIOD)) PROG (CLK, v1, v2, v3, nRST);
  // DUT
`ifndef MAPPED
  register_file DUT(CLK, nRST, rfif);
`else
  register_file DUT(
    .\rfif.rdat2 (rfif.rdat2),
    .\rfif.rdat1 (rfif.rdat1),
    .\rfif.wdat (rfif.wdat),
    .\rfif.rsel2 (rfif.rsel2),
    .\rfif.rsel1 (rfif.rsel1),
    .\rfif.wsel (rfif.wsel),
    .\rfif.WEN (rfif.WEN),
    .\nRST (nRST),
    .\CLK (CLK)
  );
`endif

endmodule

program test
(
  input logic CLK, [31:0] v1, [31:0] v2, [31:0] v3,
  output logic nRST
);
parameter PERIOD = 10;
int test_case_num = 0;
string test_case;

initial begin 
  // *******************************************
  // Test Case 1: Power-on Reset of the DUT
  // *******************************************
  test_case_num += 1;
  test_case = "Reset dut";
  reset_dut;

  // *******************************************
  // Test Case 2: Writes v2 to reg1, writes v3 to reg8, and read from reg8
  // *******************************************
  test_case_num += 1;
  test_case = "Writes data into reg";
  interface_bus(1'b1, 5'd1, 5'd1, 5'd2, v2);
  #(PERIOD * 5)
  interface_bus(1'b1, 5'd8, 5'd1, 5'd2, v3);
  #(PERIOD * 5)
  interface_bus(1'b0, 5'd8, 5'd1, 5'd8, v3);
  #(PERIOD * 5)
  // *******************************************
  // Test Case 3: Writes data to reg0
  // *******************************************
  // test writing into reg 0
  test_case_num += 1;
  test_case = "Writes data into reg0";
  interface_bus(1'b1, 5'd0, 5'd1, 5'd8, v3);
  #(PERIOD * 5)
  interface_bus(1'b0, 5'd0, 5'd0, 5'd8, v3);
  #(PERIOD * 5)
  // reset
  nRST = 0;
  #(PERIOD)
  nRST = 1;
end

task reset_dut;
begin
  nRST = 1'b0;
  @(posedge CLK);
  @(negedge CLK);
  nRST = 1'b1;
  @(negedge CLK);
  @(negedge CLK);
end
endtask

task interface_bus;
  input wen;
  input [4:0] wsel, rsel1, rsel2;
  input [31:0] wdat;
begin
  rfif.WEN = wen;
  rfif.wsel = wsel;
  rfif.rsel1 = rsel1;
  rfif.rsel2 = rsel2;
  rfif.wdat = wdat;
end
endtask
  
endprogram
