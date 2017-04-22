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
	input i_done,
	input i_read_complete,
	input i_grayscale_data_ready,
	input i_b1_full,
	input i_gradient_data_ready,
	input i_start_next_write,
	input i_write_complete,
	input i_b2_empty,
	output reg o_re,
	output reg o_grayscale_start,
	output reg o_b1_save,
	output reg o_b1_clear,
	output reg o_gradient_start,
	output reg o_b2_save,
	output reg o_we
);


// register output
reg n_re, n_grayscale_start, n_b1_save, n_b1_clear, n_gradient_start, n_b2_save, n_we;

typedef enum logic [5:0] {SIG_WAIT,IDLE, READ_ADDR_INC, READ_ADDR_WAIT,READ_EN, WAIT_READ, GRAY_START, WAIT_GRAY, B1_SAVE, B1_WAIT_1, B1_WAIT_2, // stage 1: read the data, gray scale pixel, and store in buffer1
			  EDGE_START, WAIT_EDGE, 											// stage 2: compute edge detection
			  B2_SAVE, B2_WAIT, WRITE_ADDR_INC, WRITE_ADDR_WAIT, WRITE_EN, WAIT_WRITE, CHK_B2_DONE,  			// stage 3: store the computed data in buffer 2, and transfer to SRAM
			  B2_POST_WAIT_1, B2_POST_WAIT_2, DONE_CHK} state_type;

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
				next = READ_EN;
			else
				next = IDLE;
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
			next = SIG_WAIT;
		end
		SIG_WAIT:
		begin
			next=B1_WAIT_2;
		end
		B1_WAIT_2:
		begin
			if (!i_b1_full)
				next = READ_EN;
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
			next = WRITE_EN;
		end
		WRITE_EN:
		begin
			next = WAIT_WRITE;
		end
		WAIT_WRITE:
		begin
			if (i_write_complete)
				next = B2_POST_WAIT_1;
			else
				next = WAIT_WRITE;
		end
		B2_POST_WAIT_1:
		begin
			next = B2_POST_WAIT_2;
		end
		B2_POST_WAIT_2:
		begin
			next = CHK_B2_DONE;
		end
		CHK_B2_DONE:
		begin
			if (!i_b2_empty)
				next = B2_SAVE;
			else
				next = DONE_CHK;
		end
		DONE_CHK:
		begin
			if (!i_done)
				next = IDLE;
			else
				next = DONE_CHK;
		end
	endcase
end

// Output Logic
always_comb
begin
	n_re = 0;
	n_grayscale_start = 0;
	n_b1_save = 0;
	n_b1_clear = 0;
	n_gradient_start = 0;
	n_b2_save = 0;
	n_we = 0;	

	case (curr)
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
		WRITE_EN:
		begin
			n_we = 1'b1;
		end
	endcase
end



endmodule
