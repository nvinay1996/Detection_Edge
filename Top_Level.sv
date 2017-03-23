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
input wire [31:0] hrdata,
input wire hready,
output reg [31:0] haddr,
output reg [31:0] hwdata,
output reg hwrite
);


//mcu
reg o_we;
reg o_re;
reg o_mcu_waddr;
reg o_mcu_raddr;
reg o_grayscale_start;
reg o_gradient_start;
reg o_b1_save;
reg o_b1_clear;
reg o_b2_save;
reg o_complete;
//for AHB
wire re; //i
wire we; //i
//wire [31:0] mcu_waddr; //i
//wire [31:0] mcu_raddr; //i
//wire [31:0] buffer2_data; //i
wire [31:0] greyscale_data; //o
reg read_complete; //o
reg write_complete; //o
//for GS
//reg i_grayscale_start; //i
reg o_grayscale_data_ready; //o
reg [7:0] o_gray; //o
//Buffer_1
reg i_save; //i
reg i_clear; //i
reg o_full; //o
reg o_empty; //o
reg [7:0] o_m1; //all o
reg [7:0] o_m2;
reg [7:0] o_m3;
reg [7:0] o_m4;
reg [7:0] o_m5;
reg [7:0] o_m6;
reg [7:0] o_m7;
reg [7:0] o_m8;
reg [7:0] o_m9;
reg [7:0] o_m10;
reg [7:0] o_m11;
reg [7:0] o_m12;
reg [7:0] o_m13;
reg [7:0] o_m14;
reg [7:0] o_m15;
reg [7:0] o_m16;
reg [7:0] o_m17;
reg [7:0] o_m18;
reg [7:0] o_m19;
reg [7:0] o_m20;
reg [7:0] o_m21;
reg [7:0] o_m21;
reg [7:0] o_m22;
reg [7:0] o_m23;
reg [7:0] o_m24;
reg [7:0] o_m25;
//edge_detetction_core
reg [7:0] o_processed_sum_1;
reg [7:0] o_processed_sum_2;
reg [7:0] o_processed_sum_3;
reg [7:0] o_processed_sum_4;
reg [7:0] o_processed_sum_5;
reg [7:0] o_processed_sum_6;
reg [7:0] o_processed_sum_7;
reg [7:0] o_processed_sum_8;
reg [7:0] o_processed_sum_9;
reg o_gradient_ready;
//buffer_2
wire i_save_2;
wire i_write_complete;
reg o_empty_2;/////outputs start here
reg o_full_2;
reg [31:0] o_buffer2_data;
reg o_write_enable;




AHB AHB_DUT
(
.clk(clk),
.n_rst(n_rst),
.hready(hready),
.re(o_re),
.we(o_we),
.mcu_waddr(o_mcu_waddr),
.mcu_raddr(o_mcu_raddr),
.buffer2_data(o_buffer2_data),
.hrdata(hrdata),
.greyscale_data(greyscale_data),
.haddr(haddr),
.hwdata(hwdata),
.hwrite(hwrite),
.read_complete(read_complete),
.write_complete(write_complete)
);

grayscale GS_DUT
(
.clk(clk),
.n_rst(n_rst),
.i_grayscale_start(o_grayscale_start),
.i_RGB(greyscale_data),
.o_grayscale_data_ready(o_grayscale_data_ready),
.o_gray(o_gray)
);

buffer_window B1_DUT
(
.clk(clk),
.n_rst(n_rst),
.i_data_in(o_gray),
.i_save(o_b1_save),
.i_clear(o_b1_clear),
.o_full(o_full),
.o_empty(o_empty),
.o_m1(o_m1),
.o_m2(o_m2),
.o_m3(o_m3),
.o_m4(o_m4),
.o_m5(o_m5),
.o_m6(o_m6),
.o_m7(o_m7),
.o_m8(o_m8),
.o_m9(o_m9),
.o_m10(o_m10),
.o_m11(o_m11),
.o_m12(o_m12),
.o_m13(o_m13),
.o_m14(o_m14),
.o_m15(o_m15),
.o_m16(o_m16),
.o_m17(o_m17),
.o_m18(o_m18),
.o_m19(o_m19),
.o_m20(o_m20),
.o_m21(o_m21),
.o_m22(o_m22),
.o_m23(o_m23),
.o_m24(o_m24),
.o_m25(o_m25)
);

edge_detection_core EDC_DUT
(
.clk(clk),
.n_rst(n_rst),
.i_m1(o_m1),
.i_m2(o_m2),
.i_m3(o_m3),
.i_m4(o_m4),
.i_m5(o_m5),
.i_m6(o_m6),
.i_m7(o_m7),
.i_m8(o_m8),
.i_m9(o_m9),
.i_m10(o_m10),
.i_m11(o_m11),
.i_m12(o_m12),
.i_m13(o_m13),
.i_m14(o_m14),
.i_m15(o_m15),
.i_m16(o_m16),
.i_m17(o_m17),
.i_m18(o_m18),
.i_m19(o_m19),
.i_m20(o_m20),
.i_m21(o_m21),
.i_m22(o_m21),
.i_m23(o_m23),
.i_m24(o_m24),
.i_m25(o_m25),
i_gradient_start(o_gradient_start),
o_gradient_ready(o_gradient_ready),
o_processed_sum_1(o_processed_sum_1),
o_processed_sum_2(o_processed_sum_2),
o_processed_sum_3(o_processed_sum_3),
o_processed_sum_4(o_processed_sum_4),
o_processed_sum_5(o_processed_sum_5),
o_processed_sum_6(o_processed_sum_6),
o_processed_sum_7(o_processed_sum_7),
o_processed_sum_8(o_processed_sum_8),
o_processed_sum_9(o_processed_sum_9)
);


buffer_2 B1_DUT
(
.clk(clk),
.n_rst(n_rst),
.i_processed_sum_1(o_processed_sum_1),
.i_processed_sum_2(o_processed_sum_2),
.i_processed_sum_3(o_processed_sum_3),
.i_processed_sum_4(o_processed_sum_4),
.i_processed_sum_5(o_processed_sum_5),
.i_processed_sum_6(o_processed_sum_6),
.i_processed_sum_7(o_processed_sum_7),
.i_processed_sum_8(o_processed_sum_8),
.i_processed_sum_9(o_processed_sum_9),
.i_save(o_b2_save),
.i_write_complete(o_complete),
.o_empty(o_empty_2),
.o_full(o_full_2),
.o_buffer2_data(o_buffer2_data),
.o_write_enable.(o_write_enable)
);


mcu MCU_DUT
(
.clk(clk),
.n_rst(n_rst),
.i_stop(),
.i_read_complete(read_complete),
.i_grayscale_data_ready(o_grayscale_data_ready),
.i_b1_full(o_full),
.i_gradient_data_ready(o_gradient_ready),
.i_start_next_write(),
.i_write_complete(write_complete),
.i_b2_empty(o_empty_2),
.o_mcu_raddr(o_mcu_raddr),
.o_re(o_re),
.o_grayscale_start(o_grayscale_start),
.o_b1_save(o_b1_save),
.o_b1_clear(o_b1_clear),
.o_gradient_start(o_gradient_start),
.o_b2_save(o_b2_save),
.o_mcu_waddr(o_mcu_waddr),
.o_we(o_we),
.o_complete(o_complete)
);






endmodule





