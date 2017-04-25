// $Id: $
// File name:   tb_address_counter.sv
// Created:     3/23/2017
// Author:      Chia-Hua Peng
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: test bench for address counter

`timescale 1ns / 10ps

module tb_address_counter();

	// Define parameters
	localparam CLK_PERIOD  = 4;  
	localparam CHECK_DELAY 	= 1; 

  
	// Device Under Test
 	logic tb_clk;
	logic tb_n_rst;
	logic tb_inc_raddr;
	logic tb_inc_waddr;
	logic [31:0] tb_raddr;
	logic [31:0] tb_waddr;
	logic tb_r_ready;
	logic tb_w_ready;

	address_counter DUT (
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.i_inc_raddr(tb_inc_raddr),
		.i_inc_waddr(tb_inc_waddr),
		.i_init_raddr(32'd1),
		.i_init_waddr(32'd200001),
		.i_img_width(16'd428),
		.i_img_height(16'd428),
		.o_raddr(tb_raddr),
		.o_waddr(tb_waddr),
		.o_r_ready(tb_r_ready),
		.o_w_ready(tb_w_ready)
	);

	// Generate clock signal
	always begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end
	
	// Expected Values Initializations
	integer test_case = 0;
	integer i = 0;

// Test bench procedures
	initial begin

	// Initialize input signals
	tb_n_rst = 1'b1;
	tb_inc_raddr = 1'b0;
	tb_inc_waddr = 1'b0;
	
	// Initial device power on
	#(0.1);
	tb_n_rst = 1'b0;
	#(CLK_PERIOD * 2.25);   // Come out of reset asynchronously
	tb_n_rst = 1'b1;
	#(CLK_PERIOD);          // Wait for device to stabalize


	test_case = 0;
	tb_n_rst = 1;
	@(posedge tb_clk);
	tb_n_rst = 0;
	@(posedge tb_clk);
	tb_n_rst = 1;
	@(posedge tb_clk);

	for (test_case = 1; test_case <= 20164; test_case = test_case + 1)
	begin
		for (i = 0; i < 25; i += 1) begin
			tb_inc_raddr = 1'b1;
			@(posedge tb_clk);
			tb_inc_raddr = 1'b0;
			while (tb_r_ready == 0) begin
				@(posedge tb_clk);
			end
		end
		for (i = 0; i < 9; i += 1) begin
			tb_inc_waddr = 1'b1;
			@(posedge tb_clk);
			tb_inc_waddr = 1'b0;
			while (tb_w_ready == 0) begin
				@(posedge tb_clk);
			end
		end
	end

	end // end initial
endmodule

