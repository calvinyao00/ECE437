`include "program_counter_if.vh"

module program_counter
(
    input logic clk,
    input logic nRST,
    program_counter_if.pc pcif
);
    import cpu_types_pkg::*;
    // pc init
    parameter PC_INIT = 0;
    word_t next_pc;
    always_ff @ (posedge clk, negedge nRST)
    begin
        if(!nRST) begin
            pcif.PC <= PC_INIT;
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
