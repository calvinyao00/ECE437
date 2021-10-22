// interfaces
`include "datapath_cache_if.vh"
`include "caches_if.vh"

// cpu types
`include "cpu_types_pkg.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module icache_tb;

  parameter PERIOD = 10;

  logic CLK = 0, nRST;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  datapath_cache_if dcif();
  caches_if cif();
  // test program
  test #(.PERIOD (PERIOD)) PROG (CLK, nRST);
  // DUT
`ifndef MAPPED
  icache DUT(CLK, nRST, dcif, cif);
`else
  icache DUT(
    .\dcif.imemREN (dcif.imemREN),
    .\dcif.imemaddr (dcif.imemaddr),
    .\dcif.ihit (dcif.ihit),
    .\dcif.imemload (dcif.imemload),
    .\cif.iwait (cif.iload),
    .\cif.iREN (cif.iAddr),
    .\nRST(nRST),
    .\CLK (CLK)
  );
`endif

endmodule

program test
(
  input logic CLK,
  output logic nRST
);
parameter PERIOD = 10;
int test_case_num = 0;
string test_case;
int i = 0;
logic [3:0] index;
initial begin
  //initialize signals
  dcif.imemREN = 0;
  dcif.dmemWEN = 0;
  dcif.dmemREN = 0;
  cif.iload = '0;
  cif.iwait = 0;

  // *******************************************
  // Test Case 1: Power-on Reset of the DUT
  // *******************************************
  test_case_num += 1;
  test_case = "Reset dut";
  reset_dut;
 // *******************************************
  // Test Case 2: First read from cache
  // *******************************************
  test_case_num += 1;
  test_case = "Compulsory misses";
  read_cache(1'b1, 26'd0, 4'd0, 2'b00);
  feed_intr(32'hbeadbead);
  
  dcif.imemREN = 0;
  #(PERIOD * 4);
  read_cache(1'b1, 26'd0, 4'd1, 2'b00);
  feed_intr(32'hbeadbea1);
  dcif.imemREN = 0;
  #(PERIOD * 4);
  //*******************************************
  // Test Case 3: Conflict at index 0
  // *******************************************
  test_case_num += 1;
  test_case = "Conflict at index 0";
  read_cache(1'b1, 26'd1, 4'd0, 2'b00);
  feed_intr(32'hbeefbeef);
  #(PERIOD * 4);
  //*******************************************
  // Test Case 4: Read value at index 1
  // *******************************************
  test_case_num += 1;
  test_case = "Read From Index 1";
  read_cache(1'b1, 26'd0, 4'd1, 2'b00);
  #(PERIOD * 5);
  //*******************************************
  // Test Case 5: Read  value at index 0
  // *******************************************
  test_case_num += 1;
  test_case = "Read From Index 0";
  read_cache(1'b1, 26'd1, 4'd0, 2'b00);
  #(PERIOD * 5);
  
  //*******************************************
  // Test Case 6: Fecth while doing data operations
  // *******************************************
  test_case_num += 1;
  test_case = "instr fetch With dREN asserted";
  
  dcif.dmemREN = 1;
  read_cache(1'b1, 26'd1, 4'd0, 2'b00);
  feed_intr(32'hbeefbeef);
  #(PERIOD * 2);
  dcif.dmemREN = 0;
  #(PERIOD * 3);
  // *******************************************
  // Test Case 7: Fill up whole cache
  // *******************************************
  test_case_num += 1;
  test_case = "Fill up whole cache";
  index = 4'h1;
  for (i = 2; i < 16 ;i++) begin
    index = index + 1;
    read_cache(1'b1, 26'd0, index, 2'b00);
    feed_intr(32'hbeadbead);
    dcif.imemREN = 0;
    #(PERIOD * 2);
  end
  //*******************************************
  // Test Case 8: Conflict at index 0
  // *******************************************
  test_case_num += 1;
  test_case = "Conflict at index 15";
  read_cache(1'b1, 26'd1, 4'hf, 2'b00);
  feed_intr(32'hbeefbeef);
  #(PERIOD * 4);
  
  //*******************************************
  // Test Case 8: Conflict at index 0
  // *******************************************
  test_case_num += 1;
  test_case = "Halted";
  dcif.halt = 1;
  #(PERIOD * 4);

end
task reset_dut;
begin
  nRST = 1'b0;
  @(posedge CLK);
  @(negedge CLK);
  nRST = 1'b1;
  @(negedge CLK);
  @(negedge CLK);
end
endtask

task read_cache;
  input imemREN;
  input [25:0]tag;
  input [3:0]index;
  input [1:0]byte_offset;
begin
  dcif.imemREN = imemREN;
  dcif.imemaddr = {tag,index,byte_offset};
end
endtask

task feed_intr;
  input [31:0]iload;
begin 
  cif.iwait = 1'b1;
  cif.iload = 32'hbad1bad1;
  @(posedge CLK);
  @(negedge CLK);
  cif.iwait = 1'b0;
  cif.iload = iload;
  #(PERIOD * 1);
  
end
endtask
  
endprogram