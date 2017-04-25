// $Id: $
// File name:   Top_Level.sv
// Created:     3/22/2017
// Author:      Alek Patel
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: Top Level

module Top_Level
(
	input wire clk,
	input wire n_rst,
	input wire [31:0] s_haddr,
	output reg [31:0] m_haddr,
	input wire [31:0] m_hrdata,
	output reg [31:0] s_hrdata,
	output reg [31:0] m_hwdata,
	input wire [31:0] s_hwdata,
	input wire s_hwrite,
	output reg m_hwrite,
	output reg s_hready,
	input wire m_hready
);

//for AHB_wrapper
	reg re;
	reg we;
	reg read_complete;
	reg write_complete;
	reg [31:0] buffer2_data;
	reg [31:0] rgb;
	reg done;
	reg stop;

//for GS
//reg i_grayscale_start; //i
logic grayscale_start;
logic grayscale_data_ready; //o
logic [7:0] gray; //o


//Buffer_1
logic b1_save; //i
logic b1_clear; //i
logic b1_full; //o
logic b1_empty; //o
reg [7:0] m1; //all o
reg [7:0] m2;
reg [7:0] m3;
reg [7:0] m4;
reg [7:0] m5;
reg [7:0] m6;
reg [7:0] m7;
reg [7:0] m8;
reg [7:0] m9;
reg [7:0] m10;
reg [7:0] m11;
reg [7:0] m12;
reg [7:0] m13;
reg [7:0] m14;
reg [7:0] m15;
reg [7:0] m16;
reg [7:0] m17;
reg [7:0] m18;
reg [7:0] m19;
reg [7:0] m20;
reg [7:0] m21;
reg [7:0] m22;
reg [7:0] m23;
reg [7:0] m24;
reg [7:0] m25;


//edge_detetction_core
reg [7:0] processed_sum_1;
reg [7:0] processed_sum_2;
reg [7:0] processed_sum_3;
reg [7:0] processed_sum_4;
reg [7:0] processed_sum_5;
reg [7:0] processed_sum_6;
reg [7:0] processed_sum_7;
reg [7:0] processed_sum_8;
reg [7:0] processed_sum_9;
logic gradient_ready;
logic gradient_start;


//buffer_2
logic b2_save;
logic b2_empty;
logic b2_full;
logic start_next_write;


	AHB_wrapper AHB_DUT
	(
		.clk(clk),
		.n_rst(n_rst),
		.done(done),
		.s_haddr(s_haddr),
		.m_haddr(m_haddr),
		.s_hrdata(s_hrdata),
		.m_hrdata(m_hrdata),
		.m_hwdata(m_hwdata),
		.s_hwdata(s_hwdata),
		.s_hwrite(s_hwrite),
		.m_hwrite(m_hwrite),
		.s_hready(s_hready),
		.m_hready(m_hready),
		.re(re),
		.we(we),
		.buffer2_data(buffer2_data),
		.greyscale_data(rgb),
		.read_complete(read_complete),
		.write_complete(write_complete)
	);

grayscale GS_DUT
(
.clk(clk),
.n_rst(n_rst),
.i_grayscale_start(grayscale_start),
.i_RGB(rgb),
.o_grayscale_data_ready(grayscale_data_ready),
.o_gray(gray)
);

buffer_window B1_DUT
(
.clk(clk),
.n_rst(n_rst),
.i_data_in(gray),
.i_save(b1_save),
.i_clear(b1_clear),
.o_full(b1_full),
.o_empty(b1_empty),
.o_m1(m1),
.o_m2(m2),
.o_m3(m3),
.o_m4(m4),
.o_m5(m5),
.o_m6(m6),
.o_m7(m7),
.o_m8(m8),
.o_m9(m9),
.o_m10(m10),
.o_m11(m11),
.o_m12(m12),
.o_m13(m13),
.o_m14(m14),
.o_m15(m15),
.o_m16(m16),
.o_m17(m17),
.o_m18(m18),
.o_m19(m19),
.o_m20(m20),
.o_m21(m21),
.o_m22(m22),
.o_m23(m23),
.o_m24(m24),
.o_m25(m25)
);

edge_detection_core EDC_DUT
(
.clk(clk),
.n_rst(n_rst),
.i_m1(m1),
.i_m2(m2),
.i_m3(m3),
.i_m4(m4),
.i_m5(m5),
.i_m6(m6),
.i_m7(m7),
.i_m8(m8),
.i_m9(m9),
.i_m10(m10),
.i_m11(m11),
.i_m12(m12),
.i_m13(m13),
.i_m14(m14),
.i_m15(m15),
.i_m16(m16),
.i_m17(m17),
.i_m18(m18),
.i_m19(m19),
.i_m20(m20),
.i_m21(m21),
.i_m22(m22),
.i_m23(m23),
.i_m24(m24),
.i_m25(m25),
.i_gradient_start(gradient_start),
.o_gradient_ready(gradient_ready),
.o_processed_sum_1(processed_sum_1),
.o_processed_sum_2(processed_sum_2),
.o_processed_sum_3(processed_sum_3),
.o_processed_sum_4(processed_sum_4),
.o_processed_sum_5(processed_sum_5),
.o_processed_sum_6(processed_sum_6),
.o_processed_sum_7(processed_sum_7),
.o_processed_sum_8(processed_sum_8),
.o_processed_sum_9(processed_sum_9)
);


buffer_2 B2_DUT
(
.clk(clk),
.n_rst(n_rst),
.i_processed_sum_1(processed_sum_1),
.i_processed_sum_2(processed_sum_2),
.i_processed_sum_3(processed_sum_3),
.i_processed_sum_4(processed_sum_4),
.i_processed_sum_5(processed_sum_5),
.i_processed_sum_6(processed_sum_6),
.i_processed_sum_7(processed_sum_7),
.i_processed_sum_8(processed_sum_8),
.i_processed_sum_9(processed_sum_9),
.i_save(b2_save),
.i_write_complete(write_complete),
.o_empty(b2_empty),
.o_full(b2_full),
.o_buffer2_data(buffer2_data),
.o_write_enable(start_next_write)

);

mcu MCU_DUT
(
.clk(clk),
.n_rst(n_rst),
.i_stop(!s_hrdata[0]),
.i_done(done),
.i_read_complete(read_complete),
.i_grayscale_data_ready(grayscale_data_ready),
.i_b1_full(b1_full),
.i_gradient_data_ready(gradient_ready),
.i_start_next_write(start_next_write),
.i_write_complete(write_complete),
.i_b2_empty(b2_empty),
.o_re(re),
.o_grayscale_start(grayscale_start),
.o_b1_save(b1_save),
.o_b1_clear(b1_clear),
.o_gradient_start(gradient_start),
.o_b2_save(b2_save),
.o_we(we)
);






endmodule
