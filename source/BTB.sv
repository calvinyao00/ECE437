module BTB (
    input logic CLK,
    input logic nRST,
    BTB_if.btb btbif
);
    logic [2047:0] [31:0] target_buffer;
    logic [2047:0] [31:0] next_target_buffer;

    always_ff @ (posedge CLK, negedge nRST) begin
        if(!nRST) begin
            target_buffer <= '0;
        end
        else begin
            target_buffer <= next_target_buffer;
        end
    end

    always_comb begin
    next_target_buffer = target_buffer;
    if(btbif.WEN && (btbif.branch_index != 0)) begin
        next_target_buffer[btbif.branch_index] = btbif.wdat;
    end
    btbif.branch_target = target_buffer[btbif.lookup_index];
    btbif.hit = btbif.branch_target == 0;
    end
    
endmodule