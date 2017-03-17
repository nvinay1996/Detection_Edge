// $Id: $
// File name:   tb_buffer_2.sv
// Created:     3/16/2017
// Author:      Chia-Hua Peng
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: test bench for buffer_2.sv

`timescale 1ns / 10ps

module tb_buffer_2();

	// Define parameters
	localparam CLK_PERIOD  = 4;  
	localparam CHECK_DELAY 	= 1; 

  
	// Device Under Test
 	logic tb_clk;
	logic tb_n_rst;
	logic [7:0] tb_processed_sum_1;
	logic [7:0] tb_processed_sum_2;
	logic [7:0] tb_processed_sum_3;
	logic [7:0] tb_processed_sum_4;
	logic [7:0] tb_processed_sum_5;
	logic [7:0] tb_processed_sum_6;
	logic [7:0] tb_processed_sum_7;
	logic [7:0] tb_processed_sum_8;
	logic [7:0] tb_processed_sum_9;
	logic tb_save;
	logic tb_write_complete;
	logic tb_empty;
	logic tb_full;
	logic [31:0] tb_buffer2_data;
	logic tb_start_next_write;


	
	logic expected_full;
	logic expected_empty;
	logic expected_start_next_write;
	logic [23:0] expected_out_rgb;
	logic [23:0] tb_out_rgb;

	assign tb_out_rgb = tb_buffer2_data[31:8];

	buffer_2 DUT (
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.i_processed_sum_1(tb_processed_sum_1),
		.i_processed_sum_2(tb_processed_sum_2),
		.i_processed_sum_3(tb_processed_sum_3),
		.i_processed_sum_4(tb_processed_sum_4),
		.i_processed_sum_5(tb_processed_sum_5),
		.i_processed_sum_6(tb_processed_sum_6),
		.i_processed_sum_7(tb_processed_sum_7),
		.i_processed_sum_8(tb_processed_sum_8),
		.i_processed_sum_9(tb_processed_sum_9),
		.i_save(tb_save),
		.i_write_complete(tb_write_complete),
		.o_empty(tb_empty),
		.o_full(tb_full),
		.o_buffer2_data(tb_buffer2_data),
		.o_start_next_write(tb_start_next_write)
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

// Test bench procedures
	initial begin

	// Initialize input signals
	tb_n_rst = 1'b1;
	tb_processed_sum_1 = 8'd12;
	tb_processed_sum_2 = 8'd255-8'd12;
	tb_processed_sum_3 = 8'd0;
	tb_processed_sum_4 = 8'd255;
	tb_processed_sum_5 = 8'd0;
	tb_processed_sum_6 = 8'd255 - 8'd64;
	tb_processed_sum_7 = 8'd64;
	tb_processed_sum_8 = 8'd39;
	tb_processed_sum_9 = 8'd255 - 8'd39;
	tb_save = 1'b0;
	tb_write_complete = 1'b0;

	expected_out_rgb = 24'b0;	
	expected_full = 1'b0;
	expected_empty = 1'b1;
	expected_start_next_write = 1'b0;
	
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
	@(posedge tb_clk);

	expected_out_rgb = 24'b0;	
	expected_full = 1'b0;
	expected_empty = 1'b1;
	expected_start_next_write = 1'b0;

	#(CHECK_DELAY);
	if (tb_out_rgb == expected_out_rgb) begin
		$info("Test Case %d - Correct Buffer2_data Output  - PASSED", test_case);
	end else begin
		$error("Test Case %d - Incorrect Buffer2_data Output - FAILED", test_case);
	end
	if (tb_empty == expected_empty && tb_full == expected_full) begin
		$info("Test Case %d - Correct Empty Full Output - PASSED", test_case);
	end else begin
		$error("Test Case %d - Incorrect Empty Full Output - FAILED", test_case);
	end
	if (tb_start_next_write == expected_start_next_write) begin
		$info("Test Case %d - Correct start_next_write Output - PASSED", test_case);
	end else begin
		$error("Test Case %d - Incorrect start_next_write Output - FAILED", test_case);
	end

// Test Case 1
	test_case = test_case + 1;
	tb_n_rst = 1;
	@(posedge tb_clk);
	tb_n_rst = 0;
	@(posedge tb_clk);
	tb_n_rst = 1;
	@(posedge tb_clk);
	tb_n_rst = 1'b1;
	tb_processed_sum_1 = 8'd12;
	tb_processed_sum_2 = 8'd21;
	tb_processed_sum_3 = 8'd252;
	tb_processed_sum_4 = 8'd40;
	tb_processed_sum_5 = 8'd67;
	tb_processed_sum_6 = 8'd255;
	tb_processed_sum_7 = 8'd117;
	tb_processed_sum_8 = 8'd134;
	tb_processed_sum_9 = 8'd239;

	tb_save = 1'b1;
	tb_write_complete = 1'b0;
	@(posedge tb_clk)
	tb_save = 1'b0;
	@(posedge tb_clk)

	expected_full = 1'b1;
	expected_empty = 1'b0;
	expected_out_rgb = {tb_processed_sum_1, tb_processed_sum_1, tb_processed_sum_1};	

	#(CHECK_DELAY);
	if (tb_empty == expected_empty && tb_full == expected_full) begin
		$info("Test Case %d - Correct Empty Full Output - PASSED", test_case);
	end else begin
		$error("Test Case %d - Incorrect Empty Full Output - FAILED", test_case);
	end

	@(posedge tb_clk)
	@(posedge tb_clk)
	@(posedge tb_clk)
	@(posedge tb_clk)
	@(posedge tb_clk)

	#(CHECK_DELAY);
	if (tb_out_rgb == expected_out_rgb) begin
		$info("Test Case %d - Correct Buffer2_data Output  - PASSED", test_case);
	end else begin
		$error("Test Case %d - Incorrect Buffer2_data Output - FAILED", test_case);
	end

// Test Case 2
	test_case = test_case + 1;
	tb_write_complete = 1'b1;
	@(posedge tb_clk)
	tb_write_complete = 1'b0;
	@(posedge tb_clk)
	@(posedge tb_clk)
	@(posedge tb_clk)
	@(posedge tb_clk)
	@(posedge tb_clk)
	@(posedge tb_clk)

	expected_full = 1'b0;
	expected_empty = 1'b0;
	expected_out_rgb = {tb_processed_sum_2, tb_processed_sum_2, tb_processed_sum_2};	

	#(CHECK_DELAY);
	if (tb_out_rgb == expected_out_rgb) begin
		$info("Test Case %d - Correct Buffer2_data Output  - PASSED", test_case);
	end else begin
		$error("Test Case %d - Incorrect Buffer2_data Output - FAILED", test_case);
	end

// Test Case 3
	test_case = test_case + 1;
	tb_write_complete = 1'b1;
	@(posedge tb_clk)
	tb_write_complete = 1'b0;
	@(posedge tb_clk)
	@(posedge tb_clk)
	@(posedge tb_clk)
	@(posedge tb_clk)
	@(posedge tb_clk)
	@(posedge tb_clk)

	expected_full = 1'b0;
	expected_empty = 1'b0;
	expected_out_rgb = {tb_processed_sum_3, tb_processed_sum_3, tb_processed_sum_3};	

	#(CHECK_DELAY);
	if (tb_out_rgb == expected_out_rgb) begin
		$info("Test Case %d - Correct Buffer2_data Output  - PASSED", test_case);
	end else begin
		$error("Test Case %d - Incorrect Buffer2_data Output - FAILED", test_case);
	end

// Test Case 4
	test_case = test_case + 1;
	tb_write_complete = 1'b1;
	@(posedge tb_clk)
	tb_write_complete = 1'b0;
	@(posedge tb_clk)
	@(posedge tb_clk)
	@(posedge tb_clk)
	@(posedge tb_clk)
	@(posedge tb_clk)
	@(posedge tb_clk)

	expected_full = 1'b0;
	expected_empty = 1'b0;
	expected_out_rgb = {tb_processed_sum_4, tb_processed_sum_4, tb_processed_sum_4};	

	#(CHECK_DELAY);
	if (tb_out_rgb == expected_out_rgb) begin
		$info("Test Case %d - Correct Buffer2_data Output  - PASSED", test_case);
	end else begin
		$error("Test Case %d - Incorrect Buffer2_data Output - FAILED", test_case);
	end

// Test Case 5
	test_case = test_case + 1;
	tb_write_complete = 1'b1;
	@(posedge tb_clk)
	tb_write_complete = 1'b0;
	@(posedge tb_clk)
	@(posedge tb_clk)
	@(posedge tb_clk)
	@(posedge tb_clk)
	@(posedge tb_clk)
	@(posedge tb_clk)

	expected_full = 1'b0;
	expected_empty = 1'b0;
	expected_out_rgb = {tb_processed_sum_5, tb_processed_sum_5, tb_processed_sum_5};	

	#(CHECK_DELAY);
	if (tb_out_rgb == expected_out_rgb) begin
		$info("Test Case %d - Correct Buffer2_data Output  - PASSED", test_case);
	end else begin
		$error("Test Case %d - Incorrect Buffer2_data Output - FAILED", test_case);
	end

// Test Case 6
	test_case = test_case + 1;
	tb_write_complete = 1'b1;
	@(posedge tb_clk)
	tb_write_complete = 1'b0;
	@(posedge tb_clk)
	@(posedge tb_clk)
	@(posedge tb_clk)
	@(posedge tb_clk)
	@(posedge tb_clk)
	@(posedge tb_clk)

	expected_full = 1'b0;
	expected_empty = 1'b0;
	expected_out_rgb = {tb_processed_sum_6, tb_processed_sum_6, tb_processed_sum_6};	

	#(CHECK_DELAY);
	if (tb_out_rgb == expected_out_rgb) begin
		$info("Test Case %d - Correct Buffer2_data Output  - PASSED", test_case);
	end else begin
		$error("Test Case %d - Incorrect Buffer2_data Output - FAILED", test_case);
	end

// Test Case 7
	test_case = test_case + 1;
	tb_write_complete = 1'b1;
	@(posedge tb_clk)
	tb_write_complete = 1'b0;
	@(posedge tb_clk)
	@(posedge tb_clk)
	@(posedge tb_clk)
	@(posedge tb_clk)
	@(posedge tb_clk)
	@(posedge tb_clk)

	expected_full = 1'b0;
	expected_empty = 1'b0;
	expected_out_rgb = {tb_processed_sum_7, tb_processed_sum_7, tb_processed_sum_7};	

	#(CHECK_DELAY);
	if (tb_out_rgb == expected_out_rgb) begin
		$info("Test Case %d - Correct Buffer2_data Output  - PASSED", test_case);
	end else begin
		$error("Test Case %d - Incorrect Buffer2_data Output - FAILED", test_case);
	end

// Test Case 8
	test_case = test_case + 1;
	tb_write_complete = 1'b1;
	@(posedge tb_clk)
	tb_write_complete = 1'b0;
	@(posedge tb_clk)
	@(posedge tb_clk)
	@(posedge tb_clk)
	@(posedge tb_clk)
	@(posedge tb_clk)
	@(posedge tb_clk)

	expected_full = 1'b0;
	expected_empty = 1'b0;
	expected_out_rgb = {tb_processed_sum_8, tb_processed_sum_8, tb_processed_sum_8};	

	#(CHECK_DELAY);
	if (tb_out_rgb == expected_out_rgb) begin
		$info("Test Case %d - Correct Buffer2_data Output  - PASSED", test_case);
	end else begin
		$error("Test Case %d - Incorrect Buffer2_data Output - FAILED", test_case);
	end

// Test Case 9
	test_case = test_case + 1;
	tb_write_complete = 1'b1;
	@(posedge tb_clk)
	tb_write_complete = 1'b0;
	@(posedge tb_clk)
	@(posedge tb_clk)
	@(posedge tb_clk)
	@(posedge tb_clk)
	@(posedge tb_clk)
	@(posedge tb_clk)

	expected_out_rgb = {tb_processed_sum_9, tb_processed_sum_9, tb_processed_sum_9};	

	#(CHECK_DELAY);
	if (tb_out_rgb == expected_out_rgb) begin
		$info("Test Case %d - Correct Buffer2_data Output  - PASSED", test_case);
	end else begin
		$error("Test Case %d - Incorrect Buffer2_data Output - FAILED", test_case);
	end

// Test Case 10
	test_case = test_case + 1;
	tb_write_complete = 1'b1;
	@(posedge tb_clk)
	tb_write_complete = 1'b0;
	@(posedge tb_clk)
	@(posedge tb_clk)
	@(posedge tb_clk)
	@(posedge tb_clk)
	@(posedge tb_clk)
	@(posedge tb_clk)

	expected_full = 1'b0;
	expected_empty = 1'b1;
	expected_out_rgb = {tb_processed_sum_9, tb_processed_sum_9, tb_processed_sum_9};	

	#(CHECK_DELAY);
	if (tb_out_rgb == expected_out_rgb) begin
		$info("Test Case %d - Correct Buffer2_data Output  - PASSED", test_case);
	end else begin
		$error("Test Case %d - Incorrect Buffer2_data Output - FAILED", test_case);
	end
	if (tb_empty == expected_empty && tb_full == expected_full) begin
		$info("Test Case %d - Correct Empty Full Output - PASSED", test_case);
	end else begin
		$error("Test Case %d - Incorrect Empty Full Output - FAILED", test_case);
	end

// Test Case 11
	test_case = test_case + 1;
	tb_processed_sum_1 = 8'd255 - 8'd12;
	tb_processed_sum_2 = 8'd12;
	tb_processed_sum_3 = 8'd255;
	tb_processed_sum_4 = 8'd0;
	tb_processed_sum_5 = 8'd255;
	tb_processed_sum_6 = 8'd64;
	tb_processed_sum_7 = 8'd255 - 8'd64;
	tb_processed_sum_8 = 8'd255 - 8'd39;
	tb_processed_sum_9 = 8'd39;

	@(posedge tb_clk);

	tb_processed_sum_1 = 8'd12;
	tb_processed_sum_2 = 8'd255-8'd12;
	tb_processed_sum_3 = 8'd0;
	tb_processed_sum_4 = 8'd255;
	tb_processed_sum_5 = 8'd0;
	tb_processed_sum_6 = 8'd255 - 8'd64;
	tb_processed_sum_7 = 8'd64;
	tb_processed_sum_8 = 8'd39;
	tb_processed_sum_9 = 8'd255 - 8'd39;

	@(posedge tb_clk);



	end // end initial
endmodule
