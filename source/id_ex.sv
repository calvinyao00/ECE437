`include "id_ex_if.vh"

module id_ex
(
    input logic CLK,
    input logic nRST,
    id_ex_if.pipe idex
);
import pipe_types_pkg::*;
import cpu_types_pkg::*;


always_ff @ (posedge CLK, negedge nRST) begin
    if(!nRST) begin
        idex.out.SignedExt <= '0;
        idex.out.ZeroExt <= '0;
        idex.out.BrAddr <= '0;
        idex.out.pcsrc <= '0;
        idex.out.alusrc <= '0;
        idex.out.npc <= '0;
        idex.out.rdat1 <= '0;
        idex.out.rdat2 <= '0;
        idex.out.rd <= '0;
        idex.out.rs <= '0;
        idex.out.rt <= '0;
        idex.out.opcode <= opcode_t'('0);
        idex.out.func <= funct_t'('0);
        idex.out.addr <= '0;
        idex.out.halt <= 0;
        idex.out.jal <= 0;
        idex.out.imm <= '0;
        idex.out.aluop <= ALU_SLL;
        idex.out.instr <= '0;
        idex.out.RegSrc <= '0;
        idex.out.flagZero <= '0;
        idex.out.dREN <= 0;
        idex.out.dWEN <= 0;
        idex.out.RegWrite <= 0;
        idex.out.RegDst <= 0;
        idex.out.shamt <= '0;
    end
    else if((idex.flushed && idex.ihit) || idex.stall) begin
        idex.out.SignedExt <= '0;
        idex.out.ZeroExt <= '0;
        idex.out.BrAddr <= '0;
        idex.out.pcsrc <= '0;
        idex.out.alusrc <= '0;
        idex.out.npc <= '0;
        idex.out.rdat1 <= '0;
        idex.out.rdat2 <= '0;
        idex.out.jal <= 0;
        idex.out.rd <= '0;
        idex.out.rs <= '0;
        idex.out.rt <= '0;
        idex.out.opcode <= opcode_t'('0);
        idex.out.func <= funct_t'('0);
        idex.out.addr <= '0;
        idex.out.flagZero <= '0;
        idex.out.halt <= 0;
        idex.out.imm <= '0;
        idex.out.aluop <= ALU_SLL;
        idex.out.instr <= '0;
        idex.out.RegSrc <= '0;
        idex.out.dREN <= 0;
        idex.out.dWEN <= 0;
        idex.out.RegWrite <= 0;
        idex.out.RegDst <= 0;
        idex.out.shamt <= '0;
    end
    else if(idex.ihit)begin
        /*idex.out.SignedExt <= idex.in.SignedExt;
        idex.out.ZeroExt <= idex.in.ZeroExt;
        idex.out.BrAddr <= idex.in.BrAddr;
        idex.out.pcsrc <= idex.in.pcsrc;
        idex.out.alusrc <= idex.in.alusrc;
        idex.out.npc <= idex.in.npc;
        idex.out.pc <= idex.in.pc;
        idex.out.rdat1 <= idex.in.rdat1;
        idex.out.rdat2 <= idex.in.rdat2;
        idex.out.rd <= idex.in.rd;
        idex.out.rs <= idex.in.rs;
        idex.out.rt <= idex.in.rt;
        idex.out.opcode <= idex.in.opcode;
        idex.out.func <= idex.in.func;
        idex.out.jal <= idex.in.jal;
        idex.out.addr <= idex.in.addr;
        idex.out.halt <= idex.in.halt;
        idex.out.imm <= idex.in.imm;
        idex.out.aluop <= idex.in.aluop;
        idex.out.instr <= idex.in.instr;
        idex.out.RegSrc <= idex.in.RegSrc;
        idex.out.dREN <= idex.in.dREN;
        idex.out.dWEN <= idex.in.dWEN;
        idex.out.RegWrite <= idex.in.RegWrite;
        idex.out.RegDst <= idex.in.RegDst;
        idex.out.shamt <= idex.in.shamt;*/
        idex.out <= idex.in;
    end
end

endmodule
