/**
 *  alu_fpga.sv
 * 
 *  Author  : Abhishek Bhaumick
 * 
 */

// interface
`include "alu_if.vh"

module alu_fpga
import cpu_types_pkg::*;
(
  input logic CLOCK_50,
  input logic [3:0] KEY,
  input logic [17:0] SW,
  output logic [17:0] LEDR,
  output logic [7:0] LEDG
);

  word_t regB = 32'h0;
  logic [17:0] ledDisp;

  always_latch begin : setPortB
    if (SW[17] == 1'b1) begin
      regB = {16'h0, SW[16:0]};
    end else begin
      regB = regB;
    end
  end

  // interface
  alu_if_t alu_if();

  // rf
  alu alu_unit(KEY[0], alu_if);

  assign alu_if.portA = {15'h0, SW[16:0]};
  assign alu_if.portB = {15'h0, regB[16:0]};
  assign alu_if.op = aluop_t'(KEY[3:0]);

  assign LEDR[17:0] = alu_if.portOut;

  assign LEDG[0] = alu_if.flagZero;
  assign LEDG[1] = alu_if.flagNeg;
  assign LEDG[2] = alu_if.flagOvf;

  assign LEDG[7:4] = alu_if.op;

endmodule
