// interfaces
`include "datapath_cache_if.vh"
`include "caches_if.vh"

// cpu types
`include "cpu_types_pkg.vh"

module dcache(
  input logic CLK, nRST,
  datapath_cache_if.cache dcif,
  caches_if.dcache cif
);
import cpu_types_pkg::*;

logic dhit;
logic miss, hit;
logic [7:0] recent, nxt_recent;
logic [4:0] iteration, nxt_iteration, itera;
dcachef_t addr;
word_t hit_counter, nxt_hit_counter;
dcache_frame[7:0][1:0] dcaches, nxt_dcaches;


logic[7:0][1:0] empty;
assign empty = '0;
    
assign addr = dcachef_t'(dcif.dmemaddr);
typedef enum logic[3:0] {  
    IDLE, WB1, WB2, ALLO1, ALLO2, COUNT, END, HALT, FLUSH11, FLUSH12, FLUSH21, FLUSH22
} dstate_t;

dstate_t state, nxt_state;

always_ff @(posedge CLK, negedge nRST) begin 
    if(!nRST) begin
        state <= IDLE;
        hit_counter <= 0;
        dcaches <= '0;
        iteration <= '0;
        recent <= 0;
    end
    else begin
        state <= nxt_state;
        hit_counter <= nxt_hit_counter;
        dcaches <= nxt_dcaches;
        iteration <= nxt_iteration;
        recent <= nxt_recent;
    end
end

// state machine
always_comb begin
    nxt_state = state;
    nxt_iteration = iteration;
    casez(state)
        IDLE: begin
            if(dcif.halt) nxt_state = HALT;
            else if(miss) begin
                if(recent[addr.idx] == 0) nxt_state = (dcaches[addr.idx][0].dirty) ? WB1 : ALLO1;
                else if(recent[addr.idx] == 1) nxt_state = (dcaches[addr.idx][1].dirty) ? WB1 : ALLO1;
            end
        end
        WB1: if(!cif.dwait) nxt_state = WB2;
        WB2: if(!cif.dwait) nxt_state = ALLO1;
        ALLO1: if(!cif.dwait) nxt_state = ALLO2;
        ALLO2: if(!cif.dwait) nxt_state = IDLE;
        HALT: begin
            if(iteration < 8) begin
                if(dcaches[iteration[2:0]][0].dirty) nxt_state = FLUSH11;
            end
            else begin
                if(dcaches[iteration[2:0]][1].dirty) nxt_state = FLUSH21;
            end
            if(iteration == 5'd16) begin
                nxt_state = COUNT;
            end
            nxt_iteration = iteration + 1;
        end
        FLUSH11: if(!cif.dwait) nxt_state = FLUSH12;
        FLUSH12: if(!cif.dwait) nxt_state = HALT;
        FLUSH21: if(!cif.dwait) nxt_state = FLUSH22;
        FLUSH22: if(!cif.dwait) nxt_state = HALT;
        COUNT: if(!cif.dwait) nxt_state = END;
    endcase
end

// output
always_comb begin
    dcif.dhit = 0;
    miss = 0;
    cif.dREN = 0;
    cif.dWEN = 0;
    cif.daddr = '0;
    cif.dstore = '0;
    dcif.dmemload = '0;
    nxt_recent = recent;
    nxt_hit_counter = hit_counter;
    dcif.flushed = (state == END);
    nxt_dcaches = dcaches;
    itera = iteration - 1;
    casez(state) 
        IDLE: begin
            nxt_hit_counter = hit_counter;
            if(dcif.halt) nxt_hit_counter = hit_counter;
            else if(dcif.dmemWEN) begin
                if(addr.tag == dcaches[addr.idx][0].tag) begin
                    dcif.dhit = 1;
					nxt_dcaches[addr.idx][0].dirty = 1;
                    nxt_hit_counter = hit_counter + 1;
                    nxt_dcaches[addr.idx][0].data[addr.blkoff] = dcif.dmemstore;
                    nxt_recent[addr.idx] = 1; // old
                end
                else if(addr.tag == dcaches[addr.idx][1].tag) begin
                    dcif.dhit = 1;
					nxt_dcaches[addr.idx][1].dirty = 1;
                    nxt_hit_counter = hit_counter + 1;
                    nxt_dcaches[addr.idx][1].data[addr.blkoff] = dcif.dmemstore;
                    nxt_recent[addr.idx] = 0; // old
                end
                else begin
                    /*dcif.dhit = 1;
                    nxt_dcaches[addr.idx][recent[addr.idx]].data[addr.blkoff] = dcif.dmemstore;
                    nxt_dcaches[addr.idx][recent[addr.idx]].tag = addr.tag;
                    nxt_dcaches[addr.idx][recent[addr.idx]].valid = 1;
                    nxt_dcaches[addr.idx][recent[addr.idx]].dirty = 1;*/
                    miss = 1;
					nxt_hit_counter = hit_counter - 1;
                end
            end
            else if(dcif.dmemREN) begin
                if ((addr.tag == dcaches[addr.idx][0].tag) & dcaches[addr.idx][0].valid) begin
					dcif.dhit = 1;
                    nxt_hit_counter = hit_counter + 1;
                    dcif.dmemload = dcaches[addr.idx][0].data[addr.blkoff];
					nxt_recent[addr.idx] = 1;
				end else if ((addr.tag == dcaches[addr.idx][1].tag) & dcaches[addr.idx][1].valid) begin
					dcif.dhit = 1;
                    nxt_hit_counter = hit_counter + 1;
					dcif.dmemload = dcaches[addr.idx][1].data[addr.blkoff];
					nxt_recent[addr.idx] = 0;
				end else begin
					miss = 1;
					nxt_hit_counter = hit_counter - 1;
				end
            end
        end
        WB1: begin
            cif.dWEN = 1;
            if(recent[addr.idx] == 0) begin
                cif.dstore = dcaches[addr.idx][0].data[0];
                cif.daddr = {dcaches[addr.idx][0].tag, addr.idx, 3'd0};
            end
            else if(recent[addr.idx] == 1) begin
                cif.dstore = dcaches[addr.idx][1].data[0];
                cif.daddr = {dcaches[addr.idx][1].tag, addr.idx, 3'd0};
            end
        end
        WB2: begin
            cif.dWEN = 1;
            if(recent[addr.idx] == 0) begin
                cif.dstore = dcaches[addr.idx][0].data[1];
                cif.daddr = {dcaches[addr.idx][0].tag, addr.idx, 3'd4};
            end
            else if(recent[addr.idx] == 1) begin
                cif.dstore = dcaches[addr.idx][1].data[1];
                cif.daddr = {dcaches[addr.idx][1].tag, addr.idx, 3'd4};
            end
        end
        ALLO1: begin
                cif.dREN = 1;
                cif.daddr = {addr.tag, addr.idx, 3'd0};
                if(recent[addr.idx] == 0) nxt_dcaches[addr.idx][0].data[0] = cif.dload;
                else nxt_dcaches[addr.idx][1].data[0] = cif.dload;
        end
        ALLO2: begin
            cif.dREN = 1;
            cif.daddr = {addr.tag, addr.idx, 3'd4};
            if(recent[addr.idx] == 0) begin
                nxt_dcaches[addr.idx][0].tag = addr.tag;
                nxt_dcaches[addr.idx][0].valid = 1;
                nxt_dcaches[addr.idx][0].dirty = 0;
                nxt_dcaches[addr.idx][0].data[1] = cif.dload;
            end
            else begin
                nxt_dcaches[addr.idx][1].tag = addr.tag;
                nxt_dcaches[addr.idx][1].valid = 1;
                nxt_dcaches[addr.idx][1].dirty = 0;
                nxt_dcaches[addr.idx][1].data[1] = cif.dload;
            end
        end
        COUNT: begin
            cif.dWEN = 1;
            cif.daddr = 32'h3100;
            cif.dstore = hit_counter;
        end
        FLUSH11: begin
            cif.dWEN = 1;
            cif.daddr = {dcaches[itera[2:0]][0].tag, itera[2:0], 3'd0};
			cif.dstore = dcaches[itera[2:0]][0].data[0];
        end
        FLUSH12: begin
            cif.dWEN = 1;
            cif.daddr = {dcaches[itera[2:0]][0].tag, itera[2:0], 3'd4};
			cif.dstore = dcaches[itera[2:0]][0].data[1];
        end
        FLUSH21: begin
            cif.dWEN = 1;
            cif.daddr = {dcaches[itera[2:0]][1].tag, itera[2:0], 3'd0};
			cif.dstore = dcaches[itera[2:0]][1].data[0];
        end
        FLUSH22: begin
            cif.dWEN = 1;
            cif.daddr = {dcaches[itera[2:0]][1].tag, itera[2:0], 3'd4};
			cif.dstore = dcaches[itera[2:0]][1].data[1];
        end
    endcase
end

endmodule