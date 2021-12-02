// interfaces
`include "datapath_cache_if.vh"
`include "caches_if.vh"

// cpu types
`include "cpu_types_pkg.vh"

module dcache(
  input logic CLK, nRST,
  datapath_cache_if.dcache dcif,
  caches_if.dcache cif
);
import cpu_types_pkg::*;

logic dhit;
logic miss, hit, shabi_miss;
logic way, nxt_way;
logic [7:0] recent, nxt_recent;
logic [4:0] iteration, nxt_iteration, itera;
word_t linkreg, nxt_linkreg;
dcachef_t addr;
dcachef_t snoopaddr;
//word_t hit_counter, nxt_hit_counter;
dcache_frame [7:0][1:0] dcaches, nxt_dcaches;


logic[7:0][1:0] empty;
assign empty = '0;
    
assign addr = dcachef_t'(dcif.dmemaddr);
assign snoopaddr = dcachef_t'(cif.ccsnoopaddr);
typedef enum logic[4:0] {  
    IDLE, WB1, WB2, WAIT1, WAIT2, ALLO1, ALLO2, COUNT, END, HALT, FLUSH11, FLUSH12, FLUSH21, FLUSH22, SNOOP, SHARE1, SHARE2
} dstate_t;
dstate_t state, nxt_state;

always_ff @(posedge CLK, negedge nRST) begin 
    if(!nRST) begin
        state <= IDLE;
        //hit_counter <= 0;
        dcaches <= '0;
        iteration <= '0;
        recent <= 0;
        way <= 0;
        linkreg <= '0;
    end
    else begin
        state <= nxt_state;
        //hit_counter <= nxt_hit_counter;
        dcaches <= nxt_dcaches;
        iteration <= nxt_iteration;
        recent <= nxt_recent;
        way <= nxt_way;
        linkreg <= nxt_linkreg;
    end
end

// state machine
always_comb begin
    nxt_state = state;
    nxt_iteration = iteration;
    casez(state)
        IDLE: begin
            if(cif.ccwait) nxt_state = SNOOP;
            else if(dcif.halt)
                nxt_state = HALT;
            else if(shabi_miss & !cif.ccinv)
                nxt_state = WAIT1;
            else if(miss& !cif.ccinv) begin
                if(nxt_recent[addr.idx] == 0) nxt_state = (dcaches[addr.idx][0].dirty) ? WB1 : ALLO1;
                else if(nxt_recent[addr.idx] == 1) nxt_state = (dcaches[addr.idx][1].dirty) ? WB1 : ALLO1;
            end
        end
        SNOOP: begin
            if(snoopaddr.tag == dcaches[snoopaddr.idx][0].tag && dcaches[snoopaddr.idx][0].valid) begin
                if (dcaches[snoopaddr.idx][0].dirty) nxt_state = SHARE1;
                else if (!dcaches[snoopaddr.idx][0].dirty) nxt_state = IDLE;
            end
            else if(snoopaddr.tag == dcaches[snoopaddr.idx][1].tag && dcaches[snoopaddr.idx][1].valid) begin
                if (dcaches[snoopaddr.idx][1].dirty) nxt_state = SHARE1;
                else if (!dcaches[snoopaddr.idx][1].dirty) nxt_state = IDLE;
            end
            else nxt_state = IDLE;
        end
        WAIT1: begin
            if(!cif.dwait) nxt_state = WAIT2;
        end
        WAIT2: begin
            if(!cif.dwait) nxt_state = IDLE;
        end
        SHARE1: begin
            if (!cif.dwait) nxt_state = SHARE2;
        end
        SHARE2: begin
            if (!cif.dwait) nxt_state = IDLE;
        end
        WB1: if(!cif.dwait) nxt_state = WB2;
        WB2: if(!cif.dwait) nxt_state = IDLE;
        ALLO1: begin
            if(!cif.dwait) nxt_state = ALLO2;
        end
        ALLO2: if(!cif.dwait) nxt_state = IDLE;
        HALT: begin
            if (cif.ccwait)nxt_state = SNOOP;
            else if (cif.ccinv)nxt_state = IDLE;
            else begin
                if(iteration < 8) begin
                    if(dcaches[iteration[2:0]][0].dirty) nxt_state = FLUSH11;
                end
                else begin
                    if(dcaches[iteration[2:0]][1].dirty) nxt_state = FLUSH21;
                end
                if(iteration == 5'd16) begin
                    nxt_state = END;///
                end
                nxt_iteration = iteration + 1;
            end
        end
        FLUSH11: if(!cif.dwait) nxt_state = FLUSH12;
        FLUSH12: if(!cif.dwait) nxt_state = HALT;
        FLUSH21: if(!cif.dwait) nxt_state = FLUSH22;
        FLUSH22: if(!cif.dwait) nxt_state = HALT;
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
    dcif.dmemload = (dcif.datomic & dcif.dmemWEN) ? ((dcif.dmemaddr == linkreg)?32'h1 :'0): '0;
    nxt_recent = recent;
    //nxt_hit_counter = hit_counter;
    dcif.flushed = (state == END);
    nxt_dcaches = dcaches;
    itera = iteration - 1;
    cif.ccwrite = 0;
    cif.cctrans = 0;
    shabi_miss = 0;
    nxt_way = way;
    nxt_linkreg = linkreg;
    casez(state) 
        IDLE: begin
            //nxt_hit_counter = hit_counter;
            //if(dcif.halt) nxt_hit_counter = hit_counter;
            if(dcif.dmemWEN) begin
                if (dcif.datomic) begin
                    if(dcif.dmemaddr == linkreg) begin
                        if((addr.tag == dcaches[addr.idx][0].tag)) begin
                            if(!dcaches[addr.idx][0].dirty /*& dcaches[addr.idx][0].valid*/) begin
                                nxt_recent[addr.idx] = 1; // old
                                //Snoop signal
                                nxt_way = 0;//Remember which way to update.
                                cif.cctrans = 1;
                                cif.ccwrite = 1;
                                cif.daddr = addr;
                                shabi_miss = 1;// Generate a BusRdx
                            end
                            else begin
						        nxt_linkreg = 0;
                                dcif.dhit = 1;
					            nxt_dcaches[addr.idx][0].dirty = 1;
                                //nxt_hit_counter = hit_counter + 1;
                                nxt_dcaches[addr.idx][0].data[addr.blkoff] = dcif.dmemstore;
                                nxt_recent[addr.idx] = 1; // old
                                //nxt_hit_counter = hit_counter - 1;
                            end          
                        end
                        else if(addr.tag == dcaches[addr.idx][1].tag) begin
                            if(!dcaches[addr.idx][1].dirty /*& dcaches[addr.idx][1].valid*/) begin
                                nxt_recent[addr.idx] = 0;// replace itself.
                                //Snoop signal
                                nxt_way = 1;//Remember which way to update.
                                cif.cctrans = 1;
                                cif.ccwrite = 1;
                                cif.daddr = addr;
                                shabi_miss = 1;
                            end
                            else begin
						        nxt_linkreg = 0;
                                dcif.dhit = 1;
					            nxt_dcaches[addr.idx][1].dirty = 1;
                                //nxt_hit_counter = hit_counter + 1;
                                nxt_dcaches[addr.idx][1].data[addr.blkoff] = dcif.dmemstore;
                                nxt_recent[addr.idx] = 0; // old
                                //nxt_hit_counter = hit_counter - 1;
                            end
                        end
                        else begin
					        miss = 1;
                            cif.cctrans = 1;
					        //nxt_hit_counter = hit_counter - 1;
                            cif.ccwrite = 0;
				        end
                    end
                    else dcif.dhit = 1;
                end
                else begin
					if (dcif.dmemaddr == linkreg) begin
						nxt_linkreg = 0;
					end
                    if((addr.tag == dcaches[addr.idx][0].tag)) begin
                        if(!dcaches[addr.idx][0].dirty /*& dcaches[addr.idx][0].valid*/) begin
                            nxt_recent[addr.idx] = 1; // old
                            //Snoop signal
                            nxt_way = 0;//Remember which way to update.
                            cif.cctrans = 1;
                            cif.ccwrite = 1;
                            cif.daddr = addr;
                            shabi_miss = 1;// Generate a BusRdx
                        end
                        else begin
                            dcif.dhit = 1;
					        nxt_dcaches[addr.idx][0].dirty = 1;
                            //nxt_hit_counter = hit_counter + 1;
                            nxt_dcaches[addr.idx][0].data[addr.blkoff] = dcif.dmemstore;
                            nxt_recent[addr.idx] = 1; // old
                            //nxt_hit_counter = hit_counter - 1;
                        end          
                    end
                    else if(addr.tag == dcaches[addr.idx][1].tag) begin
                        if(!dcaches[addr.idx][1].dirty /*& dcaches[addr.idx][1].valid*/) begin
                            nxt_recent[addr.idx] = 0;// replace itself.
                            //Snoop signal
                            nxt_way = 1;//Remember which way to update.
                            cif.cctrans = 1;
                            cif.ccwrite = 1;
                            cif.daddr = addr;
                            shabi_miss = 1;
                        end
                        else begin
                            dcif.dhit = 1;
					        nxt_dcaches[addr.idx][1].dirty = 1;
                            //nxt_hit_counter = hit_counter + 1;
                            nxt_dcaches[addr.idx][1].data[addr.blkoff] = dcif.dmemstore;
                            nxt_recent[addr.idx] = 0; // old
                            //nxt_hit_counter = hit_counter - 1;
                        end
                    end
                    else begin
					    miss = 1;
                        cif.cctrans = 1;
					    //nxt_hit_counter = hit_counter - 1;
                        cif.ccwrite = 0;
				    end
                end
            end
            else if(dcif.dmemREN) begin
                if (dcif.datomic) begin
					nxt_linkreg = dcif.dmemaddr;
				end
                if ((addr.tag == dcaches[addr.idx][0].tag)) begin
                    if (dcaches[addr.idx][0].valid) begin
                        dcif.dhit = 1;
                        //nxt_hit_counter = hit_counter + 1;
                        dcif.dmemload = dcaches[addr.idx][0].data[addr.blkoff];
                        nxt_recent[addr.idx] = 1;
                    end
                    else begin
                        miss = 1;
                        cif.cctrans = 1;
                        nxt_recent[addr.idx] = 0;
                    end
                    //cif.cctrans = dcaches[addr.idx][0].valid? 1:0;
				end
                else if ((addr.tag == dcaches[addr.idx][1].tag) ) begin
					if (dcaches[addr.idx][1].valid) begin
                        dcif.dhit = 1;
                        //nxt_hit_counter = hit_counter + 1;
                        dcif.dmemload = dcaches[addr.idx][1].data[addr.blkoff];
                        //cif.cctrans = dcaches[addr.idx][1].valid? 1:0;
                        nxt_recent[addr.idx] = 0;
                    end
                    else begin
                        miss = 1;
                        cif.cctrans = 1;
                        nxt_recent[addr.idx] = 1;
                    end
				end 
                else begin
					miss = 1;
					//nxt_hit_counter = hit_counter - 1;
                    cif.cctrans = 1;
				end
            end
        end
        SNOOP: begin
            if (word_t'(snoopaddr) == linkreg && cif.ccinv) nxt_linkreg = '0;
            if((snoopaddr.tag == dcaches[snoopaddr.idx][0].tag) && (dcaches[snoopaddr.idx][0].valid)) begin
                if (cif.ccinv) begin
                    nxt_dcaches[snoopaddr.idx][0].valid = 0;
                    nxt_dcaches[snoopaddr.idx][0].dirty = 0;
                    cif.cctrans = dcaches[snoopaddr.idx][0].dirty;
                end
                else begin
                   nxt_dcaches[snoopaddr.idx][0].dirty = 0;
                   //also need to tell bus if writing back is necessary
                   cif.cctrans = dcaches[snoopaddr.idx][0].dirty;
                end
            end
            else if((snoopaddr.tag == dcaches[snoopaddr.idx][1].tag) && (dcaches[snoopaddr.idx][1].valid))begin
                if (cif.ccinv) begin
                    nxt_dcaches[snoopaddr.idx][1].valid = 0;
                    nxt_dcaches[snoopaddr.idx][1].dirty = 0;
                    //also need to tell bus if writing back is necessary
                    cif.cctrans = dcaches[snoopaddr.idx][1].dirty;
                end
                else begin
                   nxt_dcaches[snoopaddr.idx][1].dirty = 0;
                   //also need to tell bus if writing back is necessary
                   cif.cctrans = dcaches[snoopaddr.idx][1].dirty;
                end
            end
        end
        SHARE1: begin
            if((snoopaddr.tag == dcaches[snoopaddr.idx][0].tag) ) begin
                cif.dstore = dcaches[snoopaddr.idx][0].data[0];
                cif.daddr = {dcaches[snoopaddr.idx][0].tag, snoopaddr.idx, 3'd0};
            end
            else if((snoopaddr.tag == dcaches[snoopaddr.idx][1].tag))begin
                cif.dstore = dcaches[snoopaddr.idx][1].data[0];
                cif.daddr = {dcaches[snoopaddr.idx][1].tag, snoopaddr.idx, 3'd0};
            end
        end
        SHARE2: begin
            if((snoopaddr.tag == dcaches[snoopaddr.idx][0].tag) ) begin
                cif.dstore = dcaches[snoopaddr.idx][0].data[1];
                cif.daddr = {dcaches[snoopaddr.idx][0].tag, snoopaddr.idx, 3'd4};
            end
            else if((snoopaddr.tag == dcaches[snoopaddr.idx][1].tag))begin
                cif.dstore = dcaches[snoopaddr.idx][1].data[1];
                cif.daddr = {dcaches[snoopaddr.idx][1].tag, snoopaddr.idx, 3'd4};
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
                nxt_dcaches[addr.idx][0].dirty = 0;
                cif.dstore = dcaches[addr.idx][0].data[1];
                cif.daddr = {dcaches[addr.idx][0].tag, addr.idx, 3'd4};
            end
            else if(recent[addr.idx] == 1) begin
                nxt_dcaches[addr.idx][1].dirty = 0;
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
        WAIT1: begin
            cif.daddr = {addr.tag, addr.idx, 3'd0};
            nxt_dcaches[addr.idx][way].data[0] = addr.blkoff ? cif.dload :dcif.dmemstore; //load from memory or datapath
        end
        WAIT2: begin
            cif.daddr = {addr.tag, addr.idx, 3'd4};
            nxt_dcaches[addr.idx][way].dirty = 1;
            dcif.dhit = !cif.dwait;
            nxt_dcaches[addr.idx][way].valid = 1;
            nxt_linkreg = dcif.datomic && !cif.dwait ? '0: linkreg;
            nxt_dcaches[addr.idx][way].data[1] = !addr.blkoff ? cif.dload :dcif.dmemstore; 
        end
        //COUNT: begin
        //    cif.dWEN = 1;
        //    cif.daddr = 32'h3100;
        //    cif.dstore = hit_counter;
        //end
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