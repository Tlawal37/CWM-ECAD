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
wire green;
wire amber;
reg err;
wire [2:0]state;

assign state = {red, amber, green};

//Todo: Clock generation
initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end

//Todo: User logic
initial begin 
err<=0;

forever begin
	#CLK_PERIOD
         if (state!==3'b001)begin
          	   $display("***RED TO AMBER GREEN TEST 1 FAILED! state is %d ***",state);
          	   err=1;
		end 
	else 
		   err = 0;
	#CLK_PERIOD
	
         if (state!==3'b010)begin
          	   $display("*** AMBER GREEN TO GREEN TEST 2 FAILED!state is %d ***",state);
          	   err=1;
		end 
	else 
		   err = 0;
	#CLK_PERIOD
	
         if (state!==3'b100)begin
          	   $display("***GREEN TO AMBER TEST 3 FAILED!state is %d ***",state);
          	   err=1;
		end 
	else 
		   err = 0;
	#CLK_PERIOD
	
         if (state!==3'b110)begin
          	   $display("***AMBER TO RED TEST 4 FAILED!state is %d ***",state);
          	   err=1;
		end 
	else 
		   err = 0;
	#CLK_PERIOD
	
         if (state!==3'b001)begin
          	   $display("***STATE TEST 5 FAILED!state is %d ***",state);
          	   err=1;
		end 
	else 
		   err = 0;
	
	#CLK_PERIOD
         if (state!==3'b010)begin
          	   $display("*** TEST 6 FAILED!state is %d ***",state);
          	   err=1;
		end 
	else 
		   err = 0;
	
	#CLK_PERIOD
         if (state!==3'b100)begin
          	   $display("***STATE TEST 7 FAILED!state is %d ***",state);
          	   err=1;
		end 
	else 
		   err = 0;
	
	#CLK_PERIOD
         if (state!==3'b110)begin
          	   $display("***STATE TEST 8 FAILED!state is %d ***",state);
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
		.green(green));
 
endmodule

