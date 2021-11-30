// interface include
`include "cache_control_if.vh"

// memory types
`include "cpu_types_pkg.vh"

module memory_control 
import cpu_types_pkg::*;
(
  input CLK, nRST,
  cache_control_if.cc ccif
);
  // type import
  import cpu_types_pkg::*;
  typedef enum logic[3:0] {  
    IDLE, ARB, WB1, WB2, BusRd, BusRdx, BusWB1, BusWB2, MEM1, MEM2, FIN, IARB, IFETCH
} bstate_t;

bstate_t state, nxt_state;
// number of cpus for cc
parameter CPUS = 2;

logic drequestor, nxt_drequestor;
logic irequestor, nxt_irequestor;
logic snooper, nxt_snooper;
logic dtestbit, itestbit;
logic nxt_dtestbit, nxt_itestbit;
always_ff @(posedge CLK, negedge nRST) begin 
    if(!nRST) begin
        state <= IDLE;
        drequestor <= 0;
        irequestor <= 0;
        snooper <= 0;
        dtestbit <= 0;
        itestbit <= 0;
        //snooped <= 0;
        //ccwrite <= 0;
    end
    else begin
        state <= nxt_state;
        drequestor <= nxt_drequestor;
        irequestor <=  nxt_irequestor;
        snooper <= nxt_snooper;
        dtestbit <= nxt_dtestbit;
        itestbit <= nxt_itestbit;
        //snooped <= nxt_snooped;
        //ccwrite <= nxt_ccwrite;
    end
end

always_comb begin
    nxt_state = state;
    nxt_drequestor = drequestor;
    nxt_irequestor = irequestor;
    nxt_snooper = snooper;
    nxt_dtestbit = dtestbit;
    nxt_itestbit = itestbit;
    //nxt_snooped = snooped;
    casez(state)
        IDLE: begin
            if(ccif.cctrans[0] | ccif.cctrans[1]) begin
                
                nxt_dtestbit = !dtestbit;
                if(ccif.cctrans[dtestbit]) begin
                    nxt_snooper = dtestbit;
                    nxt_state = ccif.ccwrite[dtestbit] ? BusRdx: BusRd;
                    //ccif.ccwait = dtestbit ? 2'b01:2'b10;
                end
                else begin
                    nxt_snooper = !dtestbit;
                    nxt_state = ccif.ccwrite[!dtestbit] ? BusRdx: BusRd;
                    //ccif.ccwait = dtestbit ? 2'b10:2'b01;
                end
                //nxt_drequestor = dtestbit;
            end
            else if(ccif.dWEN[0] | ccif.dWEN[1]) begin
                nxt_state = WB1;
            end
            else if(ccif.iREN[0] | ccif.iREN[1]) begin
                nxt_state = IFETCH;
                nxt_itestbit = !itestbit;
                if(ccif.iREN[itestbit]) nxt_irequestor = itestbit;
                else nxt_irequestor = !itestbit;
            end
        end
        WB1: begin
            if(ccif.ramstate == ACCESS) nxt_state = WB2;
        end
        WB2: begin
            if(ccif.ramstate == ACCESS) nxt_state = IDLE;
        end
        ARB: begin
            if(ccif.ccwrite[snooper]) nxt_state = BusRdx;
            else nxt_state = BusRd;
        end
        BusRdx: begin
            if(ccif.cctrans[!snooper]) nxt_state = BusWB1;
            else nxt_state = MEM1;
        end
        BusRd: begin
            if(ccif.cctrans[!snooper]) nxt_state = BusWB1;
            else nxt_state = MEM1;
        end
        BusWB1: begin
            if(ccif.ramstate == ACCESS) nxt_state = BusWB2;
        end
        BusWB2: begin
            if(ccif.ramstate == ACCESS) nxt_state = IDLE;
        end
        MEM1: begin
            if(ccif.ramstate == ACCESS) nxt_state = MEM2;
        end
        MEM2: begin
            if(ccif.ramstate == ACCESS) nxt_state = IDLE;
        end
        IFETCH: begin
            //nxt_itestbit = !itestbit;
            if(ccif.ramstate == ACCESS) nxt_state = IDLE;
        end
        /*FIN: begin
            if(ccif.cctrans[drequestor]) nxt_state = IDLE;
        end*/
    endcase
end

always_comb begin
    ccif.iwait[0] = 1;
    ccif.iwait[1] = 1;
    ccif.dwait[0] = 1;
    ccif.dwait[1] = 1;
    ccif.iload = '0;
    ccif.dload = '0;

    ccif.ramstore = '0;
    ccif.ramaddr = '0;
    ccif.ramWEN = 0;
    ccif.ramREN = 0;

    ccif.ccwait = 0;
    ccif.ccinv[0] = ccif.ccwrite[1];
    ccif.ccinv[1] = ccif.ccwrite[0];
    ccif.ccsnoopaddr = '0;

    casez(state) 
        WB1: begin
            if(ccif.dWEN[1]) begin
                ccif.dwait[1] = ccif.ramstate != ACCESS;
                ccif.ramstore = ccif.dstore[1];
                ccif.ramaddr = ccif.daddr[1];
                ccif.ramWEN = ccif.dWEN[1];
                ccif.ccwait[0] = 1;
            end 
            else if(ccif.dWEN[0]) begin
                ccif.dwait[0] = ccif.ramstate != ACCESS;
                ccif.ramstore = ccif.dstore[0];
                ccif.ramaddr = ccif.daddr[0];
                ccif.ramWEN = ccif.dWEN[0];
                ccif.ccwait[1] = 0;
            end
        end
        WB2: begin
            if(ccif.dWEN[1]) begin
                ccif.dwait[1] = ccif.ramstate != ACCESS;
                ccif.ramstore = ccif.dstore[1];
                ccif.ramaddr = ccif.daddr[1];
                ccif.ramWEN = ccif.dWEN[1];
                ccif.ccwait[0] = 1;
            end 
            else if(ccif.dWEN[0]) begin
                ccif.dwait[0] = ccif.ramstate != ACCESS;
                ccif.ramstore = ccif.dstore[0];
                ccif.ramaddr = ccif.daddr[0];
                ccif.ramWEN = ccif.dWEN[0];
                ccif.ccwait[1] = 0;
            end
        end
        IDLE: begin
            if(ccif.cctrans[0] | ccif.cctrans[1]) begin
                ccif.ccwait = nxt_snooper ? 2'b01:2'b10;
            end
        end
        ARB: begin
            ccif.ccwait[!snooper] = 1;
            ccif.ccsnoopaddr[!snooper] = ccif.daddr[snooper];
        end
        BusRd: begin
            ccif.dwait[snooper] = 1;
            ccif.ccwait[!snooper] = 1;
            ccif.ccsnoopaddr[!snooper] = ccif.daddr[snooper];
        end
        BusRdx: begin
            ccif.dwait[snooper] = 1;
            ccif.ccwait[!snooper] = 1;
            ccif.ccsnoopaddr[!snooper] = ccif.daddr[snooper];
            ccif.ccinv[!snooper] = 1;
        end
        MEM1: begin
            ccif.ccwait[!snooper] = 1;
            ccif.dwait[snooper] = (ccif.ramstate != ACCESS);
            //ccif.dwait[!snooper] = (ccif.ramstate != ACCESS);
            ccif.dload[snooper] = ccif.ramstate ==  ACCESS ? ccif.ramload : '0;
            ccif.ramaddr = ccif.daddr[snooper];
            ccif.ramREN = 1; //ccif.dREN[snooper];
            //ccif.ramWEN = ccif.dWEN[drequestor];
            ccif.ramstore = ccif.dstore[snooper];
        end
        MEM2: begin
            ccif.ccwait[!snooper] = 1;
            ccif.dwait[snooper] = (ccif.ramstate != ACCESS);
            //ccif.dwait[!snooper] = (ccif.ramstate != ACCESS);
            ccif.dload[snooper] = ccif.ramstate ==  ACCESS ? ccif.ramload : '0;
            ccif.ramaddr = ccif.daddr[snooper];
            ccif.ramREN = 1; //ccif.dREN[snooper];
            //ccif.ramWEN = ccif.dWEN[drequestor];
            ccif.ramstore = ccif.dstore[snooper];
        end
        BusWB1: begin
            ccif.ramaddr = ccif.daddr[!snooper];
            ccif.ramstore = ccif.dstore[!snooper];
            ccif.ramWEN = 1;
            ccif.dwait[!snooper] = (ccif.ramstate != ACCESS);
            ccif.dwait[snooper] = (ccif.ramstate != ACCESS);
            ccif.dload[snooper] = (ccif.dstore[!snooper]);
            ccif.ccsnoopaddr[!snooper] = ccif.daddr[snooper];
            ccif.ccwait[!snooper] = 1;
        end
        BusWB2: begin
            ccif.ramaddr = ccif.daddr[!snooper];
            ccif.ramstore = ccif.dstore[!snooper];
            ccif.ramWEN = 1;
            ccif.dwait[!snooper] = (ccif.ramstate != ACCESS);
            ccif.dwait[snooper] = (ccif.ramstate != ACCESS);
            ccif.dload[snooper] = (ccif.dstore[!snooper]);
            ccif.ccsnoopaddr[!snooper] = ccif.daddr[snooper];
            ccif.ccwait[!snooper] = 1;
        end
        IFETCH: begin
            ccif.iload[irequestor] = ccif.ramstate ==  ACCESS ? ccif.ramload : '0;
            ccif.iwait[irequestor] = ccif.ramstate != ACCESS;
            ccif.ramREN = ccif.iREN[irequestor];
            ccif.ramaddr = ccif.iaddr[irequestor];
        end
    endcase
end
 /*  always_comb begin
    ccif.dwait = 0;
    ccif.iload = '0;
    ccif.dload = '0;
    ccif.ramstore = '0;
    ccif.ramaddr = '0; //////'0
    ccif.ramWEN = 0;
    ccif.ramREN = 0;
    ccif.ccwait = 0;
    ccif.ccinv = 0;
    ccif.ccsnoopaddr = '0;
    if (ccif.dREN) begin
      ccif.ramREN = ccif.dREN;
      ccif.ramaddr = ccif.daddr;
      ccif.dwait = (ccif.ramstate == BUSY || ccif.ramstate == ERROR);
      ccif.dload = ccif.ramload;
    end
    else if(ccif.dWEN) begin
      ccif.ramWEN = ccif.dWEN;
      ccif.ramaddr = ccif.daddr;
      ccif.dwait = (ccif.ramstate == BUSY || ccif.ramstate == ERROR);
      ccif.ramstore = ccif.dstore;
    end
    else if (ccif.iREN) begin
      ccif.ramREN = ccif.iREN;
      ccif.ramaddr = ccif.iaddr;
      ccif.iload = (ccif.ramstate == ACCESS) ? ccif.ramload : 0;
    end

    ccif.iwait = (ccif.ramstate == ACCESS) ? !(!ccif.dREN && !ccif.dWEN && ccif.iREN) : 1;
  end */

endmodule
