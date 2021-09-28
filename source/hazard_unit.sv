`include "hazard_unit_if.vh"

module hazard_unit
import cpu_types_pkg::*;
(
    hazard_unit_if.pipe huif
);

assign huif.flushed = ((huif.PCsrc == 4) && ~huif.zero) || ((huif.PCsrc == 5) && huif.zero) || huif.PCsrc == 2 || huif.PCsrc == 3;


endmodule
