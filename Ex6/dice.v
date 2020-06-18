//////////////////////////////////////////////////////////////////////////////////
// Exercise #4 
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design an electronic dice, following
//  the diagram provided in the exercises documentation. The dice rolls as long as
//  a button is pressed, and stops when it is released. 
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           throw [2:0]
//
//  You need to write the whole file.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module dice(input clk,
	input rst,
	input button,
	output [2:0]throw);

  reg [2:0]throw;

always @(posedge clk or posedge rst) begin
	     if  (rst ==0)begin
	   	   if (button == 1)begin
				  if (throw == 3'b0||3'b001||3'b010||3'b011||3'b100||3'b101||3'b110)
				  throw <= throw + 1;
				  else 
				  throw <= 3'b001;
			          end 
	           else begin 
			  if (throw == 3'b001||3'b010||3'b011||3'b100||3'b101||3'b110)
				  throw <= throw;
				  else 
				  throw <= 3'b001;
			          end 
	    end 
	    else 
		 throw <= 3'b000;
end 	

endmodule 
