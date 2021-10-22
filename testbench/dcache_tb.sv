/*
  Zhijing Yao
  yao192@purdue.edu

  dcache test bench
*/

// interface
`include "system_if.vh"
`include "cache_control_if.vh"
`include "caches_if.vh"
`include "datapath_cache_if.vh"

// types
`include "cpu_types_pkg.vh"


// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns
import cpu_types_pkg::*;
module dcache_tb;

  parameter PERIOD = 10;

  logic CLK = 0, nRST;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  caches_if cif();
  datapath_cache_if dcif();
  // test program
  test PROG (CLK, nRST);
  // DUT
`ifndef MAPPED
  dcache DUT(CLK, nRST, dcif, cif);
`else
  dcache DUT(
    .\dcif.halt (dcif.halt),
    .\dcif.dmemREN (dcif.dmemREN),
    .\dcif.dmemWEN (dcif.dmemWEN),
    .\dcif.dmemstore (dcif.dmemstore),
    .\dcif.dmemaddr (dcif.dmemaddr),
    .\dcif.dhit (dcif.dhit),
    .\dcif.dmemload (dcif.dmemload),
    .\dcif.flushed (dcif.flushed),
    .\cif.dwait (cif.dwait),
    .\cif.dload (cif.dload),
    .\cif.dREN (cif.dREN),
    .\cif.dWEN (cif.dWEN),
    .\cif.daddr (cif.daddr),
    .\cif.dstore (cif.dstore),
    .\nRST (nRST),
    .\CLK (CLK)
  );
`endif

endmodule

program test (input logic CLK, output logic nRST);
  // import word type
  import cpu_types_pkg::word_t;
  parameter PERIOD = 10;
  int test_case_num = 0;
  string test_case;
  int i;
  logic[2:0] index;

  initial 
  begin
    // *******************************************
    // Test Case 1: Power-on Reset of the DUT
    // *******************************************
    reset_bus();
    test_case_num += 1;
    test_case = "Reset dut";
    nRST = 0;
    @(posedge CLK);
    nRST = 1;
    
    #(PERIOD * 5);
    reset_bus();
    // *******************************************
    // Test Case 2: First read from cache
    // *******************************************
    test_case_num += 1;
    test_case = "Read from index 0 --Compulsory misses";
    cache_op(1'b1,1'b0, 26'd0, 3'd0,1'b0,2'b00);
    feed_data(32'hbeadbead,32'hbeadbea1);
    @(posedge CLK);
    
    reset_bus();
    #(PERIOD * 4);
    // *******************************************
    // Test Case 3: Read from index 0 block 1 
    // *******************************************
    //This should be a hit
    test_case_num += 1;
    test_case = "Read from index 0 block 1 ";
    cache_op(1'b1,1'b0, 26'd0, 3'd0,1'b1,2'b00);
    @(negedge CLK);
    reset_bus();
    #(PERIOD * 4); 
    
    // *******************************************
    // Test Case 4: Read from way 2
    // *******************************************
    //This should be a hit
    test_case_num += 1;
    test_case = "Read from index 0 with tag = 1 --Compulsory misses";
    cache_op(1'b1,1'b0, 26'd1, 3'd0,1'b0,2'b00);
    feed_data(32'hbeadbead,32'hbeadbea1);
    @(negedge CLK);
    reset_bus();
    #(PERIOD * 4); 

   // *******************************************
    // Test Case 5: Write to index 0, way 2
    // *******************************************
    test_case_num += 1;
    test_case = "Write to index 0, way 2";
    dcif.dmemstore = 32'hbabababa;
    cache_op(1'b0,1'b1, 26'd1, 3'd0,1'b0,2'b00);
    dcif.dmemstore = 32'hbbbbbaba;
    cache_op(1'b0,1'b1, 26'd0, 3'd0,1'b0,2'b00);
    reset_bus();
    #(PERIOD * 4); 

    // *******************************************
    // Test Case 6: Fill up whole cache
    // *******************************************
    test_case_num += 1;
    test_case = "Fill up whole cache";
    index = 3'h0;
    for (i = 1; i < 8 ;i++) begin
      index = index + 1;
      cache_op(1'b1,1'b0, 26'd0, index,1'b0, 2'b00);
      feed_data(32'hbeadbead,32'hbeadbea1);
      @(negedge CLK);
      dcif.imemREN = 0;
      cache_op(1'b1,1'b0, 26'd1, index, 1'b0,2'b00);
      feed_data(32'hbeadbead,32'hbeadbea1);
      @(negedge CLK);
      #(PERIOD * 1);
    end
    reset_bus();
    // *******************************************
    // Test Case 6: Flush when halted
    // *******************************************
    test_case_num += 1;
    test_case = "Revoke a write back ";
    cache_op(1'b1,1'b0, 26'd2, 3'b0, 1'b0, 2'b00);
    cif.dwait = 1'b1;
    #(PERIOD * 1);
    cif.dwait = 1'b0;
    #(PERIOD * 5);

    


  end
  task cache_op;
    input dmemREN;
    input dmemWEN;
    input [25:0]tag;
    input [2:0]index;
    input block_offset;
    input [1:0]byte_offset;
  begin
    dcif.dmemREN = dmemREN;
    dcif.dmemWEN = dmemWEN;
    dcif.dmemaddr = {tag,index,block_offset,byte_offset};
    @(posedge CLK);
  end
  endtask

  task feed_data;
    input [31:0]word1;
    input [31:0]word2;
  begin 
    cif.dwait = 1'b1;
    cif.dload = 32'hbad1bad1;
    @(posedge CLK);
    @(negedge CLK);

    cif.dwait = 1'b0;
    cif.dload = word1;
    @(negedge CLK);
    cif.dwait = 1'b1;
    cif.dload = 32'hbad1bad1;
    @(posedge CLK);
    @(negedge CLK);

    cif.dwait = 1'b0;
    cif.dload = word2;
    #(PERIOD * 1);
  end
  endtask

  task reset_bus;
    cif.dwait = '0;
    cif.dload = '0;
    dcif.halt = 0;
    dcif.dmemREN = 0;
    dcif.dmemWEN = 0;
    dcif.dmemstore = '0;
    dcif.dmemaddr = '0;
  endtask

  //$finish
endprogram