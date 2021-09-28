// interface
`include "cpu_types_pkg.vh"

`include "pipe_types_pkg.vh"
`include "mem_wb_if.vh"
module mem_wb (
  input logic CLK, nRST, 
  mem_wb_if.mem_wb memwbif
);
  import cpu_types_pkg::*;
  import pipe_types_pkg::*;
  mem_wb_t next_mem_wb_out;
  always_ff @ (posedge CLK, negedge nRST) 
		begin: REG_LOGIC
	  	if(1'b0 == nRST) begin
            memwbif.mem_wb_out <= '0;
	  	end
	  	else begin
            if(1'b1 == memwbif.flushed) memwbif.mem_wb_out <= '0;
            else begin
                memwbif.mem_wb_out <= next_mem_wb_out;
            end
	  	end
  end
  always_comb begin : CONTROL_LOGIC
    if (memwbif.EN) begin
      next_mem_wb_out = memwbif.mem_wb_in;
    end
    else
      begin
      next_mem_wb_out = memwbif.mem_wb_out;
    end
    
  end
endmodule