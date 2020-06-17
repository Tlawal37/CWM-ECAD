//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Traffic Lights
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex5 - Traffic Lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
parameter CLK_PERIOD = 10;


//Todo: Regitsers and wires
reg clk;
wire red;
wire yellow;
wire amber;
reg err;
reg [2:0]state;

//Todo: Clock generation
initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end

//Todo: User logic
initial begin 
state<=3'b001;
err<=0;

forever begin
	state<=3'b100;
	#CLK_PERIOD
         if (state!==3'b110)begin
          	   $display("***RED TO AMBER GREEN TEST 1 FAILED!***");
          	   err=1;
		end 
	else 
		   err = 0;
	#CLK_PERIOD
	state<=3'b110;
	#CLK_PERIOD
         if (state!==3'b001)begin
          	   $display("*** AMBER GREEN TO GREEN TEST 1 FAILED!***");
          	   err=1;
		end 
	else 
		   err = 0;
	#CLK_PERIOD
	state<=3'b001;
	#CLK_PERIOD
         if (state==3'b010)begin
          	   $display("***GREEN TO AMBER TEST 1 FAILED!***");
          	   err=1;
		end 
	else 
		   err = 0;
	#CLK_PERIOD
	state<=3'b010;
	#(CLK_PERIOD)
         if (state!==3'b100)begin
          	   $display("***AMBER TO RED TEST 1 FAILED!***");
          	   err=1;
		end 
	else 
		   err = 0;
	#CLK_PERIOD
	state<=3'b000;
	#CLK_PERIOD
         if (state!==3'b001)begin
          	   $display("***ILLEGAL STATE TEST 1 FAILED!***");
          	   err=1;
		end 
	else 
		   err = 0;
	#CLK_PERIOD
	state<=3'b101;
	#CLK_PERIOD
         if (state!==3'b001)begin
          	   $display("***ILLEGAL STATE TEST 1 FAILED!***");
          	   err=1;
		end 
	else 
		   err = 0;
	#CLK_PERIOD
	state<=3'b011;
	#CLK_PERIOD
         if (state!==3'b001)begin
          	   $display("***ILLEGAL STATE TEST 1 FAILED!***");
          	   err=1;
		end 
	else 
		   err = 0;
	#CLK_PERIOD
	state<=3'b111;
	#CLK_PERIOD
         if (state!==3'b001)begin
          	   $display("***ILLEGAL STATE TEST 1 FAILED!***");
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
	traffic top (.clk(clk),
		.red(red),
		.amber(amber),
		.yellow(yellow));
 
endmodule

