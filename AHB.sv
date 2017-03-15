// $Id: $
// File name:   AHB.sv
// Created:     3/13/2017
// Author:      Paul Swartz, Chia-Hua Peng
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
	input wire [31:0] new_waddr,
	input wire [31:0] new_raddr,
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

	reg [31:0] n_haddr;
	reg [31:0] n_hrdata;
	reg [31:0] n_hwdata;	
	reg next_read_complete;
	reg next_hwrite;
	reg next_write_complete;

	// Output Registers
	always_ff @(posedge clk, negedge n_rst)
	begin
		if(n_rst == 0) begin
			haddr <= 32'b0;
			hrdata <= 32'b0;
			hwdata <= 32'b0;	
			read_complete <= 1'b0;
			hwrite <= 1'b0;
			write_complete <= 1'b0;	
		end else begin
			haddr <= n_haddr;
			hrdata <= n_hrdata;
			hwdata <= n_hwdata;	
			read_complete <= next_read_complete;
			hwrite <= next_hwrite;
			write_complete <= next_write_complete;			
		end
	end


	// FSM Register
	always_ff @(posedge clk, negedge n_rst)
	begin
		if(n_rst == 0)
			Q <= 0;
		else
			Q <= nQ;
	end

	// Next State and Output Logic
	always_comb
	begin
		// default output
		n_haddr = haddr;
		n_hrdata = hrdata;
		n_hwdata = hwdata;
		next_read_complete = read_complete;
		next_hwrite = hwrite;
		next_write_complete = write_complete;

		// default next state		
		nQ = Q;
		if(Q == 3'b000)	// IDLE
		begin
			if(re==1)
				nQ = 3'b001;
			else if(we==1)
				nQ = 3'b011;
		end			
		else if(Q == 3'b001) // READ
		begin
			next_hwrite = 0;
			n_haddr = new_raddr;
			n_hrdata = sram_data;
			if(hready==1)
				nQ = 3'b010;
		end 
		else if(Q == 3'b010) // NEXT_READ_ADDR
		begin
			next_read_complete = 1;
			nQ = 3'b000;
		end	
		else if(Q == 3'b011) // WRITE
		begin
			next_hwrite = 1;
			n_haddr = new_waddr;
			n_hwdata = buffer2_data;
			if(hready==1)
				nQ = 3'b100;
		end
		else if(Q == 3'b100) // NEXT_WRITE_ADDR
		begin
			next_write_complete = 1;
			nQ = 3'b000;
		end

		if (nQ == 3'b001)
			next_hwrite = 1'b0;
		if (nQ == 3'b011)
			next_hwrite = 1'b1;
	end
endmodule	
