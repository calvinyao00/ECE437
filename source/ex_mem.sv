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
    next_ex_mem_out.newPc = exmemif.ex_mem_in.newPc;
    next_ex_mem_out.RegWrite = exmemif.ex_mem_in.RegWrite;
    next_ex_mem_out.RegSrc = exmemif.ex_mem_in.RegSrc;
    next_ex_mem_out.halt = exmemif.ex_mem_in.halt;
    next_ex_mem_out.aluOut = exmemif.ex_mem_in.aluOut;
    next_ex_mem_out.pc = exmemif.ex_mem_in.pc;
    next_ex_mem_out.BrAddr = exmemif.ex_mem_in.BrAddr;
    next_ex_mem_out.pcPlusFour = exmemif.ex_mem_in.pcPlusFour;
    next_ex_mem_out.imemload = exmemif.ex_mem_in.imemload;
    next_ex_mem_out.dmemaddr = exmemif.ex_mem_in.dmemaddr;
    next_ex_mem_out.dmemstore = exmemif.ex_mem_in.dmemstore;
    next_ex_mem_out.RegDst = exmemif.ex_mem_in.RegDst;
    next_ex_mem_out.flagZero = exmemif.ex_mem_in.flagZero;
    next_ex_mem_out.jal = exmemif.ex_mem_in.jal;
    next_ex_mem_out.func = exmemif.ex_mem_in.func;
    next_ex_mem_out.opcode = exmemif.ex_mem_in.opcode;
    next_ex_mem_out.rd = exmemif.ex_mem_in.rd;
    next_ex_mem_out.rt = exmemif.ex_mem_in.rt;
    next_ex_mem_out.rs = exmemif.ex_mem_in.rs;
    next_ex_mem_out.pcsrc = exmemif.ex_mem_in.pcsrc;
    next_ex_mem_out.imm16 = exmemif.ex_mem_in.imm16;
    next_ex_mem_out.shamt = exmemif.ex_mem_in.shamt;
    if (exmemif.dhit) begin
      exmemif.stallDmem = 1'b0;
      next_ex_mem_out.dWEN  = 0;
      next_ex_mem_out.dREN  = 0;
    end
    else begin
    //if (exmemif.ihit) begin
      exmemif.stallDmem = 1'b1;
      next_ex_mem_out.dWEN  = exmemif.ex_mem_in.dWEN;
      next_ex_mem_out.dREN  = exmemif.ex_mem_in.dREN;
    end
  end
endmodule
