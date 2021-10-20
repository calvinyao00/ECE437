// interfaces
`include "datapath_cache_if.vh"
`include "caches_if.vh"

// cpu types
`include "cpu_types_pkg.vh"

module DCACHE(
  input logic CLK, nRST,
  datapath_cache_if.cache dcif,
  caches_if.dcache cif
);
logic dhit;
logic miss, hit;
dcachef_t addr;
word_t hit_counter, nxt_hit_counter;
dcache_frame dcaches[15:0], next_dcaches[15:0];
    
assign addr = dcachef_t'(dcif.dmemaddr);
typedef enum logic[2:0] {  
    IDLE, WB, DATA, FLUSH, COUNT, END
} dstate_t;

dstate_t state, nxt_state;

always_ff @(posedge CLK, negedge nRST) begin 
    if(!nRST) begin
        state <= IDLE;
        hit_counter <= 0;
        dcaches <= '0;
    end
    else begin
        state <= nxt_state;
        hit_counter <= nxt_hit_counter;
        dcaches <= nxt_dcaches;
    end
end

// state machine
always_comb begin
    nxt_state = state;
    casez(state)
        IDLE: begin
            if(dcif.halt) nxt_state = END;
            else if(miss) nxt_state = dcaches[addr.idx] == dirty ? WB : DATA;
        end
    endcase
end

endmodule