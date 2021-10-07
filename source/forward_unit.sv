`include "forward_unit_if.vh"
`include "pipe_types_pkg.vh"

module forward_unit
(
    forward_unit_if.pipe fuif
);
import cpu_types_pkg::*;
import pipe_types_pkg::*;

always_comb begin
    fuif.forwardA = '0;
    fuif.forwardB = '0;
    if(fuif.rs == fuif.exmem_write && fuif.exmem_RegWrite && fuif.exmem_write != 0) begin
        fuif.forwardA = 2'b01;
    end
    else if(fuif.rs == fuif.memwb_write && fuif.memwb_RegWrite && fuif.memwb_write != 0) begin
        fuif.forwardA = 2'b10;
    end
    if(fuif.rt == fuif.exmem_write && fuif.exmem_RegWrite && fuif.exmem_write != 0) begin
        fuif.forwardB = 2'b01;
    end
    else if(fuif.rt == fuif.memwb_write && fuif.memwb_RegWrite && fuif.memwb_write != 0) begin
        fuif.forwardB = 2'b10;
    end
end

endmodule
