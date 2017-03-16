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
	input wire [31:0] mcu_waddr,
	input wire [31:0] mcu_raddr,
	input wire [31:0] buffer2_data,
	input wire [31:0] hrdata,
	output reg [31:0] greyscale_data,
	output reg [31:0] haddr,
	output reg [31:0] hwdata,
	output reg hwrite,
	output reg read_complete,
	output reg write_complete
);
	reg [31:0] n_greyscale;
	reg [2:0] nQ;
	reg [2:0] Q;
	reg n_read_complete;

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
			read_complete <= 0;
		end
		else
		begin 
			greyscale_data <= n_greyscale;
			read_complete <= n_read_complete;
		end
	end
	
	//Next State and Output Logic
	always_comb
	begin
		hwrite = 0;
		haddr = 0;
		n_read_complete = 0;
		write_complete = 0;
		hwdata = 0;
		nQ = Q;
		n_greyscale = greyscale_data;

		if(Q == 3'b000) //IDLE
		begin
			if(re==1)
				nQ = 3'b001;
			else if(we==1)
				nQ = 3'b100;
		end			
		else if(Q == 3'b001) //READ ADDRESS PHASE
		begin
			hwrite = 0;
			haddr = mcu_raddr;
			nQ = 3'b010;
		end 
		else if(Q == 3'b010) //READ DATA PHASE
		begin
			n_greyscale = hrdata;
			if(hready==1)
			begin
				nQ = 3'b011;
				n_read_complete=1;
			end
		end	
		else if(Q == 3'b011) //READ COMPLETE
		begin
//			read_complete = 1;
			nQ = 3'b000;
		end
		else if(Q == 3'b100) //WRITE ADDRESS PHASE
		begin
			hwrite = 1;
			haddr = mcu_waddr;
			nQ = 3'b101;
		end
		else if(Q == 3'b101) //WRITE DATA PHASE
		begin
			hwdata = buffer2_data;
			if(hready == 1)
				nQ = 3'b110;
		end
		else if(Q == 3'b110) //WRITE COMPLETE
		begin
			write_complete = 1;
			nQ = 3'b000;
		end
	end
endmodule	
