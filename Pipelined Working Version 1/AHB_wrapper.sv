// $Id: $
// File name:   AHB_wrapper.sv
// Created:     4/16/2017
// Author:      Paul Swartz
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: AHB Wrapper File
module AHB_wrapper
(
	input wire clk,
	input wire n_rst,
	output wire done,
	input wire [31:0] s_haddr,
	output reg [31:0] m_haddr,
	output reg [31:0] s_hrdata,
	input wire [31:0] m_hrdata,
	output reg [31:0] m_hwdata,
	input wire [31:0] s_hwdata,
	input wire s_hwrite,
	output reg m_hwrite,
	output reg s_hready,
	input wire m_hready,
	input wire re,
	input wire we,
	input wire [31:0] buffer2_data,
	output reg [31:0] greyscale_data,
	output reg read_complete, 
	output reg write_complete
);
	reg[31:0] start_waddr;
	reg[31:0] start_raddr;
	reg[15:0] img_width;
	reg[15:0] img_height;
	reg waddr_ready;
	reg raddr_ready;
	reg inc_raddr;
	reg inc_waddr;
	reg[31:0] raddr;
	reg[31:0] waddr;

	AHB I 
	(
		.clk(clk),
		.n_rst(n_rst),
		.hready(m_hready),
		.re(re),
		.we(we),
		.raddr_ready(raddr_ready),
		.waddr_ready(waddr_ready),
		.waddr(waddr),
		.raddr(raddr),
		.buffer2_data(buffer2_data),
		.hrdata(m_hrdata),
		.greyscale_data(greyscale_data),
		.haddr(m_haddr),
		.hwdata(m_hwdata),
		.hwrite(m_hwrite),
		.read_complete(read_complete),
		.write_complete(write_complete),
		.inc_raddr(inc_raddr),
		.inc_waddr(inc_waddr)
	);
	AHB_slave II 
	(
		.clk(clk),
		.n_rst(n_rst),
		.done(done),
		.haddr(s_haddr),
		.hwrite(s_hwrite),
		.hwdata(s_hwdata),
		.hrdata(s_hrdata),
		.hready(s_hready),
		.start_waddr(start_waddr),
		.start_raddr(start_raddr),
		.img_width(img_width),
		.img_height(img_height)
	);
	address_counter III
	(
		.clk(clk),
		.n_rst(n_rst),
		.i_init_raddr(start_raddr),
		.i_init_waddr(200000),
		.i_img_width(img_width),
		.i_img_height(img_height),
		.i_inc_raddr(inc_raddr),
		.i_inc_waddr(inc_waddr),
		.o_raddr(raddr),
		.o_waddr(waddr),
		.o_r_ready(raddr_ready),
		.o_w_ready(waddr_ready),
		.o_done(done)
	);
endmodule	
