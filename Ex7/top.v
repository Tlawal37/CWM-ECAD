//////////////////////////////////////////////////////////////////////////////////
// Exercise #7
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to implement a times table of 0..7x0..7
//  using a memory.
//
//  inputs:
//           clk, a[2:0], b[2:0]
//
//  outputs:
//           result[4:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps



module times_tables(
	input read,
	input clk, enable,
	input [2:0] a, b,
	output [5:0] result);


	wire [2:0] a;
	wire [2:0] b;



mybram multiplier(
  .clka(clk),    	// input wire clka
  .ena(enable),      	// input wire ena
  .wea(0),      	// input wire [0 : 0] wea
  .addra({a, b}), 	// input wire [5 : 0] addra
  .dina(result),  	// input wire [5 : 0] dina
  .douta(result)  	// output wire [5 : 0] douta
);


endmodule 
