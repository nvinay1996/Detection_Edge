// $Id: $
// File name:   AHB_slave.sv
// Created:     4/15/2017
// Author:      Paul Swartz
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: AHB slave module
module AHB_slave
(
	input wire clk,
	input wire n_rst,
	input wire done,
	input wire [31:0] haddr,
	input wire hwrite,
	input reg [31:0] hwdata,
	output reg [31:0] hrdata,
	output reg hready,
	output reg [31:0] start_waddr,
	output reg [31:0] start_raddr,
	output reg [15:0] img_width,
	output reg [15:0] img_height,
	output reg [31:0] img_size,
	output reg [31:0] boundary_4
);
	reg [2:0] Q;	
	reg [2:0] nQ;
	reg [31:0] n_hrdata;
	reg [31:0] n_hready;
	reg [31:0] n_start_waddr;
	reg [31:0] n_start_raddr;
	reg [31:0] n_img_height;
	reg [31:0] n_img_width;
	reg [31:0] n_boundary_4;

	always_ff @(posedge clk, negedge n_rst) begin
		if(n_rst==0)begin
			hrdata<=0;
			hready<=0;
			start_waddr<=0;
			start_raddr<=0;
			img_height<=0;
			img_width<=0;
			boundary_4<=0;
			Q<=0;
		end
		else begin
			hrdata<=n_hrdata;
			hready<=n_hready;
			start_waddr<=n_start_waddr;
			start_raddr<=n_start_raddr;
			img_height<=n_img_height;
			img_width<=n_img_width;
			boundary_4<=n_boundary_4;
			Q<=nQ;
		end
	end
	always_comb begin
		nQ=0;
		if(haddr[1:0]==0&hwrite==1)
			nQ=3'b001;
		else if(haddr[1:0]==2'b01&hwrite==1)
			nQ=3'b010;
		else if(haddr[1:0]==2'b10&hwrite==1)
			nQ=3'b011;
		else if(haddr[1:0]==2'b11&hwrite==1)
			nQ=3'b101;
		else if(done)
			nQ=3'b100;
	end
	always_comb begin
		n_img_width=img_width;
		n_img_height=img_height;
		n_hready=0;
		n_hrdata=hrdata;
		n_start_raddr=start_raddr;
		n_start_waddr=start_waddr;
		if(Q==3'b001)begin
			n_img_width=hwdata[31:16];
			n_img_height=hwdata[15:0];
			n_hready=1;
		end
		else if(Q==3'b010)begin	
			n_start_raddr=hwdata;
			n_hready=1;
		end
		else if(Q==3'b011)begin
			n_start_waddr=hwdata;
			n_hready=1;
			n_hrdata=32'b11111111111111111111111111111111;
		end
		else if(Q==3'b100)begin
			n_hrdata=0;
		end
		else if(Q==3'b101)begin
			n_boundary_4=hwdata;
			n_hready=1;
		end
	end
endmodule
