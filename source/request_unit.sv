`include "request_unit_if.vh"

module request_unit 
import cpu_types_pkg::*;
(
    input logic clk,
    input logic nRST,
    request_unit_if.ru ruif
);

logic nxt_ren; 
logic nxt_wen;

always_ff @ (posedge clk, negedge nRST)
begin
    if(!nRST) begin
        ruif.dmemREN <= 0;
        ruif.dmemWEN <= 0;
    end
    else if(ruif.dhit == 1) begin
        ruif.dmemREN <= 0;
        ruif.dmemWEN <= 0;
    end
    else if(ruif.ihit == 1) begin
        ruif.dmemREN <= ruif.dREN;
        ruif.dmemWEN <= ruif.dWEN;
    end
end

/*always_ff @ (posedge clk, negedge nRST)
begin
    if(!nRST) begin
        ruif.dmemREN <= 0;
        ruif.dmemWEN <= 0;
    end
    else begin
        ruif.dmemREN <= nxt_ren;
        ruif.dmemWEN <= nxt_wen;
    end
end

always_comb begin
    nxt_ren = ruif.dmemREN;
    nxt_wen = ruif.dmemWEN;
    if(ruif.dhit) begin
        nxt_ren = 0;
        nxt_wen = 0;
    end
    if(ruif.ihit) begin
        nxt_ren = ruif.dREN;
        nxt_wen = ruif.dWEN;
    end
end
*/

assign ruif.pcEN = ruif.ihit;
assign ruif.imemREN = 1;

endmodule