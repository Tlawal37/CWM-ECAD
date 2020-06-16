//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Up/Down counter
// Student Name:Taiye Lawal
// Date: 16/06/2020
//
// Description: A testbench module to test Ex3 - counter
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
parameter CLK_PERIOD = 10;

//Todo: Regitsers and wires
reg clk;
reg rst;
reg enable;
reg direction;
reg err;


wire counter_out[7:0];

//Todo: Clock generation
initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end

//Todo: User logic
initial begin 
  clk = 0;
  rst = 0;
  enable = 0;
  direction  = 0;
  err = 0;
  counter_out = 8'b0010;

 	forever begin
         #CLK_PERIOD
         if ((counter_out!) begin
           if (counter_out==8'b0000)
           begin
             $display("***TEST FAILED! rst ==%d, counter is meant to reset when rst=1***",rst[0]);
             err=1;
           end
         end 
         else if (counter_out == 8'b0001)begin
           $display("***TEST FAILED! Counting backwards output is %b. expected output is 8'b0011",counter_out);
           err=1;
         end
         else if (counter_out == 8'b0010)begin
           $display("***TEST FAILED! enable is %d yet output stays the same",enable);
           err=1;
         end
	else begin
           $display("***TEST FAILED! out is %b. Have you written any code yet?***",counter_out);
           err=1;
         end
       end
     end
//Todo: Finish test, check for success

initial begin
        #50 
        if (err==0)
          $display("***TEST PASSED! :) ***");
        $finish;
      end

//Todo: Instantiate counter module
counter top (.clk(clk),
		. rst(rst),
		. direction(direction),
		. enable(enable),
		. counter_out(counter_out));
 
endmodule 
