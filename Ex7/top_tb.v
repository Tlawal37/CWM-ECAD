//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Times Table
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex7 - Times Table
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
    );
    
    //Parameters
    parameter CLK_PERIOD = 10;

    //Registers and wires
    reg clk;
    reg enable;
    reg [2:0]a;
    reg [2:0]b;
    reg err;
    wire [5:0]result;
    
    //Clock generation
    initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end
    
     //Stimulus logic
     initial begin
 
       enable=0;
       err=0;
	a = 3'b000;
	b = 3'b000;
	
	forever begin 
	#CLK_PERIOD;
		if(result!==(a*b[8:3]))begin 
		  	   $display("*** TEST 1 FAILED! result is %d ***",result);
		  	   err=1;
			  end 
		 else
			   err = 0;
	a <= a+1;
	b<=b+1;
end
end 

initial begin
        #500 
        if (err==0)
          $display("***TEST PASSED! :) ***");
        $finish;
      end

    //User's module
    times_tables top (
     	.a(a),
    	.result(result),
	.b(b),
	.enable(enable),
	.clk(clk)); 
	
     
endmodule 


 
