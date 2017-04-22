// $Id: $
// File name:   buffer_window.sv
// Created:     3/14/2017
// Author:      Chia-Hua Peng
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: buffer window (buffer 1)

module buffer_window
(
	input clk,
	input n_rst,
	input [7:0] i_data_in,
	input i_save,
	input i_clear,
	output reg o_full,
	output reg o_empty,
	output reg [7:0] o_m1,
	output reg [7:0] o_m2,
	output reg [7:0] o_m3,
	output reg [7:0] o_m4,
	output reg [7:0] o_m5,
	output reg [7:0] o_m6,
	output reg [7:0] o_m7,
	output reg [7:0] o_m8,
	output reg [7:0] o_m9,
	output reg [7:0] o_m10,
	output reg [7:0] o_m11,
	output reg [7:0] o_m12,
	output reg [7:0] o_m13,
	output reg [7:0] o_m14,
	output reg [7:0] o_m15,
	output reg [7:0] o_m16,
	output reg [7:0] o_m17,
	output reg [7:0] o_m18,
	output reg [7:0] o_m19,
	output reg [7:0] o_m20,
	output reg [7:0] o_m21,
	output reg [7:0] o_m22,
	output reg [7:0] o_m23,
	output reg [7:0] o_m24,
	output reg [7:0] o_m25
);

typedef enum logic [5:0] {IDLE, SAVE_M1, WAIT_1, SAVE_M2, WAIT_2, SAVE_M3, WAIT_3, SAVE_M4, WAIT_4, SAVE_M5, WAIT_5, SAVE_M6, WAIT_6, 
			  SAVE_M7, WAIT_7, SAVE_M8, WAIT_8, SAVE_M9, WAIT_9, SAVE_M10, WAIT_10, SAVE_M11, WAIT_11,
			  SAVE_M12, WAIT_12, SAVE_M13, WAIT_13, SAVE_M14, WAIT_14, SAVE_M15, WAIT_15, SAVE_M16, WAIT_16,
			  SAVE_M17, WAIT_17, SAVE_M18, WAIT_18, SAVE_M19, WAIT_19, SAVE_M20, WAIT_20, SAVE_M21, WAIT_21,
			  SAVE_M22, WAIT_22, SAVE_M23, WAIT_23, SAVE_M24, WAIT_24, SAVE_M25, B_FULL} state_type;
state_type curr, next;

reg next_full;
reg next_empty;
reg [7:0] n_m1;
reg [7:0] n_m2;
reg [7:0] n_m3;
reg [7:0] n_m4;
reg [7:0] n_m5;
reg [7:0] n_m6;
reg [7:0] n_m7;
reg [7:0] n_m8;
reg [7:0] n_m9;
reg [7:0] n_m10;
reg [7:0] n_m11;
reg [7:0] n_m12;
reg [7:0] n_m13;
reg [7:0] n_m14;
reg [7:0] n_m15;
reg [7:0] n_m16;
reg [7:0] n_m17;
reg [7:0] n_m18;
reg [7:0] n_m19;
reg [7:0] n_m20;
reg [7:0] n_m21;
reg [7:0] n_m22;
reg [7:0] n_m23;
reg [7:0] n_m24;
reg [7:0] n_m25;

// Empty Full Output Register
always_ff @ (posedge clk, negedge n_rst)
begin
	if (n_rst == 0) begin
		o_empty <= 1'b1;
		o_full <= 1'b0;
	end else begin
		o_empty <= next_empty;
		o_full <= next_full;
	end
end

// Buffer Memory
always_ff @ (posedge clk, negedge n_rst)
begin
	if (n_rst == 0) begin
		o_m1 <= 8'b0;
		o_m2 <= 8'b0;
		o_m3 <= 8'b0;
		o_m4 <= 8'b0;
		o_m5 <= 8'b0;
		o_m6 <= 8'b0;
		o_m7 <= 8'b0;
		o_m8 <= 8'b0;
		o_m9 <= 8'b0;
		o_m10 <= 8'b0;
		o_m11 <= 8'b0;
		o_m12 <= 8'b0;
		o_m13 <= 8'b0;
		o_m14 <= 8'b0;
		o_m15 <= 8'b0;
		o_m16 <= 8'b0;
		o_m17 <= 8'b0;
		o_m18 <= 8'b0;
		o_m19 <= 8'b0;
		o_m20 <= 8'b0;
		o_m21 <= 8'b0;
		o_m22 <= 8'b0;
		o_m23 <= 8'b0;
		o_m24 <= 8'b0;
		o_m25 <= 8'b0;
	end else begin
		o_m1 <= n_m1;
		o_m2 <= n_m2;
		o_m3 <= n_m3;
		o_m4 <= n_m4;
		o_m5 <= n_m5;
		o_m6 <= n_m6;
		o_m7 <= n_m7;
		o_m8 <= n_m8;
		o_m9 <= n_m9;
		o_m10 <= n_m10;
		o_m11 <= n_m11;
		o_m12 <= n_m12;
		o_m13 <= n_m13;
		o_m14 <= n_m14;
		o_m15 <= n_m15;
		o_m16 <= n_m16;
		o_m17 <= n_m17;
		o_m18 <= n_m18;
		o_m19 <= n_m19;
		o_m20 <= n_m20;
		o_m21 <= n_m21;
		o_m22 <= n_m22;
		o_m23 <= n_m23;
		o_m24 <= n_m24;
		o_m25 <= n_m25;
	end
end

// FSM Registers
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
				next = SAVE_M1;
			else
				next = IDLE;
		end
		SAVE_M1:
		begin
			next = WAIT_1;
		end
		WAIT_1:
		begin
			if (i_save == 1'b1)
				next = SAVE_M2;
			else
				next = WAIT_1;
		end
		SAVE_M2:
		begin
			next = WAIT_2;
		end
		WAIT_2:
		begin
			if (i_save == 1'b1)
				next = SAVE_M3;
			else
				next = WAIT_2;
		end
		SAVE_M3:
		begin
			next = WAIT_3;
		end
		WAIT_3:
		begin
			if (i_save == 1'b1)
				next = SAVE_M4;
			else
				next = WAIT_3;
		end
		SAVE_M4:
		begin
			next = WAIT_4;
		end
		WAIT_4:
		begin
			if (i_save == 1'b1)
				next = SAVE_M5;
			else
				next = WAIT_4;
		end
		SAVE_M5:
		begin
			next = WAIT_5;
		end
		WAIT_5:
		begin
			if (i_save == 1'b1)
				next = SAVE_M6;
			else
				next = WAIT_5;
		end
		SAVE_M6:
		begin
			next = WAIT_6;
		end
		WAIT_6:
		begin
			if (i_save == 1'b1)
				next = SAVE_M7;
			else
				next = WAIT_6;
		end
		SAVE_M7:
		begin
			next = WAIT_7;
		end
		WAIT_7:
		begin
			if (i_save == 1'b1)
				next = SAVE_M8;
			else
				next = WAIT_7;
		end
		SAVE_M8:
		begin
			next = WAIT_8;
		end
		WAIT_8:
		begin
			if (i_save == 1'b1)
				next = SAVE_M9;
			else
				next = WAIT_8;
		end
		SAVE_M9:
		begin
			next = WAIT_9;
		end
		WAIT_9:
		begin
			if (i_save == 1'b1)
				next = SAVE_M10;
			else
				next = WAIT_9;
		end
		SAVE_M10:
		begin
			next = WAIT_10;
		end
		WAIT_10:
		begin
			if (i_save == 1'b1)
				next = SAVE_M11;
			else
				next = WAIT_10;
		end
		SAVE_M11:
		begin
			next = WAIT_11;
		end
		WAIT_11:
		begin
			if (i_save == 1'b1)
				next = SAVE_M12;
			else
				next = WAIT_11;
		end
		SAVE_M12:
		begin
			next = WAIT_12;
		end
		WAIT_12:
		begin
			if (i_save == 1'b1)
				next = SAVE_M13;
			else
				next = WAIT_12;
		end
		SAVE_M13:
		begin
			next = WAIT_13;
		end
		WAIT_13:
		begin
			if (i_save == 1'b1)
				next = SAVE_M14;
			else
				next = WAIT_13;
		end
		SAVE_M14:
		begin
			next = WAIT_14;
		end
		WAIT_14:
		begin
			if (i_save == 1'b1)
				next = SAVE_M15;
			else
				next = WAIT_14;
		end
		SAVE_M15:
		begin
			next = WAIT_15;
		end
		WAIT_15:
		begin
			if (i_save == 1'b1)
				next = SAVE_M16;
			else
				next = WAIT_15;
		end
		SAVE_M16:
		begin
			next = WAIT_16;
		end
		WAIT_16:
		begin
			if (i_save == 1'b1)
				next = SAVE_M17;
			else
				next = WAIT_16;
		end
		SAVE_M17:
		begin
			next = WAIT_17;
		end
		WAIT_17:
		begin
			if (i_save == 1'b1)
				next = SAVE_M18;
			else
				next = WAIT_17;
		end
		SAVE_M18:
		begin
			next = WAIT_18;
		end
		WAIT_18:
		begin
			if (i_save == 1'b1)
				next = SAVE_M19;
			else
				next = WAIT_18;
		end
		SAVE_M19:
		begin
			next = WAIT_19;
		end
		WAIT_19:
		begin
			if (i_save == 1'b1)
				next = SAVE_M20;
			else
				next = WAIT_19;
		end
		SAVE_M20:
		begin
			next = WAIT_20;
		end
		WAIT_20:
		begin
			if (i_save == 1'b1)
				next = SAVE_M21;
			else
				next = WAIT_20;
		end
		SAVE_M21:
		begin
			next = WAIT_21;
		end
		WAIT_21:
		begin
			if (i_save == 1'b1)
				next = SAVE_M22;
			else
				next = WAIT_21;
		end
		SAVE_M22:
		begin
			next = WAIT_22;
		end
		WAIT_22:
		begin
			if (i_save == 1'b1)
				next = SAVE_M23;
			else
				next = WAIT_22;
		end
		SAVE_M23:
		begin
			next = WAIT_23;
		end
		WAIT_23:
		begin
			if (i_save == 1'b1)
				next = SAVE_M24;
			else
				next = WAIT_23;
		end
		SAVE_M24:
		begin
			next = WAIT_24;
		end
		WAIT_24:
		begin
			if (i_save == 1'b1)
				next = SAVE_M25;
			else
				next = WAIT_24;
		end
		SAVE_M25:
		begin
			next = B_FULL;
		end
		B_FULL:
		begin
			if (i_clear == 1'b1)
				next = IDLE;
			else
				next = B_FULL;
		end
	endcase
	if (i_clear == 1'b1)
		next = IDLE;
end

// Output Logic
always_comb
begin
	next_empty = 1'b0;
	next_full = 1'b0;
	n_m1 = o_m1;
	n_m2 = o_m2;
	n_m3 = o_m3;
	n_m4 = o_m4;
	n_m5 = o_m5;
	n_m6 = o_m6;
	n_m7 = o_m7;
	n_m8 = o_m8;
	n_m9 = o_m9;
	n_m10 = o_m10;
	n_m11 = o_m11;
	n_m12 = o_m12;
	n_m13 = o_m13;
	n_m14 = o_m14;
	n_m15 = o_m15;
	n_m16 = o_m16;
	n_m17 = o_m17;
	n_m18 = o_m18;
	n_m19 = o_m19;
	n_m20 = o_m20;
	n_m21 = o_m21;
	n_m22 = o_m22;
	n_m23 = o_m23;
	n_m24 = o_m24;
	n_m25 = o_m25;
	case(curr)
		IDLE:
		begin
			next_empty = 1'b1;
		end
		SAVE_M1:
		begin
			n_m1 = i_data_in;
		end
		SAVE_M2:
		begin
			n_m2 = i_data_in;
		end
		SAVE_M3:
		begin
			n_m3 = i_data_in;
		end
		SAVE_M4:
		begin
			n_m4 = i_data_in;
		end
		SAVE_M5:
		begin
			n_m5 = i_data_in;
		end
		SAVE_M6:
		begin
			n_m6 = i_data_in;
		end
		SAVE_M7:
		begin
			n_m7 = i_data_in;
		end
		SAVE_M8:
		begin
			n_m8 = i_data_in;
		end
		SAVE_M9:
		begin
			n_m9 = i_data_in;
		end
		SAVE_M10:
		begin
			n_m10 = i_data_in;
		end
		SAVE_M11:
		begin
			n_m11 = i_data_in;
		end
		SAVE_M12:
		begin
			n_m12 = i_data_in;
		end
		SAVE_M13:
		begin
			n_m13 = i_data_in;
		end
		SAVE_M14:
		begin
			n_m14 = i_data_in;
		end
		SAVE_M15:
		begin
			n_m15 = i_data_in;
		end
		SAVE_M16:
		begin
			n_m16 = i_data_in;
		end
		SAVE_M17:
		begin
			n_m17 = i_data_in;
		end
		SAVE_M18:
		begin
			n_m18 = i_data_in;
		end
		SAVE_M19:
		begin
			n_m19 = i_data_in;
		end
		SAVE_M20:
		begin
			n_m20 = i_data_in;
		end
		SAVE_M21:
		begin
			n_m21 = i_data_in;
		end
		SAVE_M22:
		begin
			n_m22 = i_data_in;
		end
		SAVE_M23:
		begin
			n_m23 = i_data_in;
		end
		SAVE_M24:
		begin
			n_m24 = i_data_in;
		end
		SAVE_M25:
		begin
			n_m25 = i_data_in;
		end
		B_FULL:
		begin
			next_full = 1'b1;
		end
	endcase
	if (next == B_FULL) begin
		next_full = 1'b1;	
	end
	if (i_clear == 1'b1) begin
		n_m1 = 8'b0;
		n_m2 = 8'b0;
		n_m3 = 8'b0;
		n_m4 = 8'b0;
		n_m5 = 8'b0;
		n_m6 = 8'b0;
		n_m7 = 8'b0;
		n_m8 = 8'b0;
		n_m9 = 8'b0;
		n_m10 = 8'b0;
		n_m11 = 8'b0;
		n_m12 = 8'b0;
		n_m13 = 8'b0;
		n_m14 = 8'b0;
		n_m15 = 8'b0;
		n_m16 = 8'b0;
		n_m17 = 8'b0;
		n_m18 = 8'b0;
		n_m19 = 8'b0;
		n_m20 = 8'b0;
		n_m21 = 8'b0;
		n_m22 = 8'b0;
		n_m23 = 8'b0;
		n_m24 = 8'b0;
		n_m25 = 8'b0;
		next_empty = 1'b1;
		next_full = 1'b0;
	end
end

endmodule
