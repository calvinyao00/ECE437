`include "control_unit_if.vh"

module control_unit
import cpu_types_pkg::*;
(
    input logic clk,
    input logic nRST
    control_unit_if.cu cuif
);

opcode_t opcode;
assign opcode = opcode_t'(cuif.imemload[31:26]);
funct_t func;
assign func = funct_t'(cuif.imemload[5:0]);

always_comb begin
    cuif.halt = 0;
    cuif.aluop = ALU_SLL;
    cuif.ALUsrc = '0;
    cuif.dWEN = 0;
    cuif.dREN = 0;
    cuif.RegDst = 0; // branch
    cuif.rs = '0;
    cuif.rt = '0;
    cuif.rd = '0;
    cuif.imm = '0;
    cuif.shamt = '0;
    cuif.addr = '0;
    cuif.ALUsrc = '0;
    cuif.PCsrc = '0;
    cuif.RegWrite = 0;
    cuif.MemtoReg = 0;
    cuif.lui = 0;
    cuif.jal = 0;

    if(opcode == RTYPE) begin
        cuif.rs = cuif.imemload[25:21];
        cuif.rt = cuif.imemload[20:16];
        cuif.rd = cuif.imemload[15:11];
        cuif.shamt = {'0, cuif.imemload[10:6]};
        casez(func) begin
            SLLV: begin
                cuif.aluop = ALU_SLL;
                cuif.ALUsrc = 2'b1;
                cuif.RegWrite = 1;
            end
            SRLV: begin
                cuif.aluop = ALU_SRL;
                cuif.ALUsrc = 2'b1;
                cuif.RegWrite = 1;
            end
            JR: begin
                PCsrc = 2'b10; // JR
            end
            ADD: begin
                cuif.aluop = ALU_ADD;
                cuif.RegWrite = 1;
            end
            ADDU: begin
                cuif.aluop = ALU_ADD;
                cuif.RegWrite = 1;
            end
            SUB: begin
                cuif.aluop = ALU_SUB;
                cuif.RegWrite = 1;
            end
            SUBU: begin
                cuif.aluop = ALU_SUB;
                cuif.RegWrite = 1;
            end
            AND: begin
                cuif.aluop = ALU_AND;
                cuif.RegWrite = 1;
            end
            OR: begin
                cuif.aluop = ALU_OR;
                cuif.RegWrite = 1;
            end
            XOR: begin
                cuif.aluop = ALU_XOR;
                cuif.RegWrite = 1;
            end
            NOR: begin
                cuif.aluop = ALU_NOR;
                cuif.RegWrite = 1;
            end
            SLT: begin
                cuif.aluop = ALU_SLT;
                cuif.RegWrite = 1;
            end
            SLTU: begin
                cuif.aluop = ALU_SLTU;
                cuif.RegWrite = 1;
            end
        end
    end
    else if ((opcode != J) && (opcode != JAL)) begin
        // i type
        cuif.RegDst = 2'b1; // decide wsel
        cuif.rs = cuif.imemload[25:21];
        cuif.rt = cuif.imemload[20:16];
        cuif.imm = cuif.imemload[15:0];
        casez(opcode) begin
            BEQ: begin
                cuif.PCsrc = 3'd5; 
                cuif.aluop = ALU_SUB;
            end
            BNE: begin
                cuif.PCsrc = 3'd4;
                cuif.aluop = ALU_SUB;
            end
            ADDI: begin
                cuif.ALUsrc = 2'd2;
                cuif.RegWrite = 1;
                cuif.aluop = ALU_ADD;
            end
            ADDIU: begin
                cuif.ALUsrc = 2'd2;
                cuif.RegWrite = 1;
                cuif.aluop = ALU_ADD;
            end
            SLTI: begin
                cuif.ALUsrc = 2'd2;
                cuif.RegWrite = 1;
                cuif.aluop = ALU_SLT;
            end
            SLTIU: begin
                cuif.ALUsrc = 2'd2;
                cuif.RegWrite = 1;
                cuif.aluop = ALU_SLT;
            end
            ANDI: begin
                cuif.ALUsrc = 2'd3;
                cuif.RegWrite = 1;
                cuif.aluop = ALU_AND;
            end
            ORI: begin
                cuif.ALUsrc = 2'd3;
                cuif.RegWrite = 1;
                cuif.aluop = ALU_OR;
            end
            XORI: begin
                cuif.ALUsrc = 2'd3;
                cuif.RegWrite = 1;
                cuif.aluop = ALU_XOR;
            end
            LUI: begin
                cuif.RegWrite = 1;
                cuif.lui = 1;
            end
            LW: begin
                cuif.MemtoReg = 1;
                cuif.RegWrite = 1;
                cuif.dREN = 1;
                cuif.aluop = ALU_ADD;
                cuif.ALUsrc = 2'd2;
            end
            LBU:
            LHU:
            SB:
            SH:
            SW: begin
                cuif.dWEN = 1;
                cuif.aluop = ALU_ADD;
                cuif.ALUsrc = 2'd2;
            end
            LL:
            SC:
            HALT: begin
                cuif.halt = 1'b1;
            end
        end
    end
    else if (opcode == J) begin
        cuif.addr = cuif.imemload[25:0];
        cuif.PCsrc = 3'd3;
    end
    else if (opcode == JAL) begin
        cuif.addr = cuif.imemload[25:0];
        cuif.RegWrite = 1;
        cuif.RegDst = 2'b10;
        cuif.jal = 1;
    end
end

endmodule