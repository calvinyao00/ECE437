// interfaces
`include "system_if.vh"
`include "datapath_cache_if.vh"
`include "caches_if.vh"

// cpu types
`include "cpu_types_pkg.vh"

module icache(
  input logic CLK, nRST,
  datapath_cache_if dcif,
  caches_if.icache cif
);
    // import types
    import cpu_types_pkg::*;
    typedef enum bit {IDLE, MISS}stateType;
    logic ihit, cache_hit, miss;
    icachef_t addr;
    icache_frame [15:0]icaches;
    icache_frame [15:0]next_icaches;
    icache_frame hit_frame;
    stateType state;
    stateType nxt_state;
    assign addr = icachef_t'(dcif.imemaddr);
    assign hit_frame = icaches[addr.idx];
    //assign 
    always_ff @ (posedge CLK, negedge nRST) begin
        if(!nRST) begin
            icaches <= '0;
            state <= IDLE;
        end
        else begin
            icaches <= next_icaches;
            state <= nxt_state;
        end 
    end
    assign ihit = (cif.iREN) ? ~cif.iwait : 0;
    //assign cache_hit = icaches[addr.idx].tag == addr.tag && icaches[addr.idx].valid;
    always_comb begin
        //cache_hit = 0;
        //next_icaches = icaches;
        //dcif.ihit = 0;
        //cif.iREN = 0;
        //cif.iaddr = 0;
        //dcif.imemload= 0;
        //cif.iaddr = dcif.imemaddr;
        nxt_state = state;
        case (state)
            IDLE: begin
	            nxt_state = miss ? MISS : IDLE;
            end
            MISS: begin
                if(!cif.iwait) nxt_state = IDLE;
            end
        endcase
	end// interfaces
`include "system_if.vh"
`include "datapath_cache_if.vh"
`include "caches_if.vh"

// cpu types
`include "cpu_types_pkg.vh"

module icache(
  input logic CLK, nRST,
  datapath_cache_if dcif,
  caches_if.icache cif
);
    // import types
    import cpu_types_pkg::*;
    typedef enum bit {IDLE, MISS}stateType;
    logic ihit, cache_hit, miss;
    icachef_t addr;
    icache_frame [15:0]icaches;
    icache_frame [15:0]next_icaches;
    icache_frame hit_frame;
    stateType state;
    stateType nxt_state;
    assign addr = icachef_t'(dcif.imemaddr);
    assign hit_frame = icaches[addr.idx];
    //assign 
    always_ff @ (posedge CLK, negedge nRST) begin
        if(!nRST) begin
            icaches <= '0;
            state <= IDLE;
        end
        else begin
            icaches <= next_icaches;
            state <= nxt_state;
        end 
    end
    assign ihit = (cif.iREN) ? ~cif.iwait : 0;
    //assign cache_hit = icaches[addr.idx].tag == addr.tag && icaches[addr.idx].valid;
    always_comb begin
        //cache_hit = 0;
        //next_icaches = icaches;
        //dcif.ihit = 0;
        //cif.iREN = 0;
        //cif.iaddr = 0;
        //dcif.imemload= 0;
        //cif.iaddr = dcif.imemaddr;
        nxt_state = state;
        case (state)
            IDLE: begin
	            nxt_state = miss ? MISS : IDLE;
            end
            MISS: begin
                if(!cif.iwait) nxt_state = IDLE;
            end
        endcase
	end

    always_comb begin
        dcif.imemload = 0;
        cif.iREN = 0;
        dcif.ihit = 0;
        cif.iaddr = 0;
        /*if (ihit) begin    
            next_icaches[addr.idx].data = cif.iload;
            next_icaches[addr.idx].valid = 1;
            next_icaches[addr.idx].tag = addr.tag;
        end*/
        casez(state)
            IDLE: begin
                if(dcif.halt) begin
                    dcif.ihit = 0;
                    next_icaches = 0;
                end
                else if(dcif.imemREN) begin
                    if(hit_frame.tag == addr.tag && hit_frame.valid) begin
                        cache_hit = 1;
                        dcif.ihit = 1;
                        dcif.imemload = hit_frame.data;
                    end
                    else begin
                        miss = 1;
                    end
                end
            end
            MISS: begin
                cif.iaddr = dcif.imemaddr;
                cif.iREN = 1;
                next_icaches[addr.idx].data = cif.iload;
                next_icaches[addr.idx].valid = 1;
                next_icaches[addr.idx].tag = addr.tag;
            end
        endcase
    end
    
endmodule

        cif.iaddr = 0;
        miss = 0;
        /*if (ihit) begin    
            next_icaches[addr.idx].data = cif.iload;
            next_icaches[addr.idx].valid = 1;
            next_icaches[addr.idx].tag = addr.tag;
        end*/
        casez(state)
            IDLE: begin
                if(dcif.halt) begin
                    dcif.ihit = 0;
                    next_icaches = 0;
                end
                else if(dcif.imemREN) begin
                    if(hit_frame.tag == addr.tag && hit_frame.valid) begin
                        cache_hit = 1;
                        dcif.ihit = 1;
                        dcif.imemload = hit_frame.data;
                    end
                    else begin
                        miss = 1;
                    end
                end
            end
            MISS: begin
                cif.iaddr = dcif.imemaddr;
                cif.iREN = 1;
                next_icaches[addr.idx].data = cif.iload;
                next_icaches[addr.idx].valid = 1;
                next_icaches[addr.idx].tag = addr.tag;
            end
        endcase
    end
    
endmodule
