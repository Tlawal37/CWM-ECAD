//////////////////////////////////////////////////////////////////////////////////
// Exercise #2 
// Student Name:Taiye Lawal
// Date: 15/06/2020
//
//  Description: In this exercise, you need to design a multiplexer, where the  
//  output acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | a
//   1  | b
//
//  inputs:
//           a, b, sel
//
//  outputs:
//           out
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module mux(a,b,sel,out);
    //Todo: define inputs here
	input a;
	input b;
 	input sel;
	output out;
    
    //Todo: define registers and wires here
 

	reg r;

	always @(posedge clock)
		r<= sel;
	


    //Todo: define your logic here 
	assign out = a?r == 0:b
      
endmodule
