`include "request_unit_if.vh"

module request_unit 
import cpu_types_pkg::*;
(
    input logic clk,
    input logic nRST,
    request_unit_if.ru ruif
);

always_ff @ (posedge clk, negedge nRST)
begin
    if(!nRST) begin
        ruif.dmemREN <= 0;
        ruif.dmemWEN <= 0;
    end
    else if(ruif.ihit == 1) begin
        ruif.dmemREN <= ruif.dREN;
        ruif.dmemWEN <= ruif.dWEN;
    end
    else if(ruif.dhit == 1) begin
        ruif.dmemREN <= 0;
        ruif.dmemWEN <= 0;
    end
end

assign ruif.pcEN = ruif.ihit;
assign ruif.imemREN = 1;

endmodule