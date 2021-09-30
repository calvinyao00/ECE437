`include "hazard_unit_if.vh"
`include "pipe_types_pkg.vh"

module hazard_unit
(
    hazard_unit_if.pipe huif
);
import cpu_types_pkg::*;
import pipe_types_pkg::*;
assign huif.flushed = ((huif.PCsrc == 4) && ~huif.zero) || ((huif.PCsrc == 5) && huif.zero) || huif.PCsrc == 2 || huif.PCsrc == 3;

always_comb begin 
    huif.hazard = NO_HAZARD;
    huif.exmem_stall = 0;
    huif.memwb_stall = 0;
    huif.ifid_stall = 0;
    huif.idex_stall = 0;
    
    if(huif.opcode == RTYPE) begin
        if (huif.idexRegWrite) begin
            if(huif.rs == huif.idex_rd || huif.rt == huif.idex_rd) huif.hazard = R_IDEX_NO_DATA;
        end
        else if(huif.exmemRegWrite) begin
            if(huif.rs == huif.exmem_rd || huif.rt == huif.exmem_rd) huif.hazard = R_EXMEM_NO_DATA;
        end
    end
    else begin
        if (huif.idexRegWrite) begin
            if(huif.rs == huif.idex_rt || huif.rt == huif.idex_rt) huif.hazard = R_IDEX_NO_DATA;
        end
        else if(huif.exmemRegWrite) begin
            if(huif.rs == huif.exmem_rt || huif.rt == huif.exmem_rt) huif.hazard = R_EXMEM_NO_DATA;
        end
    end
    /* else if(huif.RegWrite)begin 
        if(huif.rs == huif.exmem_rt) begin
            huif.hazard = R_EXMEM_NO_DATA;
        end
        else if(huif.rs == huif.idex_rt) begin
            huif.hazard = R_IDEX_NO_DATA;
        end
    end */
    /* else if (huif.opcode == LW) begin
        if(huif.rs == huif.idex_rd) huif.hazard = R_IDEX_NO_DATA;
    end
    else if (huif.opcode == SW) begin
        if(huif.rs == huif.idex_rd || huif.rt == huif.idex_rd) huif.hazard = R_IDEX_NO_DATA;
    end */
//    else if (huif.opcode == RTYPE && huif.PCsrc == 2'd2) begin
//        if(huif.rs == huif.exmem_rd) huif.hazard = JR_EXMEM_NO_DATA;
//        else if(huif.rs == huif.idex_rd) huif.hazard = JR_IDEX_NO_DATA;
//    end 
    huif.idex_stall = (huif.hazard == R_EXMEM_NO_DATA);
    huif.ifid_stall = (huif.hazard == R_IDEX_NO_DATA) | huif.idex_stall;
end   

/* assign huif.exmem_stall = 0;
    assign huif.memwb_stall = 0;
    assign huif.ifid_stall = 0;
    assign huif.idex_stall = 0; */

endmodule
