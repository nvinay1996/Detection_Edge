// $Id: $
// File name:   AHB.sv
// Created:     3/13/2017
// Author:      Paul Swartz
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: AHB Bus
`timescale 1ns/100ps
module AHB
(
	input wire clk,
	input wire n_rst,
	input wire hready,
	input wire re,
	input wire we,
	input wire raddr_ready,
	input wire waddr_ready,
	input wire [31:0] waddr,
	input wire [31:0] raddr,
	input wire [31:0] buffer2_data,
	input wire [31:0] hrdata,
	output reg [31:0] greyscale_data,
	output reg [31:0] haddr,
	output reg [31:0] hwdata,
	output reg hwrite,
	output reg read_complete,
	output reg write_complete,
	output reg inc_raddr,
	output reg inc_waddr
);
	reg [2:0] nQ;
	reg [2:0] Q;
	reg [31:0] n_greyscale;
	reg [31:0] n_haddr;
	reg we_ff;
	reg n_we_ff;
	reg re_ff;
	reg n_re_ff;
	reg prev_hwrite;
	reg n_prev_hwrite;
	reg hready_ff;
	reg n_hready_ff;
	reg [31:0] n_hwdata;
	reg n_read_complete;
	reg n_write_complete;
	reg n_hwrite;
	reg init;
	reg n_init;
	reg init2;
	reg n_init2;

	//State Register
	always_ff @(posedge clk, negedge n_rst)
	begin
		if(n_rst == 0)
			Q <= 0;
		else
			Q <= nQ;
	end

	//Data Registers
	always_ff @(posedge clk, negedge n_rst)
	begin
		if(n_rst ==0)
		begin
			greyscale_data <= 0;
			haddr<=0;
			re_ff<=0;
			we_ff<=0;
			prev_hwrite<=0;
			hready_ff<=0;
			hwdata<=0;
			read_complete<=0;
			write_complete<=0;
			hwrite<=0;
			init<=0;
			init2<=0;
		end
		else
		begin 
			greyscale_data <= n_greyscale;
			haddr<=n_haddr;
			re_ff<=n_re_ff;
			we_ff<=n_we_ff;
			hready_ff<=n_hready_ff;
			prev_hwrite<=n_prev_hwrite;
			hwdata<=n_hwdata;
			read_complete<=n_read_complete;
			write_complete<=n_write_complete;
			hwrite<=n_hwrite;
			init<=n_init;
			init2<=n_init2;
		end
	end
	
	//Next State and Output Logic
	always_comb
	begin
		nQ=Q;
		n_init=init;
		n_read_complete=0;
		n_write_complete=0;
		n_hwrite=0;
		n_haddr=haddr;
		n_greyscale=greyscale_data;
		n_hwdata=hwdata;
		n_hready_ff=hready_ff;
		n_we_ff=we_ff;
		n_re_ff=re_ff;
		inc_waddr=0;
		inc_raddr=0;
		n_init2=init2;
		n_prev_hwrite=prev_hwrite;
		if(Q==3'b000) begin
			if(re_ff&hready_ff&prev_hwrite)
				nQ=3'b001;
			else if(we_ff&hready_ff&!prev_hwrite) 
				nQ=3'b010;
			else if(!prev_hwrite&re_ff)
				nQ=3'b011;
			else if(prev_hwrite&we_ff)
				nQ=3'b100;
			else if(waddr_ready)
				nQ=3'b101;
			else if(raddr_ready)
				nQ=3'b110;
		end
		else if(Q==3'b001)begin
			n_greyscale=hrdata;
			inc_raddr=1;
			n_read_complete=1;
			n_hready_ff=0;
			n_re_ff=0;
			n_prev_hwrite=1;
			nQ=0;
		end
		else if(Q==3'b010)begin
			n_prev_hwrite=0;
			inc_waddr=1;	
			n_hwdata=buffer2_data;
			n_hready_ff=0;
			n_we_ff=0;
			nQ=0;
		end
		else if(Q==3'b011)begin
			if(!init2)
				n_hready_ff=0;
			n_init2=0;
			n_prev_hwrite=1;
			n_haddr=raddr;
			nQ=0;
		end
		else if(Q==3'b100)begin
			n_hready_ff=0;
			n_prev_hwrite=0;
			n_haddr=waddr;
			nQ=0;
		end
		else if(Q==3'b101)begin
			n_haddr=waddr;
			n_hwrite=1;
			n_write_complete=1;
			nQ=0;
			if(!prev_hwrite&we_ff&hready_ff)
				nQ=3'b010;
		end
		else if(Q==3'b110)begin
			n_haddr=raddr;
			nQ=0;
		end
		if(!init)
			inc_raddr=1;
			n_init=1;
			n_init2=1;
		if(re)
			n_re_ff=1;
		if(we)
			n_we_ff=1;
		if(hready)
			n_hready_ff=1;
	end	
endmodule	
