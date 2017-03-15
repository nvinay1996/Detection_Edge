// $Id: $
// File name:   edge_detection_core.sv
// Created:     3/15/2017
// Author:      Vinay Nagarajan
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: edge detection core

module edge_detection_core(
	input wire clk,
	input wire n_rst,
	input wire [7:0] i_m1,
	input wire [7:0] i_m2,
	input wire [7:0] i_m3,
	input wire [7:0] i_m4,
	input wire [7:0] i_m5,
	input wire [7:0] i_m6,
	input wire [7:0] i_m7,
	input wire [7:0] i_m8,
	input wire [7:0] i_m9,
	input wire [7:0] i_m10,
	input wire [7:0] i_m11,
	input wire [7:0] i_m12,
	input wire [7:0] i_m13,
	input wire [7:0] i_m14,
	input wire [7:0] i_m15,
	input wire [7:0] i_m16,
	input wire [7:0] i_m17,
	input wire [7:0] i_m18,
	input wire [7:0] i_m19,
	input wire [7:0] i_m20,
	input wire [7:0] i_m21,
	input wire [7:0] i_m22,
	input wire [7:0] i_m23,
	input wire [7:0] i_m24,
	input wire [7:0] i_m25,
	input wire i_gradient_start,
	output reg o_gradient_ready,
	output reg [7:0] o_processed_sum_1,
	output reg [7:0] o_processed_sum_2,
	output reg [7:0] o_processed_sum_3,
	output reg [7:0] o_processed_sum_4,
	output reg [7:0] o_processed_sum_5,
	output reg [7:0] o_processed_sum_6,
	output reg [7:0] o_processed_sum_7,
	output reg [7:0] o_processed_sum_8,
	output reg [7:0] o_processed_sum_9

);

reg temp_gradient_ready_1;
reg temp_gradient_ready_2;
reg temp_gradient_ready_3;
reg temp_gradient_ready_4;
reg temp_gradient_ready_5;
reg temp_gradient_ready_6;
reg temp_gradient_ready_7;
reg temp_gradient_ready_8;
reg temp_gradient_ready_9;


edge_detection E1
(
	.clk (clk), 
	.n_rst (n_rst), 
	.i_gradient_start(i_gradient_start),
	.P0(i_m1), 
	.P1(i_m2), 
	.P2(i_m3), 
	.P3(i_m6), 
	.P4(i_m7), 
	.P5(i_m8), 
	.P6(i_m11), 
	.P7(i_m12), 
	.P8(i_m13), 
	.o_gradient_ready(temp_gradient_ready_1), 
	.o_processed_sum(o_processed_sum_1)
);

edge_detection E2
(
	.clk (clk), 
	.n_rst (n_rst), 
	.i_gradient_start(i_gradient_start),
	.P0(i_m2), 
	.P1(i_m3), 
	.P2(i_m4), 
	.P3(i_m7), 
	.P4(i_m8), 
	.P5(i_m9), 
	.P6(i_m12), 
	.P7(i_m13), 
	.P8(i_m14), 
	.o_gradient_ready(temp_gradient_ready_2), 
	.o_processed_sum(o_processed_sum_2)
);

edge_detection E3
(
	.clk (clk), 
	.n_rst (n_rst), 
	.i_gradient_start(i_gradient_start),
	.P0(i_m3), 
	.P1(i_m4), 
	.P2(i_m5), 
	.P3(i_m8), 
	.P4(i_m9), 
	.P5(i_m10), 
	.P6(i_m13), 
	.P7(i_m14), 
	.P8(i_m15), 
	.o_gradient_ready(temp_gradient_ready_3), 
	.o_processed_sum(o_processed_sum_3)
);

edge_detection E4
(
	.clk (clk), 
	.n_rst (n_rst), 
	.i_gradient_start(i_gradient_start),
	.P0(i_m6), 
	.P1(i_m7), 
	.P2(i_m8), 
	.P3(i_m11), 
	.P4(i_m12), 
	.P5(i_m13), 
	.P6(i_m16), 
	.P7(i_m17), 
	.P8(i_m18), 
	.o_gradient_ready(temp_gradient_ready_4), 
	.o_processed_sum(o_processed_sum_4)
);


edge_detection E5
(
	.clk (clk), 
	.n_rst (n_rst), 
	.i_gradient_start(i_gradient_start),
	.P0(i_m7), 
	.P1(i_m8), 
	.P2(i_m9), 
	.P3(i_m12), 
	.P4(i_m13), 
	.P5(i_m14), 
	.P6(i_m17), 
	.P7(i_m18), 
	.P8(i_m19), 
	.o_gradient_ready(temp_gradient_ready_5), 
	.o_processed_sum(o_processed_sum_5)
);


edge_detection E6
(
	.clk (clk), 
	.n_rst (n_rst), 
	.i_gradient_start(i_gradient_start),
	.P0(i_m8), 
	.P1(i_m9), 
	.P2(i_m10), 
	.P3(i_m13), 
	.P4(i_m14), 
	.P5(i_m15), 
	.P6(i_m18), 
	.P7(i_m19), 
	.P8(i_m20), 
	.o_gradient_ready(temp_gradient_ready_6), 
	.o_processed_sum(o_processed_sum_6)
);


edge_detection E7
(
	.clk (clk), 
	.n_rst (n_rst), 
	.i_gradient_start(i_gradient_start),
	.P0(i_m11), 
	.P1(i_m12), 
	.P2(i_m13), 
	.P3(i_m16), 
	.P4(i_m17), 
	.P5(i_m18), 
	.P6(i_m21), 
	.P7(i_m22), 
	.P8(i_m23), 
	.o_gradient_ready(temp_gradient_ready_7), 
	.o_processed_sum(o_processed_sum_7)
);


edge_detection E8
(
	.clk (clk), 
	.n_rst (n_rst), 
	.i_gradient_start(i_gradient_start),
	.P0(i_m12), 
	.P1(i_m13), 
	.P2(i_m14), 
	.P3(i_m17), 
	.P4(i_m18), 
	.P5(i_m19), 
	.P6(i_m22), 
	.P7(i_m23), 
	.P8(i_m24), 
	.o_gradient_ready(temp_gradient_ready_8), 
	.o_processed_sum(o_processed_sum_8)
);

edge_detection E9
(
	.clk (clk), 
	.n_rst (n_rst), 
	.i_gradient_start(i_gradient_start),
	.P0(i_m13), 
	.P1(i_m14), 
	.P2(i_m15), 
	.P3(i_m18), 
	.P4(i_m19), 
	.P5(i_m20), 
	.P6(i_m23), 
	.P7(i_m24), 
	.P8(i_m25), 
	.o_gradient_ready(temp_gradient_ready_9), 
	.o_processed_sum(o_processed_sum_9)
);

assign o_gradient_ready = temp_gradient_ready_1 && temp_gradient_ready_2 && temp_gradient_ready_3 && temp_gradient_ready_4 && temp_gradient_ready_5 && temp_gradient_ready_6 && temp_gradient_ready_7 && temp_gradient_ready_8 && temp_gradient_ready_9;

endmodule

