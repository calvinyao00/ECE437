
// mapped needs this
`include "alu_if.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module alu_tb;

  parameter PERIOD = 10;

  logic CLK = 0, nRST;

  // test vars
  int v1 = 12;
  int v2 = 4231;
  int v3 = 19493;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  alu_if_t alu_if ();
  // test program
  test #(.PERIOD (PERIOD)) PROG (v1, v2, v3, nRST);
  // DUT
`ifndef MAPPED
  alu DUT(nRST, alu_if);
`else
  alu DUT(
    .\alu_if.portA (alu_if.portA),
    .\alu_if.portB (alu_if.portB),
    .\alu_if.portOut (alu_if.portOut),
    .\alu_if.op (alu_if.op),
    .\alu_if.flagNeg (alu_if.flagNeg),
    .\alu_if.flagOvf (alu_if.flagOvf),
    .\alu_if.flagZero (alu_if.flagZero),
    .\nRST (nRST)
  );
`endif

endmodule

program test
import cpu_types_pkg::*;

(
  input logic [31:0] v1, [31:0] v2, [31:0] v3,
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
  // Test Case 2: test add
  // *******************************************
  test_case_num += 1;
  test_case = "Add instruction";
  interface_bus(32'd56, 32'd44, ALU_ADD);
  #(PERIOD * 5)
  // *******************************************
  // Test Case 3: test sub 
  // *******************************************
  test_case_num += 1;
  test_case = "Sub instruction";
  interface_bus(32'd526, 32'd126, ALU_SUB);
  #(PERIOD * 5)
  // *******************************************
  // Test Case 4: test overflow flag
  // *******************************************
  test_case_num += 1;
  test_case = "test overflow flag";
  interface_bus(32'hFFFFFFFF, 32'hAAAAAAAA, ALU_ADD);
  #(PERIOD * 5)
  interface_bus(32'hFFFFFFFF, 32'hFFFAAAAA, ALU_ADD);
  #(PERIOD * 5)
  interface_bus(32'h7FFFFFFF, 32'h7FFAAAAA, ALU_ADD);
  #(PERIOD * 5)
  // *******************************************
  // Test Case 5: test zero flag
  // *******************************************
  test_case_num += 1;
  test_case = "test zero flag";
  interface_bus(32'd126, 32'd126, ALU_SUB);
  #(PERIOD * 5)
  // *******************************************
  // Test Case 6: test neg flag
  // *******************************************
  test_case_num += 1;
  test_case = "test neg flag";
  interface_bus(32'd126, 32'd926, ALU_SUB);
  #(PERIOD * 5)
  // *******************************************
  // Test Case 7: test shift left
  // *******************************************
  test_case_num += 1;
  test_case = "test shift left";
  interface_bus(32'd56, 32'd44, ALU_SLL);
  #(PERIOD * 5)
  // *******************************************
  // Test Case 8: test shift right
  // *******************************************
  test_case_num += 1;
  test_case = "test shift right";
  interface_bus(32'd56, 32'd44, ALU_SRL);
  #(PERIOD * 5)
  // *******************************************
  // Test Case 9: test and
  // *******************************************
  test_case_num += 1;
  test_case = "test and";
  interface_bus(32'd56, 32'd44, ALU_AND);
  #(PERIOD * 5)
  // *******************************************
  // Test Case 10: test or
  // *******************************************
  test_case_num += 1;
  test_case = "test or";
  interface_bus(32'd56, 32'd44, ALU_OR);
  #(PERIOD * 5)
  // *******************************************
  // Test Case 11: test xor
  // *******************************************
  test_case_num += 1;
  test_case = "test xor";
  interface_bus(32'd56, 32'd44, ALU_XOR);
  #(PERIOD * 5)
  // *******************************************
  // Test Case 12: test nor
  // *******************************************
  test_case_num += 1;
  test_case = "test nor";
  interface_bus(32'd56, 32'd44, ALU_NOR);
  #(PERIOD * 5)
  // *******************************************
  // Test Case 13: test slt
  // *******************************************
  test_case_num += 1;
  test_case = "test slt";
  interface_bus(32'hFFFFFFFA, 32'hC, ALU_SLT);
  #(PERIOD * 5)
  // *******************************************
  // Test Case 14: test sltu
  // *******************************************
  test_case_num += 1;
  test_case = "test sltu";
  interface_bus(32'hFFFFFFFA, 32'hC, ALU_SLTU);
  #(PERIOD * 5)
  // reset
  nRST = 0;
  #(PERIOD)
  nRST = 1;
end

task reset_dut;
begin
  nRST = 1'b1;
  #(PERIOD * 5)
  nRST = 1'b0;
end
endtask

task interface_bus;
  input [31:0] portA, portB;
  input aluop_t op;
begin
  alu_if.portA = portA;
  alu_if.portB = portB;
  alu_if.op = op;
end
endtask
  
endprogram
