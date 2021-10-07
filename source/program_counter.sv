`include "program_counter_if.vh"

module program_counter
(
    input logic clk,
    input logic nRST,
    program_counter_if.pc pcif
);
import cpu_types_pkg::*;
word_t next_pc;
always_ff @ (posedge clk, negedge nRST)
begin
    if(!nRST) begin
        pcif.PC <= '0;
    end
    else begin
        pcif.PC <= next_pc;
    end
end
always_comb begin
   
    if(pcif.pcEN) next_pc = pcif.newpc;
    else next_pc = pcif.PC;
end
assign pcif.npc = pcif.PC + 4;

endmodule
