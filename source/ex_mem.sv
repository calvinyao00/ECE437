// interface
`include "cpu_types_pkg.vh"
`include "pipe_types_pkg.vh"
`include "ex_mem_if.vh"
module ex_mem (
  input logic CLK, nRST,
  ex_mem_if.ex_mem exmemif
);
  import cpu_types_pkg::*;
  import pipe_types_pkg::*;
  ex_mem_t next_ex_mem_out;
  always_ff @ (posedge CLK, negedge nRST) 
		begin: REG_LOGIC
	  	if(1'b0 == nRST) begin
            exmemif.ex_mem_out <= '0;
	  	end
	  	else begin
            if(exmemif.flushed) exmemif.ex_mem_out <= '0;
            else begin
                exmemif.ex_mem_out <= next_ex_mem_out;
            end
	  	end
  end
  always_comb begin : CONTROL_LOGIC
    if (exmemif.ex_mem_out.dWEN | exmemif.ex_mem_out.dREN) begin
      if(exmemif.dhit)begin
        next_ex_mem_out = exmemif.ex_mem_in;
      end
      else begin
        next_ex_mem_out = exmemif.ex_mem_out;
      end
    end
    else begin
      next_ex_mem_out = exmemif.ex_mem_in;
    end
    exmemif.stallDmem = exmemif.ex_mem_out.dWEN | exmemif.ex_mem_out.dREN;
  end
endmodule
