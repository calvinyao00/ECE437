`include "if_id_if.vh"

module if_id
import cpu_types_pkg::*;
(
    input logic CLK,
    input logic nRST,
    if_id_if.pipe ifid
);

word_t nxt_instr;
word_t nxt_pc;
word_t nxt_pcout;

always_ff @ (posedge CLK, negedge nRST) begin
    if(!nRST) begin
        ifid.instr <= '0;
        ifid.pc <= '0;
        ifid.pcout <= '0;
    end
    else begin
        ifid.instr <= nxt_instr;
        ifid.pc <= nxt_pc;
        ifid.pcout <= nxt_pcout;
    end
end

always_comb begin
    nxt_instr = ifid.instr;
    nxt_pc = ifid.pc;
    nxt_pcout = ifid.pcout;
    if((ifid.flushed)) begin
        nxt_instr = '0;
        nxt_pc = '0;
        nxt_pcout = '0;
    end
    else if (/*ifid.ihit && */~ifid.stall) begin
        nxt_instr = ifid.imemload;
        nxt_pc = ifid.npc;
        nxt_pcout = ifid.PC;
    end
end

endmodule
