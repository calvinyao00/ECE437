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
    
    /*if(huif.idex_RegWrite) begin
        if(huif.idex_rd != 0 && huif.idex_opcode == RTYPE) begin
            if(huif.rs == huif.idex_rd || huif.rt == huif.idex_rd) huif.hazard = R_IDEX_NO_DATA;
        end
        else if(huif.idex_rt != 0 && huif.idex_opcode != RTYPE) begin
            if(huif.rs == huif.idex_rt || huif.rt == huif.idex_rt) huif.hazard = R_IDEX_NO_DATA;
        end
    end
    if(huif.exmem_RegWrite) begin
        if(huif.exmem_rd != 0 && huif.exmem_opcode == RTYPE) begin
            if(huif.rs == huif.exmem_rd || huif.rt == huif.exmem_rd) huif.hazard = R_EXMEM_NO_DATA;
        end
        else if(huif.exmem_rt != 0 && huif.exmem_opcode != RTYPE) begin
            if(huif.rs == huif.exmem_rt || huif.rt == huif.exmem_rt) huif.hazard = R_EXMEM_NO_DATA;
        end
    end*/

    /*if((huif.exmem_opcode == LW || huif.exmem_opcode == SW) & ~huif.dhit) begin
        if(((huif.rs == huif.exmem_write) || (huif.rt == huif.exmem_write))) begin
            huif.ifid_stall = 1;
            huif.idex_stall = 1;
        end
    end
    else if((huif.idex_opcode == LW || huif.idex_opcode == SW) & ~huif.dhit) begin
        //if(huif.idex_rt) begin
            //if(huif.rs == huif.idex_rt || huif.rt == huif.idex_rt) begin
                huif.ifid_stall = 1;
                huif.idex_stall = 1;
            //end
        //end
    end*/
    if(!huif.flushed && ((huif.exmem_opcode == LW) || (huif.exmem_opcode == SW)) && ~huif.dhit) begin
        if(((huif.rs == huif.exmem_write) || (huif.rt == huif.exmem_write))) begin
            huif.ifid_stall = 1;
            huif.idex_stall = 1;
        end
        /*if(((huif.rs == huif.idex_rt) || (huif.rt == huif.idex_rt))) begin
            huif.ifid_stall = 1;
            huif.idex_stall = 1;
        end*/
    end

    //huif.idex_stall = (huif.hazard == R_EXMEM_NO_DATA) | (huif.hazard == R_IDEX_NO_DATA);
    //huif.ifid_stall = (huif.hazard == R_EXMEM_NO_DATA) | (huif.hazard == R_IDEX_NO_DATA);
end   

/* assign huif.exmem_stall = 0;
    assign huif.memwb_stall = 0;
    assign huif.ifid_stall = 0;
    assign huif.idex_stall = 0; */

endmodule
