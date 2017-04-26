// $Id: $
// File name:   edge_detection.sv
// Created:     3/13/2017
// Author:      Vinay Nagarajan, Chia-Hua Peng
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: edge detection

module edge_detection
(
	input wire clk,
	input wire n_rst,
	input wire i_gradient_start,
	input wire [7:0] P0,
	input wire [7:0] P1,
	input wire [7:0] P2,
	input wire [7:0] P3,
	input wire [7:0] P4,
	input wire [7:0] P5,
	input wire [7:0] P6,
	input wire [7:0] P7,
	input wire [7:0] P8,
	output reg o_gradient_data_ready,
	output reg [7:0] o_processed_sum
);

reg next_data_ready;
wire [7:0] next_processed_sum;

reg signed [8:0] A1, n_A1;
reg signed [8:0] B1, n_B1;
reg signed [9:0] C1, n_C1;
reg signed [8:0] D1, n_D1;
reg signed [9:0] E1, n_E1;
reg signed [8:0] A2, n_A2;
reg signed [8:0] B2, n_B2;
reg signed [9:0] C2, n_C2;
reg signed [8:0] D2, n_D2;
reg signed [9:0] E2, n_E2;
reg signed [10:0] Gy, n_Gy;
reg signed [10:0] Gx, n_Gx;
reg signed [11:0] temp_sum, n_temp_sum;

typedef enum bit [5:0] {IDLE, ASSIGN_A, ASSIGN_C, ASSIGN_E, ASSIGN_G,GX_NEG_SET_WAIT,SUMM_WAIT,DATA_READY_WAIT, GX_NEG_CHK, GY_NEG_CHK, GX_NEG_SET, GY_NEG_SET, SUMM, FORCE255, DATA_READY,DATA_READY2,DATA_READY3,DATA_READY4} stateType;
stateType state;
stateType next_state;

// Output Register
always_ff @ (posedge clk, negedge n_rst)
begin
	if(n_rst == 1'b0) begin
		o_gradient_data_ready <= 1'b0;
		o_processed_sum <= 8'b0;
	end else begin
		o_gradient_data_ready <= next_data_ready;
		o_processed_sum <= next_processed_sum;
	end
end


// Edge Detection FSM Register
always_ff @ (posedge clk, negedge n_rst)
begin
	if(n_rst == 1'b0)
		state <= IDLE;
	else
		state <= next_state;
end

// Temporary Variable Memory
always_ff @ (posedge clk, negedge n_rst)
begin
	if (n_rst == 1'b0) begin
		A1 <= 9'b0;
		B1 <= 9'b0;
		C1 <= 10'b0;
		D1 <= 9'b0;
		E1 <= 10'b0;
		A2 <= 9'b0;
		B2 <= 9'b0;
		C2 <= 10'b0;
		D2 <= 9'b0;
		E2 <= 10'b0;
		Gx <= 11'b0;
		Gy <= 11'b0;
		temp_sum <= 12'b0;
	end else begin
		A1 <= n_A1;
		B1 <= n_B1;
		C1 <= n_C1;
		D1 <= n_D1;
		E1 <= n_E1;
		A2 <= n_A2;
		B2 <= n_B2;
		C2 <= n_C2;
		D2 <= n_D2;
		E2 <= n_E2;
		Gx <= n_Gx;
		Gy <= n_Gy;
		temp_sum <= n_temp_sum;
	end
end

// Next State Logic
always_comb
begin
	next_state = state;
	case (state)
		IDLE:
		begin
			if (i_gradient_start) begin
				next_state = ASSIGN_A;
			end else begin
				next_state = IDLE;
			end
		end
		ASSIGN_A:
		begin
			next_state = ASSIGN_C;
		end
		ASSIGN_C:
		begin
			next_state = ASSIGN_E;
		end
		ASSIGN_E:
		begin
			next_state = ASSIGN_G;
		end
		ASSIGN_G:
		begin
			next_state = GX_NEG_CHK;
		end
		GX_NEG_CHK:
		begin
			if (Gx[10] == 1'b1)
				next_state = GX_NEG_SET;
			else
				next_state = GX_NEG_SET_WAIT;
		end
		GX_NEG_SET_WAIT:
		begin
			next_state=GY_NEG_CHK;
		end
		GX_NEG_SET:
		begin
			next_state = GY_NEG_CHK;
		end
		GY_NEG_CHK:
		begin
			if (Gy[10] == 1'b1)
				next_state = GY_NEG_SET;
			else
				next_state = SUMM_WAIT;
		end
		SUMM_WAIT:
		begin
			next_state=SUMM;
		end
		GY_NEG_SET:
		begin
			next_state = SUMM;
		end
		SUMM:
		begin
			next_state = DATA_READY_WAIT;
		end
		DATA_READY_WAIT:
		begin
			next_state=DATA_READY;
		end
		DATA_READY:
		begin
			next_state = IDLE;
		end
		
	endcase
end

// Output Logic
always_comb
begin
	n_A1 = A1;
	n_B1 = B1;
	n_C1 = C1;
	n_D1 = D1;
	n_E1 = E1;
	n_A2 = A2;
	n_B2 = B2;
	n_C2 = C2;
	n_D2 = D2;
	n_E2 = E2;
	n_Gx = Gx;
	n_Gy = Gy;
	n_temp_sum = temp_sum;
	next_data_ready = 1'b0;
	case (state)
		ASSIGN_A:
		begin
			n_A1 = {1'b0, P2} - {1'b0, P0};
			n_A2 = {1'b0, P0} - {1'b0, P6};
			n_B1 = {1'b0, P5} - {1'b0, P3};
			n_B2 = {1'b0, P1} - {1'b0, P7};
			n_D1 = {1'b0, P8} - {1'b0, P6};
			n_D2 = {1'b0, P2} - {1'b0, P8};
		end
		ASSIGN_C:
		begin
			n_C1 = B1 + B1;
			n_C2 = B2 + B2;
		end
		ASSIGN_E:
		begin
			n_E1 = A1 + D1;
			n_E2 = A2 + D2;
		end
		ASSIGN_G:
		begin
			n_Gx = C1 + E1;
			n_Gy = C2 + E2;
		end
		GX_NEG_SET:
		begin
			n_Gx = ~Gx + 1;
		end
		GY_NEG_SET:
		begin
			n_Gy = ~Gy + 1;
		end
		SUMM:
		begin
			n_temp_sum = {0, Gx} + {0, Gy};
			if (n_temp_sum[8] | n_temp_sum[9] | n_temp_sum[10])
				n_temp_sum = 12'd255;
		end
		DATA_READY:
		begin
			next_data_ready = 1'b1;
		end
		
	endcase
end

assign next_processed_sum = temp_sum[7:0];


endmodule

