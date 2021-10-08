`include "BPT_if.vh"
module BPT (
    input logic CLK,
    input logic nRST,
    BPT_if.bpt bptif
);
    logic [2047:0] [1:0] prediction_table;
    logic [2047:0] [1:0] next_prediction_table;

    always_ff @ (posedge CLK, negedge nRST) begin
        if(!nRST) begin
            prediction_table <= '0;
        end
        else begin
            prediction_table <= next_prediction_table;
        end
    end

    always_comb begin
        next_prediction_table = prediction_table;
        if(bptif.WEN && (bptif.branch_index != 0)) begin
            casez (prediction_table[bptif.branch_index])
                2'b00: next_prediction_table[bptif.branch_index] = bptif.result ? 2'b01 :2'b00;
                2'b01: next_prediction_table[bptif.branch_index] = bptif.result ? 2'b11 :2'b00;
                2'b10: next_prediction_table[bptif.branch_index] = bptif.result ? 2'b11 :2'b00;
                2'b11: next_prediction_table[bptif.branch_index] = bptif.result ? 2'b11 :2'b10; 
            endcase 
        end
        casez (prediction_table[bptif.lookup_index])
            2'b1? :  bptif.prediction = 1;
            2'b0? :  bptif.prediction = 0;
        endcase

    //bptif.prediction = prediction_table[bptif.lookup_index];
    //bptif.hit = bptif.branch_target == 0;
    end
    
endmodule