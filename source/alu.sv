`include "alu_if.vh"

module alu 
import cpu_types_pkg::*;
(
    input logic nRST,
    alu_if_t.alu alu_if
);

logic [35:0] temp;

always_comb begin
    casez(alu_if.op)
        ALU_SLL: temp = alu_if.portB << alu_if.portA[4:0];
        ALU_SRL: temp = alu_if.portB >> alu_if.portA[4:0];
        ALU_ADD: temp = $signed(alu_if.portA) + $signed(alu_if.portB);
        ALU_SUB: temp = $signed(alu_if.portA) - $signed(alu_if.portB);
        ALU_AND: temp = alu_if.portA & alu_if.portB;
        ALU_OR:  temp = alu_if.portA | alu_if.portB;
        ALU_XOR: temp = alu_if.portA ^ alu_if.portB;
        ALU_NOR: temp = ~(alu_if.portA | alu_if.portB);
        ALU_SLT: temp = ($signed(alu_if.portA) < $signed(alu_if.portB)) ? 32'b1 : 32'b0;
        ALU_SLTU: temp = (alu_if.portA < alu_if.portB) ? 32'b1 : 32'b0;
    endcase
end

assign alu_if.portOut = temp[31:0];
assign alu_if.flagOvf = temp[32] ^ temp[31];
assign alu_if.flagZero = ~|temp[31:0];
assign alu_if.flagNeg = temp[31];

endmodule
