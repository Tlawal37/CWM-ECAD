//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Electronic Dice
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex4 - Electronic Dice
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
parameter CLK_PERIOD = 10;


//Todo: Regitsers and wires
reg clk;
reg rst;
reg button;
reg err;
wire [2:0]throw;

//Todo: Clock generation
initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end

//Todo: User logic
initial begin 
rst <= 1;
button<= 0;
err<=0;
#CLK_PERIOD
rst<=0;
button<= 1;

forever begin
         #(CLK_PERIOD*2)
         if (throw!==3'b010)begin
          	   $display("***INCREMENT TEST 1 FAILED!***");
          	   err=1;
		end 
	else 
		   err = 0;

	#CLK_PERIOD
	button<=0;
	#CLK_PERIOD
	if (throw!==3'b011)begin
          	   $display("***STOP COUNTING TEST FAILED!***");
          	   err=1;
		end 
	else 
		   err = 0;

	#CLK_PERIOD
	rst<=1;
	#CLK_PERIOD
	if (throw!==3'b000)begin
          	   $display("*** RESET TEST FAILED!***");
          	   err=1;
		end 
	else 
		   err = 0;
	#CLK_PERIOD
	rst<=0;
	button<=1;
	#(CLK_PERIOD*9)
	if (throw!==3'b001)begin
          	   $display("***2ND COUNTING TEST FAILED!***");
          	   err=1;
		end 
	else 
		   err = 0;
  end 
end 

//Todo: Finish test, check for success

	initial begin
        #150 
        if (err==0)
          $display("***TEST PASSED! :) ***");
        $finish;
      end

//Todo: Instantiate counter module
	dice top (.clk(clk),
		.rst(rst),
		.button(button),
		.throw(throw));
 
endmodule

