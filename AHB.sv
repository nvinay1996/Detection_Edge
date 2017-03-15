// $Id: $
// File name:   AHB.sv
// Created:     3/13/2017
// Author:      Paul Swartz
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: AHB Bus
module AHB
(
	input wire clk,
	input wire n_rst,
	input wire hready,
	input wire re,
	input wire we,
	input wire [31:0] next_waddr,
	input wire [31:0] next_raddr,
	input wire [31:0] buffer2_data,
	input wire [31:0] sram_data,
	output reg [31:0] haddr,
	output reg [31:0] hrdata,
	output reg [31:0] hwdata,
	output reg read_complete,
	output reg hwrite,
	output reg write_complete
);
	reg [2:0] nQ;
	reg [2:0] Q;
	always_ff @(posedge clk, negedge n_rst)
	begin
		if(n_rst == 0)
			Q <= 0;
		else
			Q <= nQ;
	end
	always_comb
	begin
		hwrite = 0;
		haddr = 0;
		hrdata = 0;
		read_complete = 0;
		write_complete = 0;
		hwdata = 0;
		nQ = Q;
		if(Q == 3'b000)
		begin
			if(re==1)
				nQ = 3'b001;
			else if(we==1)
				nQ = 3'b011;
		end			
		else if(Q == 3'b001)
		begin
			hwrite = 0;
			haddr = next_raddr;
			hrdata = sram_data;
			if(hready==1)
				nQ = 3'b010;
		end 
		else if(Q == 3'b010)
		begin
			read_complete = 1;
			nQ = 3'b000;
		end	
		else if(Q == 3'b011)
		begin
			hwrite = 1;
			haddr = next_waddr;
			hwdata = buffer2_data;
			if(hready==1)
				nQ = 3'b100;
		end
		else if(Q == 3'b100)
		begin
			write_complete = 1;
			nQ = 3'b000;
		end
	end
endmodule	
