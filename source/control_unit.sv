`include "control_unit_if.vh"

module control_unit
import cpu_types_pkg::*;
(
    control_unit_if.cu cuif
);

//opcode_t opcode;
assign cuif.opcode = opcode_t'(cuif.imemload[31:26]);
//funct_t func;
assign cuif.func = funct_t'(cuif.imemload[5:0]);

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
    cuif.SignedExt = '0;
    cuif.ZeroExt = '0;
    cuif.BranchAddr = '0;
    cuif.RegSrc = '0;
    cuif.jal = 1'b0;

    if(cuif.opcode == RTYPE) begin
        cuif.rs = cuif.imemload[25:21];
        cuif.rt = cuif.imemload[20:16];
        cuif.rd = cuif.imemload[15:11];
        cuif.shamt = cuif.imemload[10:6];
        casez(cuif.func) 
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
                cuif.PCsrc = 3'd2; // JR
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
        endcase
    end
    else begin
        // i type
        cuif.RegDst = 1'b1; // decide wsel
        cuif.rs = cuif.imemload[25:21];
        cuif.rt = cuif.imemload[20:16];
        cuif.imm = {16'h0000, cuif.imemload[15:0]};
        cuif.SignedExt = cuif.imemload[15] ? {16'hffff, cuif.imemload[15:0]} : {16'h0000, cuif.imemload[15:0]};
        cuif.ZeroExt = {16'h0000, cuif.imemload[15:0]};
        cuif.BranchAddr = {cuif.SignedExt[29:0], 2'b00};
        casez(cuif.opcode)
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
                cuif.RegSrc = 2'b01;
            end
            LW: begin
                cuif.RegSrc = 2'b10;
                cuif.RegWrite = 1;
                cuif.dREN = 1;
                cuif.aluop = ALU_ADD;
                cuif.ALUsrc = 2'd2;
            end
            SW: begin
                cuif.dWEN = 1;
                cuif.aluop = ALU_ADD;
                cuif.ALUsrc = 2'd2;
            end
	    LL: begin
		cuif.RegSrc = 2'b10;
                cuif.RegWrite = 1;
                cuif.dREN = 1;
                cuif.aluop = ALU_ADD;
                cuif.ALUsrc = 2'd2;
	    end
	    SC : begin
		cuif.dWEN = 1;
                cuif.aluop = ALU_ADD;
                cuif.ALUsrc = 2'd2;
	    end
            HALT: begin
                cuif.halt = 1'b1;
            end
            J: begin
                cuif.addr = cuif.imemload[25:0];
                cuif.PCsrc = 3'd3;
            end
            JAL: begin
                cuif.addr = cuif.imemload[25:0];
                cuif.RegWrite = 1;
                cuif.RegSrc = 2'b11;
                cuif.PCsrc = 3'd3;
                cuif.jal = 1'b1;
            end
        endcase
    end
end

endmodule
