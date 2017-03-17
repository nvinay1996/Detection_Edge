// $Id: $
// File name:   mcu.sv
// Created:     3/16/2017
// Author:      Chia-Hua Peng
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: main control unit


module mcu
(
	input clk,
	input n_rst,
	input i_stop,
	input i_read_complete,
	input i_grayscale_data_ready,
	input i_b1_full,
	input i_gradient_data_ready,
	input i_start_next_write,
	input i_write_complete,
	input i_b2_empty,
	output reg [31:0] o_mcu_raddr,
	output reg o_re,
	output reg o_grayscale_start,
	output reg o_b1_save,
	output reg o_b1_clear,
	output reg o_gradient_start,
	output reg o_b2_save,
	output reg [31:0] o_mcu_waddr,
	output reg o_we,
	output reg o_complete
);

// address logic
reg [31:0] n_mcu_raddr;
reg [31:0] n_mcu_waddr;

// read address counter
reg [2:0] rct1, n_rct1;
reg [2:0] rct2, n_rct2;
reg [7:0] rct3, n_rct3;

// write address counter
reg [1:0] wct1, n_wct1;
reg [1:0] wct2, n_wct2;
reg [7:0] wct3, n_wct3;
reg [7:0] wct4, n_wct4;

reg n_re, n_grayscale_start, n_b1_save, n_b1_clear, n_gradient_start, n_b2_save, n_we;

typedef enum logic [5:0] {IDLE, R_CON_1, R_CON_2, R_CON_3, READ_ADDR_1, READ_ADDR_2, READ_ADDR_3, READ_ADDR_4, READ_EN, WAIT_READ,  			  // read stages
			  GRAY_START, WAIT_GRAY, B1_SAVE, B1_WAIT_1, B1_WAIT_2, EDGE_START, WAIT_EDGE, B2_SAVE, 			   		   			  // computation stages
			  B2_WAIT, W_CON_1, W_CON_2, W_CON_3, WRITE_ADDR_1, WRITE_ADDR_2, WRITE_ADDR_3, WRITE_ADDR_4, WRITE_EN, WAIT_WRITE, CHK_B2_DONE,  // write stages
			  OVERALL_DONE_CHK} state_type;
state_type curr, next;


// output registers
always_ff @ (posedge clk, negedge n_rst)
begin
	if (n_rst == 0) begin
		o_re <= 1'b0;
		o_grayscale_start <= 1'b0;
		o_b1_save <= 1'b0;
		o_b1_clear <= 1'b0;
		o_gradient_start <= 1'b0;
		o_b2_save <= 1'b0;
		o_we <= 1'b0;
	end else begin
		o_re <= n_re;
		o_grayscale_start <= n_grayscale_start;
		o_b1_save <= n_b1_save;
		o_b1_clear <= n_b1_clear;
		o_gradient_start <= n_gradient_start;
		o_b2_save <= n_b2_save;
		o_we <= n_we;
	end
end

// address logic registers
always_ff @ (posedge clk, negedge n_rst)
begin
	if (n_rst == 0) begin
		o_mcu_raddr <= 32'b0;
		o_mcu_waddr <= 32'b0;
	end else begin
		o_mcu_raddr <= n_mcu_raddr;
		o_mcu_waddr <= n_mcu_waddr;
	end
end

// address counter registers
always_ff @ (posedge clk, negedge n_rst)
begin
	if (n_rst == 0) begin
		rct1 <= 3'b0;
		rct2 <= 3'b0;
		rct3 <= 8'b0;
		wct1 <= 2'b0;
		wct2 <= 2'b0;
		wct3 <= 8'b0;
		wct4 <= 8'b0;
	end else begin
		rct1 <= n_rct1;
		rct2 <= n_rct2;
		rct3 <= n_rct3;
		wct1 <= n_wct1;
		wct2 <= n_wct2;
		wct3 <= n_wct3;
		wct4 <= n_wct4;
	end
end

// FSM register
always_ff @ (posedge clk, negedge n_rst)
begin
	if (n_rst == 0) begin
		curr <= IDLE;
	end else begin
		curr <= next;
	end
end

// Next State Logic
always_comb
begin
	next = curr;
	case (curr)
		IDLE:
		begin
			if (!i_stop)
				next = R_CON_1;
			else
				next = IDLE;
		end
		R_CON_1:
		begin
			if (rct1 == 3'd5)
				next = R_CON_2;
			else
				next = READ_ADDR_1;
		end
		R_CON_2:
		begin
			if (rct2 == 3'd5)
				next = R_CON_3;
			else
				next = READ_ADDR_2;
		end
		R_CON_3:
		begin
			if (rct3 == 8'd200)
				next = READ_ADDR_4;
			else
				next = READ_ADDR_3;
		end
		READ_ADDR_1:
		begin
			next = READ_EN;
		end
		READ_ADDR_2:
		begin
			next = READ_EN;
		end
		READ_ADDR_3:
		begin
			next = READ_EN;
		end
		READ_ADDR_4:
		begin
			next = READ_EN;
		end
		READ_EN:
		begin
			next = WAIT_READ;
		end
		WAIT_READ:
		begin
			if (i_read_complete)
				next = GRAY_START;
			else
				next = WAIT_READ;
		end
		GRAY_START:
		begin
			next = WAIT_GRAY;
		end
		WAIT_GRAY:
		begin
			if (i_grayscale_data_ready)
				next = B1_SAVE;
			else
				next = WAIT_GRAY;
		end
		B1_SAVE:
		begin
			next = B1_WAIT_1;
		end
		B1_WAIT_1:
		begin
			next = B1_WAIT_2;
		end
		B1_WAIT_2:
		begin
			if (!i_b1_full)
				next = R_CON_1;
			else
				next = EDGE_START;
		end
		EDGE_START:
		begin
			next = WAIT_EDGE;
		end
		WAIT_EDGE:
		begin
			if (i_gradient_data_ready)
				next = B2_SAVE;
			else
				next = WAIT_EDGE; 
		end
		B2_SAVE:
		begin
			next = B2_WAIT;
		end
		B2_WAIT:
		begin
			if (i_start_next_write)
				next = W_CON_1;
			else
				next = B2_WAIT;
		end
		W_CON_1:
		begin
			if (wct1 == 2'd3)
				next = W_CON_2;
			else
				next = WRITE_ADDR_1;
		end
		W_CON_2:
		begin
			if (wct2 == 2'd3)
				next = W_CON_3;
			else
				next = WRITE_ADDR_2;
		end
		W_CON_3:
		begin
			if (wct3 == 8'd200)
				next = WRITE_ADDR_4;
			else
				next = WRITE_ADDR_3;
		end
		WRITE_ADDR_1:
		begin
			next = WRITE_EN;
		end
		WRITE_ADDR_2:
		begin
			next = WRITE_EN;
		end
		WRITE_ADDR_3:
		begin
			next = WRITE_EN;
		end
		WRITE_ADDR_4:
		begin
			next = WRITE_EN;
		end
		WRITE_EN:
		begin
			next = WAIT_WRITE;
		end
		WAIT_WRITE:
		begin
			if (i_write_complete)
				next = CHK_B2_DONE;
			else
				next = WAIT_WRITE;
		end
		CHK_B2_DONE:
		begin
			if (!i_b2_empty)
				next = B2_WAIT;
			else
				next = OVERALL_DONE_CHK;
		end
		OVERALL_DONE_CHK:
		begin
			if (wct4 == 8'd200)
				next = OVERALL_DONE_CHK;
			else
				next = IDLE;
		end
	endcase
end

// Output Logic
always_comb
begin
	n_mcu_raddr = o_mcu_raddr;
	n_mcu_waddr = o_mcu_waddr;
	n_rct1 = rct1;
	n_rct2 = rct2;
	n_rct3 = rct3;
	n_wct1 = wct1;
	n_wct2 = wct2;
	n_wct3 = wct3;
	n_wct4 = wct4;

	n_re = 0;
	n_grayscale_start = 0;
	n_b1_save = 0;
	n_gradient_start = 0;
	n_b2_save = 0;
	n_we = 0;

	o_complete = 1'b0;

	case (curr)
		R_CON_1:
		begin
			n_rct1 = rct1 + 1;
		end
		R_CON_2:
		begin
			n_rct2 = rct2 + 1;
		end
		R_CON_3:
		begin
			n_rct3 = rct3 + 1;
		end
		READ_ADDR_1:
		begin
			n_mcu_raddr = o_mcu_raddr + 1;
		end
		READ_ADDR_2:
		begin
			n_mcu_raddr = o_mcu_raddr + 32'd598;
			n_rct1 = 1;
		end
		READ_ADDR_3:
		begin
			n_mcu_raddr = o_mcu_raddr - 32'd2409;
			n_rct1 = 1;
			n_rct2 = 1;
		end
		READ_ADDR_4:
		begin
			n_mcu_raddr = o_mcu_raddr + 1;
			n_rct1 = 1;
			n_rct2 = 1;
			n_rct3 = 1;
		end
		READ_EN:
		begin
			n_re = 1'b1;
		end
		GRAY_START:
		begin
			n_grayscale_start = 1'b1;
		end
		B1_SAVE:
		begin
			n_b1_save = 1'b1;
		end

		EDGE_START:
		begin
			n_gradient_start = 1'b1;
		end
		B2_SAVE:
		begin
			n_b2_save = 1'b1;
			n_b1_clear = 1'b1;
		end
		W_CON_1:
		begin
			n_wct1 = wct1 + 1;
		end
		W_CON_2:
		begin
			n_wct2 = wct2 + 1;
		end
		W_CON_3:
		begin
			n_wct3 = wct3 + 1;
		end
		WRITE_ADDR_1:
		begin
			n_mcu_waddr = o_mcu_waddr + 1;
		end
		WRITE_ADDR_2:
		begin
			n_mcu_waddr = o_mcu_waddr + 32'd598;
			n_wct1 = 1;
		end
		WRITE_ADDR_3:
		begin
			n_mcu_waddr = o_mcu_waddr - 32'd1199;
			n_wct1 = 1;
			n_wct2 = 1;
		end
		WRITE_ADDR_4:
		begin
			n_mcu_waddr = o_mcu_waddr + 1;
			n_wct1 = 1;
			n_wct2 = 1;
			n_wct3 = 1;
			n_wct4 = wct4 + 1;
		end
		WRITE_EN:
		begin
			n_we = 1'b1;
		end
		OVERALL_DONE_CHK:
		begin
			o_complete = 1'b1;
		end
	endcase
end



endmodule
