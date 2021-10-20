// interfaces
`include "datapath_cache_if.vh"
`include "caches_if.vh"

// cpu types
`include "cpu_types_pkg.vh"

module ICACHE(
  input logic CLK, nRST,
  datapath_cache_if.cache dcif,
  caches_if.icache cif
);
    logic ihit, cache_hit;
    icachef_t addr;
    icache_frame icaches[15:0];
    icache_frame next_icaches[15:0];
    
    assign addr = icachef_t'(dcif.imemaddr);
    //assign 
    always_ff @ (negedge CLK, negedge nRST) begin
        if(!nRST) begin
            icaches <= '0;
        end
        else begin
            icaches <= next_icaches;
        end 
    end
    assign ihit = (cif.iREN) ? ~cif.iwait : 0;
    //assign cache_hit = icaches[addr.index].tag == addr.tag && icaches[addr.index].valid;
    always_comb begin
        cache_hit = 0;
        next_icaches = icaches;
        dcif.ihit = 0;
        cif.iREN = 0;
        cif.iaddr = 0;
        if (ihit) begin    
            next_icaches[addr.index].data <= cif.iload;
            next_icaches[addr.index].valid <= 1;
            next_icaches[addr.index].tag <= addr.tag;
        end
        if(dcif.halt) begin
            //halted
		    dcif.ihit = 0;
		    dcif.imemload = 0;
        end
        else if(dcif.imemREN && !dcif.dmemREN && !dcif.dmemWEN) begin
            dcif.ihit = ihit | cache_hit : 0;
            //Hit
            if (icaches[addr.index].tag == addr.tag && icaches[addr.index].valid) begin
                cache_hit = 1;
                dcif.imemload = icaches[addr.index].data;
            end
            //miss
            else begin
                dcif.imemload = cif_imemload;
                cif.iREN = 1;
                cif.iaddr = dcif.imemaddr;
            end
        end
        else begin
		    dcif.ihit = 0;
		    dcif.imemload = 0;
        end
    end
    
endmodule