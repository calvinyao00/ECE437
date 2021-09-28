`include "program_counter_if.vh"

module program_counter
import cpu_types_pkg::*;
(
    input logic clk,
    input logic nRST,
    program_counter_if.pc pcif
);


always_ff @ (posedge clk, negedge nRST)
begin
    if(!nRST) begin
        pcif.PC <= '0;
    end
    else if(pcif.pcEN) begin
        pcif.PC <= pcif.newpc;
    end
end
assign pcif.npc = pcif.PC + 4;

endmodule