// $Id: $
// File name:   tb_mcu.sv
// Created:     3/17/2017
// Author:      Chia-Hua Peng
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: test bench for mcu
// $Id: $

`timescale 1ns / 10ps

module tb_mcu();

	// Define parameters
	localparam CLK_PERIOD  = 4;  
	localparam CHECK_DELAY 	= 1; 

  
	// Device Under Test
 	logic tb_clk;
	logic tb_n_rst;
	logic tb_i_stop;
	logic tb_i_read_complete;
	logic tb_i_grayscale_data_ready;
	logic tb_i_b1_full;
	logic tb_i_gradient_data_ready;
	logic tb_i_start_next_write;
	logic tb_i_write_complete;
	logic tb_i_b2_empty;
	logic [31:0] tb_o_mcu_raddr;
	logic tb_o_re;
	logic tb_o_grayscale_start;
	logic tb_o_b1_save;
	logic tb_o_gradient_start;
	logic tb_o_b2_save;
	logic [31:0] tb_o_mcu_waddr;
	logic tb_o_we;
	logic tb_o_complete;

	mcu DUT (
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.i_stop(tb_i_stop),
		.i_read_complete(tb_i_read_complete),
		.i_grayscale_data_ready(tb_i_grayscale_data_ready),
		.i_b1_full(tb_i_b1_full),
		.i_gradient_data_ready(tb_i_gradient_data_ready),
		.i_start_next_write(tb_i_start_next_write),
		.i_write_complete(tb_i_write_complete),
		.i_b2_empty(tb_i_b2_empty),
		.o_mcu_raddr(tb_o_mcu_raddr),
		.o_re(tb_o_re),
		.o_grayscale_start(tb_o_grayscale_start),
		.o_b1_save(tb_o_b1_save),
		.o_gradient_start(tb_o_gradient_start),
		.o_b2_save(tb_o_b2_save),
		.o_mcu_waddr(tb_o_mcu_waddr),
		.o_we(tb_o_we),
		.o_complete(tb_o_complete)
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
	integer b1 = 0;
	integer b2 = 0;

// Test bench procedures
	initial begin

	// Initialize input signal
	tb_n_rst = 1'b1;
	tb_i_stop = 1'b0;
	tb_i_read_complete = 1'b0;
	tb_i_grayscale_data_ready = 1'b0;
	tb_i_b1_full = 1'b0;
	tb_i_gradient_data_ready = 1'b0;
	tb_i_start_next_write = 1'b0;
	tb_i_write_complete = 1'b0;
	tb_i_b2_empty = 1'b0;
	
	// Initial device power on
	#(0.1);
	tb_n_rst = 1'b0;
	#(CLK_PERIOD * 2.25);   // Come out of reset asynchronously
	tb_n_rst = 1'b1;
	#(CLK_PERIOD);          // Wait for device to stabalize

// Test Case 0 - asynchronous reset
	test_case = 0;
	tb_n_rst = 1;
	@(posedge tb_clk);
	tb_n_rst = 0;
	@(posedge tb_clk);
	tb_n_rst = 1;

	for (test_case = 0; test_case < 20; test_case = test_case + 1) begin
		b1 = 0;
		while (tb_i_b1_full == 1'b0) begin		
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
	
			tb_i_read_complete = 1'b1;
			@(posedge tb_clk);
			tb_i_read_complete = 1'b0;
			@(posedge tb_clk);
	
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
	
			tb_i_grayscale_data_ready = 1'b1;
			@(posedge tb_clk);
			tb_i_grayscale_data_ready  = 1'b0;
			b1 = b1 + 1;
			@(posedge tb_clk);
			if (b1 == 25)
				tb_i_b1_full = 1'b1;
		end

		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);

		tb_i_gradient_data_ready = 1'b1;
		@(posedge tb_clk);
		tb_i_gradient_data_ready = 1'b0;
		tb_i_b1_full = 1'b0;
		tb_i_b2_empty = 1'b0;
		b2 = 9;
		@(posedge tb_clk);		
		while(tb_i_b2_empty == 1'b0) begin
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);	

			tb_i_start_next_write = 1'b1;
			@(posedge tb_clk);
			tb_i_start_next_write = 1'b0;
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);	
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);	
			tb_i_write_complete = 1'b1;
			@(posedge tb_clk);
			tb_i_write_complete = 1'b0;
			b2 = b2 - 1;
			@(posedge tb_clk);
			if (b2 == 0)
				tb_i_b2_empty = 1'b1;
		end

	end
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);	

	end // end initial
endmodule
