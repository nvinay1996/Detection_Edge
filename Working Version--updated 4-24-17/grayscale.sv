// $Id: $
// File name:   grayscale.sv
// Created:     3/13/2017
// Author:      Chia-Hua Peng
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: Gray Scaler

module grayscale
(
	input clk, n_rst,
	input i_grayscale_start,
	input [31:0] i_RGB,
	output reg o_grayscale_data_ready,
	output reg [7:0] o_gray
);

wire [7:0] R;
wire [7:0] G;
wire [7:0] B;

typedef enum logic [3:0] {IDLE, INITIAL, GMAX_CHK, GMAX_SET, BMAX_CHK, BMAX_SET, GMIN_CHK, GMIN_SET, BMIN_CHK, BMIN_SET, TOTAL_CALC, GRAY_CALC, DATA_READY} state_type;
state_type curr;
state_type next;
wire [7:0] next_gray;
reg next_data_ready;

reg [7:0] min, n_min;
reg [7:0] max, n_max;
reg [8:0] total, n_total;
reg [7:0] average, n_average;

// RGB Input Assignment
assign R = i_RGB[31:24];
assign G = i_RGB[23:16];
assign B = i_RGB[15:8];

// Gray Scaler Output Registers
always_ff @(posedge clk, negedge n_rst)
begin
	if (n_rst == 0) begin
		o_grayscale_data_ready <= 0;
		o_gray <= 8'b0;
	end else begin
		o_grayscale_data_ready <= next_data_ready;
		o_gray <= next_gray;
	end
end

// Temporary Variable Memory
always_ff @(posedge clk, negedge n_rst)
begin
	if (n_rst == 0) begin
		min <= R;
		max <= R;
		total <= 9'b0;
		average <= 8'b0;
	end else begin
		min <= n_min;
		max <= n_max;
		total <= n_total;
		average <= n_average;
	end
end

// Gray Scaler FSM registers
always_ff @(posedge clk, negedge n_rst)
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
			if (i_grayscale_start)
				next = INITIAL;
			else
				next = IDLE;
		end
		INITIAL:
		begin
			next = GMAX_CHK;
		end
		GMAX_CHK:
		begin
			if (G > max)
				next = GMAX_SET;
			else
				next = BMAX_CHK;
		end
		GMAX_SET:
		begin
			next = BMAX_CHK;
		end
		BMAX_CHK:
		begin
			if (B > max)
				next = BMAX_SET;
			else
				next = GMIN_CHK;
		end
		BMAX_SET:
		begin
			next = GMIN_CHK;
		end
		GMIN_CHK:
		begin
			if (G < min)
				next = GMIN_SET;
			else
				next = BMIN_CHK;
		end
		GMIN_SET:
		begin
			next = BMIN_CHK;
		end
		BMIN_CHK:
		begin
			if (B < min)
				next = BMIN_SET;
			else
				next = TOTAL_CALC;
		end
		BMIN_SET:
		begin
			next = TOTAL_CALC;
		end
		TOTAL_CALC:
		begin
			next = GRAY_CALC;
		end
		GRAY_CALC:
		begin
			next = DATA_READY;
		end
		DATA_READY:
		begin
			next = IDLE;
		end
	endcase
end

// Output Logic
always_comb
begin
	n_min = min;
	n_max = max;
	n_total = total;
	n_average = average;
	next_data_ready = 0;
	
	case (curr)
		INITIAL:
		begin
			n_max = R;
			n_min = R;
		end
		GMAX_SET:
		begin
			n_max = G;
		end
		BMAX_SET:
		begin
			n_max = B;
		end
		GMIN_SET:
		begin
			n_min = G;
		end
		BMIN_SET:
		begin
			n_min = B;
		end
		TOTAL_CALC:
		begin
			n_total = min + max;
		end
		GRAY_CALC:
		begin
			n_average = n_total >> 1;
		end
		DATA_READY:
		begin
			next_data_ready = 1;
		end
	endcase
end

assign next_gray = n_average;

endmodule
