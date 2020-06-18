//////////////////////////////////////////////////////////////////////////////////
// Exercise #6 
// Student Name:Taiye 
// Date: 18/06/20
//
//
//  Description: In this exercise, you need to design a multiplexer between a dice and traffic 
//  lights, where the output acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | dice
//   1  | traffic lights
//
//  inputs:
//           rst, clk, button,sel
//
//  outputs:
//           result[2:0]
//
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 100ps

module mux_dice_traffic(rst,clk,button,sel,result);
    //Todo: define inputs here
	input rst; 
	input clk;
 	input button;
	input sel;
	output [2:0]result;
    
    //Todo: define registers and wires here
 	wire red;
	wire amber;
	wire green;
	wire [2:0]throw;
	

	
	assign  result = (sel==0)?throw:{red, amber, green};
	 
	
	dice the_dice(.rst(rst),.clk(clk),.button(button),.throw(throw));

	traffic the_traffic(.clk(clk),.red(red),.amber(amber),.green(green)); 

endmodule

