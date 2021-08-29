`include "register_file_if.vh"

module register_file (
  input logic CLK,
  input logic nRST,
  register_file_if.rf rfif
);

logic [31:0] [31:0] regis;
logic [31:0] [31:0] nxt_reg;

always_ff @ (posedge CLK) begin
  if(!nRST) begin
    regis <= '0;
  end
  else begin
    regis <= nxt_reg;
  end
end

always_comb begin
  nxt_reg[31:1] = regis[31:1];
  nxt_reg[0] = '0;
  if(rfif.WEN && rfif.wsel) begin
    nxt_reg[rfif.wsel] = rfif.wdat;
  end
  rfif.rdat1 = regis[rfif.rsel1];
  rfif.rdat2 = regis[rfif.rsel2];
end

endmodule

