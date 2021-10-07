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
  parameter CPUS = 2;

  always_comb begin
    ccif.dwait = (ccif.dREN | ccif.dWEN) ? (ccif.ramstate == BUSY || ccif.ramstate == ERROR) : 0;
    ccif.iload = (!ccif.dREN & !ccif.dWEN) ? ((ccif.ramstate == ACCESS) ? ccif.ramload : 0) : '0;
    ccif.dload = ccif.dREN ? ccif.ramload : '0;
    ccif.ramstore = ccif.dWEN ? ccif.dstore : '0;
    ccif.ramaddr = (ccif.dREN | ccif.dWEN) ? ccif.daddr : (ccif.iREN ? ccif.iaddr : '0);
    ccif.ramWEN = ccif.dWEN;
    ccif.ramREN = ccif.dREN ? ccif.dREN : (!ccif.dWEN && ccif.iREN);
    ccif.ccwait = 0;
    ccif.ccinv = 0;
    ccif.ccsnoopaddr = '0;
    //if (ccif.dREN) begin
      //ccif.ramREN = ccif.dREN;
      //ccif.ramaddr = ccif.daddr;
      //ccif.dwait = (ccif.ramstate == BUSY || ccif.ramstate == ERROR);
      //ccif.dload = ccif.ramload;
    //end
    //else if(ccif.dWEN) begin
      //ccif.ramWEN = ccif.dWEN;
      //ccif.ramaddr = ccif.daddr;
      //ccif.dwait = (ccif.ramstate == BUSY || ccif.ramstate == ERROR);
      //ccif.ramstore = ccif.dstore;
    //end
   // else if (ccif.iREN) begin
      //ccif.ramREN = ccif.iREN;
      //ccif.ramaddr = ccif.iaddr;
      //ccif.iload = (ccif.ramstate == ACCESS) ? ccif.ramload : 0;
    //end

    ccif.iwait = (ccif.ramstate == ACCESS) ? !(!ccif.dREN && !ccif.dWEN && ccif.iREN) : 1;
  end

endmodule
