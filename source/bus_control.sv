/*
  Eric Villasenor
  evillase@gmail.com

  this block is the coherence protocol
  and artibtration for ram
*/

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
import cpu_types_pkg::*;

typedef enum logic[3:0] {  
    IDLE, ARB, BusRd, BusRdx, BusWB1, BusWB2, MEM1, MEM2, FIN, IARB, IFETCH
} bstate_t;

bstate_t state, nxt_state;
// number of cpus for cc
parameter CPUS = 2;

logic drequestor, nxt_drequestor;
logic irequestor, nxt_irequestor;
logic dtestbit, itestbit;
logic nxt_dtestbit, nxt_itestbit;

always_ff @(posedge CLK, negedge nRST) begin 
    if(!nRST) begin
        state <= IDLE;
        drequestor <= 0;
        irequestor <= 0;
        dtestbit <= 0;
        itestbit <= 0;
    end
    else begin
        state <= nxt_state;
        drequestor <= nxt_drequestor;
        irequestor <=  nxt_irequestor;
        dtestbit <= nxt_dtestbit;
        itestbit <= nxt_itestbit;
    end
end

always_comb begin
    nxt_state = state;
    nxt_dtestbit = dtestbit;
    nxt_itestbit = itestbit;
    nxt_drequestor = drequestor;
    nxt_irequestor = irequestor;
    casez(state)
        IDLE: begin
            if(dREN[dtestbit] | dWEN[dtestbit]) begin
                nxt_state = ARB;
                nxt_drequestor = dtestbit;
            end
            else if(dREN[!dtestbit] | dWEN[!dtestbit]) begin
                nxt_state = ARB;
                nxt_drequestor = !dtestbit;
            end
            else if(iREN[itestbit]) begin
                nxt_state = IFETCH;
                nxt_irequestor = itestbit;
            end
            else if(iREN[!itestbit]) begin
                nxt_state = IFETCH;
                nxt_irequestor = !itestbit;
            end
        end
        /*IARB: begin
            nxt_itestbit = !itestbit;
            nxt_state = IFETCH;
        end*/
        IFETCH: begin
            nxt_itestbit = !itestbit;
            if(ramstate == ACCESS) nxt_state = IDLE;
        end
        ARB: begin
            nxt_itestbit = !itestbit;
            if(dREN[drequestor]) nxt_state = BusRd;
            else if(dWEN[drequestor]) nxt_state = BusRdx;
        end
        BusRd: begin
            if(ccwrite[!drequestor]) nxt_state = BusWB1;
            else nxt_state = MEM1;
        end
        BusRdx: begin
            if(ccwrite[!drequestor]) nxt_state = BusWB1;
            else nxt_state = MEM1;
        end
        BusWB1: begin
            if(ramstate == ACCESS) nxt_state = BusWB2;
        end
        BusWB2: begin
            if(ramstate == ACCESS & cctrans[!drequestor]) nxt_state = MEM1;
        end
        MEM1: begin
            if(ramstate == ACCESS) nxt_state = MEM2;
        end
        MEM2: begin
            if(ramstate == ACCESS) nxt_state = FIN;
        end
        FIN: begin
            if(cctrans[drequestor]) nxt_state = IDLE;
        end
    endcase
end

always_comb begin
    ccif.iwait = '0;
    ccif.dwait = '0;
    ccif.iload = '0;
    ccif.dload = '0;

    ccif.ramstore = '0;
    ccif.ramaddr = '0;
    ccif.ramWEN = 0;
    ccif.ramREN = 0;

    ccif.ccwait = 0;
    ccif.ccinv = 2'b0; 
    ccif.ccsnoopaddr = '0;

    casez(state) 
        IFETCH: begin
            ccif.iload[irequestor] = ccif.ramload;
            ccif.iwait[irequestor] = ccif.ramstate != ACCESS;
            ccif.ramREN = ccif.iREN[irequestor];
            ccif.ramaddr = ccif.iaddr[irequestor];
        end
        /*ARB: begin
            ccif.ccwait[!drequestor] = 1;
            ccif.ccsnoopaddr[!drequestor] = ccif.daddr[drequestor];
        end*/
        BusRd: begin
            ccif.dwait[drequestor] = 1;
            ccif.ccwait[!drequestor] = 1;
            ccif.ccsnoopaddr[!drequestor] = ccif.daddr[drequestor];
        end
        BusRdx: begin
            ccif.dwait[drequestor] = 1;
            ccif.ccwait[!drequestor] = 1;
            //ccif.ccwait[!drequestor] = 1;
            ccif.ccsnoopaddr[!drequestor] = ccif.daddr[drequestor];
            ccif.ccinv[!drequestor] = 1;
        end
        BusWB1: begin
            //ccif.ccwait = 2'b11;
            ccif.ccwait[!drequestor] = 1;
            //ccif.ccwait[!drequestor] = 1;
            //ccif.dwait[drequestor] = (ccif.ramstate != ACCESS);
            ccif.dwait[!drequestor] = (ccif.ramstate != ACCESS);
            ccif.ramstore = ccif.dstore[!drequestor];
            ccif.ramaddr = ccif.daddr[!drequestor];
            ccif.ramWEN = 1;//ccif.dWEN[!drequestor];
        end
        BusWB2: begin
            //ccif.ccwait = 2'b11;
            //ccif.ccwait[!drequestor] = 1;
            ccif.ccwait[!drequestor] = 1;
            ccif.dwait[!drequestor] = (ccif.ramstate != ACCESS);
            ccif.ramstore = ccif.dstore[!drequestor];
            ccif.ramaddr = ccif.daddr[!drequestor];
            ccif.ramWEN = 1;//ccif.dWEN[!drequestor];
        end
        MEM1: begin
            //ccif.ccwait[!drequestor] = 1;
            ccif.dwait[drequestor] = (ccif.ramstate != ACCESS);
            ccif.dload[drequestor] = ccif.ramload;
            ccif.ramaddr = ccif.daddr[drequestor];
            ccif.ramREN = ccif.dREN[drequestor];
            ccif.ramWEN = ccif.dWEN[drequestor];
            ccif.ramstore = ccif.dstore[drequestor];
        end
        MEM2: begin
            //ccif.ccwait[!drequestor] = 1;
            ccif.dwait[drequestor] = (ccif.ramstate != ACCESS);
            ccif.dload[drequestor] = ccif.ramload;
            ccif.ramaddr = ccif.daddr[drequestor];
            ccif.ramREN = ccif.dREN[drequestor];
            ccif.ramWEN = ccif.dWEN[drequestor];
            ccif.ramstore = ccif.dstore[drequestor];
        end
        FIN: begin
            ccif.ccwait[drequestor] = 0;
        end
    endcase
end

endmodule
