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
    
    if(!huif.flushed && ((huif.idex_opcode == LW)) && ~huif.dhit) begin
        //if(((huif.rs == huif.exmem_write/*huif.idex_rt*/) || (huif.rt == huif.exmem_write/*huif.idex_rt*/))) begin
            huif.ifid_stall = 1;
            huif.idex_stall = 1;
            huif.exmem_stall = 1;
        //end
    end
    if((huif.idex_opcode == SW) && !huif.flushed && ~huif.dhit) begin
        huif.ifid_stall = 1;
        huif.idex_stall = 1;
        huif.exmem_stall = 1;
    end

    //huif.idex_stall = (huif.hazard == R_EXMEM_NO_DATA) | (huif.hazard == R_IDEX_NO_DATA);
    //huif.ifid_stall = (huif.hazard == R_EXMEM_NO_DATA) | (huif.hazard == R_IDEX_NO_DATA);
end   


endmodule
