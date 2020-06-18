//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - Dice or Traffic Lights?
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex6 - Dice or Traffic Lights?
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
    //Parameters
    parameter CLK_PERIOD = 10;

    //Registers and wires
    reg clk;
    reg rst;
    reg button;
    reg sel;
    reg err;
    wire [2:0]result;
    
    //Clock generation
    initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end
    
     //Stimulus logic
     initial begin
       sel =1;
       rst =1;
       button=0;
       err=0;


       forever begin
	 #(CLK_PERIOD*3)
	rst <= 0;

		 if(result!==3'b100)begin 
		  	   $display("*** TEST 1 FAILED! result is %d ***",result);
		  	   err=1;
			  end 
		 else
			   err = 0;

	rst<=1;
	#(CLK_PERIOD)
	sel<= 0;
	rst<=0;
	button<= 1;
	#(CLK_PERIOD*2)//2*

		 if(result!==3'b010)begin 
		  	   $display("*** TEST 2 FAILED! result is %d ***",result);
		  	   err=1;
			end 
		 else
			   err = 0;

	end 
	end



      //Finish simulation and check for success
      initial begin
        #90 
        if (err==0)
          $display("***TEST PASSED! :) ***");
        $finish;
      end

    //User's module
    mux_dice_traffic top (
     	.clk(clk),
    	.rst(rst),
	.button(button),
	.sel(sel),
	.result(result)); 
	
     
endmodule 
