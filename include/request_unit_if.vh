
`ifndef REQUEST_UNIT_IF_VH
`define REQUEST_UNIT_IF_VH

// types
`include "cpu_types_pkg.vh"

interface request_unit_if;
  // import types
  import cpu_types_pkg::*;

// request unit signals
  // hit and enable
  logic               ihit, imemREN;

  logic               dhit, dmemREN, dmemWEN;
  
  logic               dWEN, dREN, pcEN;
  // datapath ports
  modport  ru (
    input   ihit, dhit, dWEN, dREN,
    output  imemREN, dmemREN, dmemWEN, pcEN
  );

endinterface

`endif //REQUEST_UNIT_IF_VH
