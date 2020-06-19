//////////////////////////////////////////////////////////////////////////////////
// Exercise #8
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to implement a times table of 0..7x0..7
//  using a memory and AXI-4-lite interface.
//
//  inputs:
//           clk, rst, a[2:0], b[2:0], read
//
//  outputs:
//           result[5:0]
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns/100ps



module times_tables(
	input read,
	input clk,
	input rst,
	input [2:0]a,
	input [2:0]b,
	output [5:0]result);

 wire [31:0]bigresult;
 assign result = bigresult[5:0];

blk_mem_gen_0 axi4 (
  .rsta_busy(rsta_busy),    		// output wire rsta_busy
  .rstb_busy(rstb_busy),        	// output wire rstb_busy
  .s_aclk(clk),	                	// input wire s_aclk
  .s_aresetn(rst),          		// input wire s_aresetn
  .s_axi_awaddr(32'h0),    		// input wire [31 : 0] s_axi_awaddr
  .s_axi_awvalid(32'h0),  		// input wire s_axi_awvalid
  .s_axi_awready(),  			// output wire s_axi_awready
  .s_axi_wdata(32'h0),      		// input wire [31 : 0] s_axi_wdata
  .s_axi_wstrb(4'h0),      		// input wire [3 : 0] s_axi_wstrb
  .s_axi_wvalid(1'b0),    		// input wire s_axi_wvalid
  .s_axi_wready(),    			// output wire s_axi_wready
  .s_axi_bresp(),      			// output wire [1 : 0] s_axi_bresp
  .s_axi_bvalid(),    			// output wire s_axi_bvalid
  .s_axi_bready(1'b1),    		// input wire s_axi_bready
  .s_axi_araddr({24'h0, a, b, 2'b00}),  // input wire [31 : 0] s_axi_araddr
  .s_axi_arvalid(read),  		// input wire s_axi_arvalid
  .s_axi_arready(s_axi_arready),  	// output wire s_axi_arready
  .s_axi_rdata(bigresult),      		// output wire [31 : 0] s_axi_rdata
  .s_axi_rresp(),      			// output wire [1 : 0] s_axi_rresp
  .s_axi_rvalid(s_axi_rvalid),    	// output wire s_axi_rvalid
  .s_axi_rready(1'b1)    		// input wire s_axi_rready
);


endmodule 
