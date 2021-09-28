`include "if_id_if.vh"

module if_id
import cpu_types_pkg::*;
(
    input logic CLK,
    input logic nRST,
    if_id_if.pipe ifid
);


always_ff @ (posedge CLK, negedge nRST) begin
    if(!nRST) begin
        ifid.instr <= '0;
        ifid.pc <= '0;
        ifid.pcout <= '0;
    end
    else if((ifid.flushed && ifid.ihit) || ifid.stall) begin
        ifid.instr <= '0;
        ifid.pc <= '0;
        ifid.pcout <= '0;
    end
    else if (ifid.ihit) begin
        ifid.instr <= ifid.imemload;
        ifid.pc <= ifid.npc;
        ifid.pcout <= ifid.PC;
    end
end

endmodule
