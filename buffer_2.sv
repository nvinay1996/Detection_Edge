// $Id: $
// File name:   buffer_2.sv
// Created:     3/15/2017
// Author:      Vinay Nagarajan
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: buffer_2

module buffer_2(
	input wire clk,
	input wire n_rst,
	input wire [7:0] i_processed_sum_1,
	input wire [7:0] i_processed_sum_2,
	input wire [7:0] i_processed_sum_3,
	input wire [7:0] i_processed_sum_4,
	input wire [7:0] i_processed_sum_5,
	input wire [7:0] i_processed_sum_6,
	input wire [7:0] i_processed_sum_7,
	input wire [7:0] i_processed_sum_8,
	input wire [7:0] i_processed_sum_9,
	input wire i_save,
	input wire i_write_complete,
	output reg o_empty,
	output reg o_full,
	output reg [31:0] o_buffer2_data,
	output reg o_write_enable
);


reg next_full;
reg next_empty;
reg next_write_enable;

reg [7:0] m1, n_m1;
reg [7:0] m2, n_m2;
reg [7:0] m3, n_m3;
reg [7:0] m4, n_m4;
reg [7:0] m5, n_m5;
reg [7:0] m6, n_m6;
reg [7:0] m7, n_m7;
reg [7:0] m8, n_m8;
reg [7:0] m9, n_m9;
reg [31:0] n_buffer2_data;

typedef enum logic [5:0] {IDLE, LOAD, WAIT_0, OUT_M1, WAIT_1, WRITE_1, OUT_M2, WAIT_2, WRITE_2, OUT_M3, WAIT_3, WRITE_3, OUT_M4, WAIT_4, WRITE_4, OUT_M5, WAIT_5, WRITE_5, OUT_M6, WAIT_6, WRITE_6, OUT_M7, WAIT_7, WRITE_7, OUT_M8, WAIT_8, WRITE_8, OUT_M9, WAIT_9, WRITE_9} state_type;
state_type curr, next;

always_ff @ (posedge clk, negedge n_rst)
begin
	if (n_rst == 0) begin
		o_empty <= 1'b1;
		o_full <= 1'b0;
		o_write_enable <= 1'b0;
	end else begin
		o_empty <= next_empty;
		o_full <= next_full;
		o_write_enable <= next_write_enable;
	end
end


always_ff @ (posedge clk, negedge n_rst)
begin
	if (n_rst == 0) begin
		m1 <= 8'b0;
		m2 <= 8'b0;
		m3 <= 8'b0;
		m4 <= 8'b0;
		m5 <= 8'b0;
		m6 <= 8'b0;
		m7 <= 8'b0;
		m8 <= 8'b0;
		m9 <= 8'b0;
		o_buffer2_data <= 32'b0;

	end else begin
		m1 <= n_m1;
		m2 <= n_m2;
		m3 <= n_m3;
		m4 <= n_m4;
		m5 <= n_m5;
		m6 <= n_m6;
		m7 <= n_m7;
		m8 <= n_m8;
		m9 <= n_m9;
		o_buffer2_data <= n_buffer2_data;

	end
end

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
	case(curr)
		IDLE:
		begin
			if (i_save == 1'b1)
				next = LOAD;
			else
				next = IDLE;
		end
		LOAD:
		begin
			next = WAIT_0;
		end
		WAIT_0:
		begin
			next = OUT_M1;
		end
		OUT_M1:
		begin
			next = WRITE_1;
		end
		WRITE_1:
		begin
			next = WAIT_1;
		end
		WAIT_1:
		begin
			if (i_write_complete == 1'b1)
				next = OUT_M2;
			else
				next = WAIT_1;
		end
		
		OUT_M2:
		begin
			next = WRITE_2;
		end
		WRITE_2:
		begin
			next = WAIT_2;
		end
		WAIT_2:
		begin
			if (i_write_complete == 1'b1)
				next = OUT_M3;
			else
				next = WAIT_2;
		end
		OUT_M3:
		begin
			next = WRITE_3;
		end
		WRITE_3:
		begin
			next = WAIT_3;
		end
		WAIT_3:
		begin
			if (i_write_complete == 1'b1)
				next = OUT_M4;
			else
				next = WAIT_3;
		end
		OUT_M4:
		begin
			next = WRITE_4;
		end
		WRITE_4:
		begin
			next = WAIT_4;
		end
		WAIT_4:
		begin
			if (i_write_complete == 1'b1)
				next = OUT_M5;
			else
				next = WAIT_4;
		end
		OUT_M5:
		begin
			next = WRITE_5;
		end
		WRITE_5:
		begin
			next = WAIT_5;
		end
		WAIT_5:
		begin
			if (i_write_complete == 1'b1)
				next = OUT_M6;
			else
				next = WAIT_5;
		end

		OUT_M6:
		begin
			next = WRITE_6;
		end
		WRITE_6:
		begin
			next = WAIT_6;
		end
		WAIT_6:
		begin
			if (i_write_complete == 1'b1)
				next = OUT_M7;
			else
				next = WAIT_6;
		end

		OUT_M7:
		begin
			next = WRITE_7;
		end
		WRITE_7:
		begin
			next = WAIT_7;
		end
		WAIT_7:
		begin
			if (i_write_complete == 1'b1)
				next = OUT_M8;
			else
				next = WAIT_7;
		end
		OUT_M8:
		begin
			next = WRITE_8;
		end
		WRITE_8:
		begin
			next = WAIT_8;
		end
		WAIT_8:
		begin
			if (i_write_complete == 1'b1)
				next = OUT_M9;
			else
				next = WAIT_8;
		end
		OUT_M9:
		begin
			next = WRITE_9;
		end
		WRITE_9:
		begin
			next = WAIT_9;
		end
		WAIT_9:
		begin
			if (i_write_complete == 1'b1)
				next = IDLE;
			else
				next = WAIT_9;
		end
	endcase
end

// Output Logic
always_comb
begin
//	next_empty = 1'b0;
//	next_full = 1'b0;
	n_m1 = m1;
	n_m2 = m2;
	n_m3 = m3;
	n_m4 = m4;
	n_m5 = m5;
	n_m6 = m6;
	n_m7 = m7;
	n_m8 = m8;
	n_m9 = m9;
	n_buffer2_data = o_buffer2_data;
	next_write_enable = 1'b0;
	next_full = 1'b0;
	next_empty = 1'b0;
	case(curr)
		IDLE:
		begin
			next_empty = 1'b1;
		end
		LOAD:
		begin
			n_m1 = i_processed_sum_1;
			n_m2 = i_processed_sum_2;
			n_m3 = i_processed_sum_3;
			n_m4 = i_processed_sum_4;
			n_m5 = i_processed_sum_5;
			n_m6 = i_processed_sum_6;
			n_m7 = i_processed_sum_7;
			n_m8 = i_processed_sum_8;
			n_m9 = i_processed_sum_9;
			next_full = 1'b1;
		end
		WAIT_0:
		begin
			next_full = 1'b1;
		end
		OUT_M1:
		begin
			n_buffer2_data = {m1, m1, m1, m1};
		end
		WRITE_1:
		begin
			next_write_enable = 1'b1;
		end

		OUT_M2:
		begin
			n_buffer2_data = {m2, m2, m2, m2};
		end
		WRITE_2:
		begin
			next_write_enable = 1'b1;
		end
		OUT_M3:
		begin
			n_buffer2_data = {m3, m3, m3, m3};
		end
		WRITE_3:
		begin
			next_write_enable = 1'b1;
		end
		OUT_M4:
		begin
			n_buffer2_data = {m4, m4, m4, m4};
		end
		WRITE_4:
		begin
			next_write_enable = 1'b1;
		end
		OUT_M5:
		begin
			n_buffer2_data = {m5, m5, m5, m5};
		end
		WRITE_5:
		begin
			next_write_enable = 1'b1;
		end
		OUT_M6:
		begin
			n_buffer2_data = {m6, m6, m6, m6};
		end
		WRITE_6:
		begin
			next_write_enable = 1'b1;
		end
		OUT_M7:
		begin
			n_buffer2_data = {m7, m7, m7, m7};
		end
		WRITE_7:
		begin
			next_write_enable = 1'b1;
		end
		OUT_M8:
		begin
			n_buffer2_data = {m8, m8, m8, m8};
		end
		WRITE_8:
		begin
			next_write_enable = 1'b1;
		end

		OUT_M9:
		begin
			n_buffer2_data = {m9, m9, m9, m9};
		end
		WRITE_9:
		begin
			next_write_enable = 1'b1;
		end
	endcase
end

endmodule

