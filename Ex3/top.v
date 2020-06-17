//////////////////////////////////////////////////////////////////////////////////
// Exercise #3 
// Student Name:Taiye Lawal
// Date: 16/06/2020
//
//  Description: In this exercise, you need to design an up / down counter, where 
//  if the rst=1, the counter should be set to zero. If enable=0, the value
//  should stay constant. If direction=1, the counter should count up every
//  clock cycle, otherwise it should count down.
//  Wrap-around values are allowed.
//
//  inputs:
//           clk, rst, enable, direction
//
//  outputs:
//           counter_out[7:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module counter(input clk,
	input rst,
	input enable,
	input direction,
	output [7:0]counter_out);
                    
    //Todo: add registers and wires, if needed
	reg [7:0]counter_reg;
	wire [7:0]counter_out;

    //Todo: add user logic
	assign counter_out= counter_reg;
	always @(posedge clk)
		if (rst == 1)begin
			counter_reg<= 8'b0;
		end 
		else if (enable==0)begin 
			counter_reg<=counter_reg;
		end 
		else if (direction==1)begin 
			counter_reg<=counter_reg+1;
		end 
		else begin
			counter_reg<=counter_reg-1;
		end 
      
endmodule
