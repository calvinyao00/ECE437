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
  // type import
  import cpu_types_pkg::*;

  // number of cpus for cc
  parameter CPUS = 1;

  always_comb begin
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
    else begin//if (ccif.iREN) begin
      ccif.ramREN = ccif.iREN;
      ccif.ramaddr = ccif.iaddr;
      ccif.iload = ccif.ramload;
    end

    ccif.iwait = (ccif.ramstate == ACCESS) ? !(!ccif.dREN && !ccif.dWEN && ccif.iREN) : 1;
  end

endmodule
