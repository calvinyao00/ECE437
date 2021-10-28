`include "id_ex_if.vh"

module id_ex
(
    input logic CLK,
    input logic nRST,
    id_ex_if.pipe idex
);
import pipe_types_pkg::*;
import cpu_types_pkg::*;

ie_t next_idex_out;
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
        idex.out.pc <= '0;
        idex.out.imm <= '0;
        idex.out.aluop <= ALU_SLL;
        idex.out.instr <= '0;
        idex.out.RegSrc <= '0;
        //idex.out.flagZero <= '0;
        idex.out.dREN <= 0;
        idex.out.dWEN <= 0;
        idex.out.RegWrite <= 0;
        idex.out.RegDst <= 0;
        idex.out.shamt <= '0;
    end
    else begin 
        idex.out <= next_idex_out;
    end
end
always_comb begin
    if(idex.flushed /*&& idex.ihit) */ || idex.stall) begin
        next_idex_out.SignedExt = '0;
        next_idex_out.ZeroExt = '0;
        next_idex_out.BrAddr = '0;
        next_idex_out.pcsrc = '0;
        next_idex_out.alusrc = '0;
        next_idex_out.npc = '0;
        next_idex_out.pc = '0;
        next_idex_out.rdat1 = '0;
        next_idex_out.rdat2 = '0;
        next_idex_out.jal = 0;
        next_idex_out.rd = '0;
        next_idex_out.rs = '0;
        next_idex_out.rt = '0;
        next_idex_out.opcode = opcode_t'('0);
        next_idex_out.func = funct_t'('0);
        next_idex_out.addr = '0;
        //next_idex_out.flagZero <= '0;
        next_idex_out.halt = 0;
        next_idex_out.imm = '0;
        next_idex_out.aluop = ALU_SLL;
        next_idex_out.instr = '0;
        next_idex_out.RegSrc = '0;
        next_idex_out.dREN = 0;
        next_idex_out.dWEN = 0;
        next_idex_out.RegWrite = 0;
        next_idex_out.RegDst = 0;
        next_idex_out.shamt = '0;
    end
    else/* if(!idex.stall)*/ next_idex_out = idex.in;
end

endmodule
