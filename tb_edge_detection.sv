// $Id: $
// File name:   tb_edge_detection.sv
// Created:     3/14/2017
// Author:      Chia-Hua Peng, Vinay Nagarajan
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: test bench for edge detection

`timescale 1ns / 10ps

module tb_edge_detection();

	// Define parameters
	localparam CLK_PERIOD  = 4;  
	localparam CHECK_DELAY 	= 1; 

  
	// Device Under Test
 	logic tb_clk;
	logic tb_n_rst;
	logic tb_gradient_start;
	logic [7:0] tb_P0;
	logic [7:0] tb_P1;
	logic [7:0] tb_P2;
	logic [7:0] tb_P3;
	logic [7:0] tb_P4;
	logic [7:0] tb_P5;
	logic [7:0] tb_P6;
	logic [7:0] tb_P7;
	logic [7:0] tb_P8;
	logic tb_gradient_data_ready;
	logic [7:0] tb_processed_sum;

	logic [7:0] expected_processed_sum;

	edge_detection DUT (
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.i_gradient_start(tb_gradient_start),
		.P0(tb_P0),
		.P1(tb_P1),
		.P2(tb_P2),
		.P3(tb_P3),
		.P4(tb_P4),
		.P5(tb_P5),
		.P6(tb_P6),
		.P7(tb_P7),
		.P8(tb_P8),
		.o_gradient_data_ready(tb_gradient_data_ready),
		.o_processed_sum(tb_processed_sum)
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
	tb_n_rst = 1'b0;
	tb_gradient_start = 1'b0;
	tb_P0 = 8'd0;
	tb_P1 = 8'd0;
	tb_P2 = 8'd0;
	tb_P3 = 8'd0;
	tb_P4 = 8'd0;
	tb_P5 = 8'd0;
	tb_P6 = 8'd0;
	tb_P7 = 8'd0;
	tb_P8 = 8'd0;

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

	#(CHECK_DELAY);
	if (tb_processed_sum == 8'd0) begin
		$info("Test Case 0 - PASSED");
	end else begin
		$error("Test Case 0 - FAILED");
	end
	if (tb_gradient_data_ready == 1'b0) begin
		$info("Test Case 0 - PASSED");
	end else begin
		$error("Test Case 0 - FAILED");
	end

// Test Case 1 - Not Start, Data Not Ready
	test_case = test_case + 1;
	tb_n_rst = 1;
	@(posedge tb_clk);
	tb_n_rst = 0;
	@(posedge tb_clk);
	tb_n_rst = 1;
	tb_gradient_start = 1'b0;
	tb_P0 = 8'd31;
	tb_P1 = 8'd224;
	tb_P2 = 8'd224;
	tb_P3 = 8'd31;
	tb_P4 = 8'd31;
	tb_P5 = 8'd224;
	tb_P6 = 8'd31;
	tb_P7 = 8'd31;
	tb_P8 = 8'd224;


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
	@(posedge tb_clk);
	@(posedge tb_clk);

	#(CHECK_DELAY);
	if (tb_gradient_data_ready == 1'b0) begin
		$info("Test Case 1 - PASSED");
	end else begin
		$error("Test Case 1 - FAILED");
	end

// Test Case 2
	test_case = test_case + 1;
	tb_n_rst = 1;
	@(posedge tb_clk);
	tb_n_rst = 0;
	@(posedge tb_clk);
	tb_n_rst = 1;
	tb_gradient_start = 1'b1;
	tb_P0 = 8'd31;
	tb_P1 = 8'd224;
	tb_P2 = 8'd224;
	tb_P3 = 8'd31;
	tb_P4 = 8'd31;
	tb_P5 = 8'd224;
	tb_P6 = 8'd31;
	tb_P7 = 8'd31;
	tb_P8 = 8'd224;

	expected_processed_sum = 8'd255;

	@(posedge tb_clk);
	tb_gradient_start = 1'b0;
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
	@(posedge tb_clk);

	#(CHECK_DELAY);
	if (tb_processed_sum == expected_processed_sum) begin
		$info("Test Case %d - PASSED", test_case);
	end else begin
		$error("Test Case %d - FAILED", test_case);
	end

	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);

// Test Case 3
	test_case = test_case + 1;
	tb_n_rst = 1;
	@(posedge tb_clk);
	tb_n_rst = 0;
	@(posedge tb_clk);
	tb_n_rst = 1;
	tb_gradient_start = 1'b1;
	tb_P0 = 8'd224;
	tb_P1 = 8'd31;
	tb_P2 = 8'd31;
	tb_P3 = 8'd224;
	tb_P4 = 8'd224;
	tb_P5 = 8'd31;
	tb_P6 = 8'd224;
	tb_P7 = 8'd224;
	tb_P8 = 8'd31;

	expected_processed_sum = 8'd255;

	@(posedge tb_clk);
	tb_gradient_start = 1'b0;
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
	@(posedge tb_clk);



	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);

	tb_gradient_start = 1'b1;
	tb_P0 = 8'd31;
	tb_P1 = 8'd224;
	tb_P2 = 8'd224;
	tb_P3 = 8'd31;
	tb_P4 = 8'd31;
	tb_P5 = 8'd224;
	tb_P6 = 8'd31;
	tb_P7 = 8'd31;
	tb_P8 = 8'd224;

	expected_processed_sum = 8'd255;

	@(posedge tb_clk);
	tb_gradient_start = 1'b0;
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
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);

	#(CHECK_DELAY);
	if (tb_processed_sum == expected_processed_sum) begin
		$info("Test Case %d - PASSED", test_case);
	end else begin
		$error("Test Case %d - FAILED", test_case);
	end

	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);

	tb_gradient_start = 1'b1;
	tb_P0 = 8'd224;
	tb_P1 = 8'd31;
	tb_P2 = 8'd31;
	tb_P3 = 8'd224;
	tb_P4 = 8'd224;
	tb_P5 = 8'd31;
	tb_P6 = 8'd224;
	tb_P7 = 8'd224;
	tb_P8 = 8'd31;

	expected_processed_sum = 8'd255;

	@(posedge tb_clk);
	tb_gradient_start = 1'b0;
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
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);

	#(CHECK_DELAY);
	if (tb_processed_sum == expected_processed_sum) begin
		$info("Test Case %d - PASSED", test_case);
	end else begin
		$error("Test Case %d - FAILED", test_case);
	end

	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);

// Test Case 4
	test_case = test_case + 1;
	tb_n_rst = 1;
	@(posedge tb_clk);
	tb_n_rst = 0;
	@(posedge tb_clk);
	tb_n_rst = 1;
	tb_gradient_start = 1'b1;            /// Modify Here for additional Test cases
	tb_P0 = 8'd27;
	tb_P1 = 8'd24;
	tb_P2 = 8'd29;
	tb_P3 = 8'd25;
	tb_P4 = 8'd31;
	tb_P5 = 8'd27;
	tb_P6 = 8'd23;
	tb_P7 = 8'd28;
	tb_P8 = 8'd24;

	expected_processed_sum = 8'd8;	     /// To Here

	@(posedge tb_clk);
	tb_gradient_start = 1'b0;
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
	@(posedge tb_clk);

	#(CHECK_DELAY);
	if (tb_processed_sum == expected_processed_sum) begin
		$info("Test Case %d - PASSED", test_case);
	end else begin
		$error("Test Case %d - FAILED", test_case);
	end

	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);


// Test Case 5
	test_case = test_case + 1;
	tb_n_rst = 1;
	@(posedge tb_clk);
	tb_n_rst = 0;
	@(posedge tb_clk);
	tb_n_rst = 1;
	tb_gradient_start = 1'b1;            /// Modify Here for additional Test cases
	tb_P0 = 8'd255;
	tb_P1 = 8'd255;
	tb_P2 = 8'd249;
	tb_P3 = 8'd252;
	tb_P4 = 8'd225;
	tb_P5 = 8'd244;
	tb_P6 = 8'd253;
	tb_P7 = 8'd247;
	tb_P8 = 8'd251;

	expected_processed_sum = 8'd40;	     /// To Here

	@(posedge tb_clk);
	tb_gradient_start = 1'b0;
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
	@(posedge tb_clk);

	#(CHECK_DELAY);
	if (tb_processed_sum == expected_processed_sum) begin
		$info("Test Case %d - PASSED", test_case);
	end else begin
		$error("Test Case %d - FAILED", test_case);
	end

	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);


// Test Case 6
	test_case = test_case + 1;
	tb_n_rst = 1;
	@(posedge tb_clk);
	tb_n_rst = 0;
	@(posedge tb_clk);
	tb_n_rst = 1;
	tb_gradient_start = 1'b1;            /// Modify Here for additional Test cases
	tb_P0 = 8'd0;
	tb_P1 = 8'd0;
	tb_P2 = 8'd0;
	tb_P3 = 8'd1;
	tb_P4 = 8'd1;
	tb_P5 = 8'd0;
	tb_P6 = 8'd255;
	tb_P7 = 8'd255;
	tb_P8 = 8'd0;

	expected_processed_sum = 8'd255;	     /// To Here

	@(posedge tb_clk);
	tb_gradient_start = 1'b0;
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
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);

	#(CHECK_DELAY);
	if (tb_processed_sum == expected_processed_sum) begin
		$info("Test Case %d - PASSED", test_case);
	end else begin
		$error("Test Case %d - FAILED", test_case);
	end

	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);


// Test Case 7
	test_case = test_case + 1;
	tb_n_rst = 1;
	@(posedge tb_clk);
	tb_n_rst = 0;
	@(posedge tb_clk);
	tb_n_rst = 1;
	tb_gradient_start = 1'b1;            /// Modify Here for additional Test cases
	tb_P0 = 8'd1;
	tb_P1 = 8'd0;
	tb_P2 = 8'd15;
	tb_P3 = 8'd3;
	tb_P4 = 8'd10;
	tb_P5 = 8'd0;
	tb_P6 = 8'd0;
	tb_P7 = 8'd9;
	tb_P8 = 8'd0;

	expected_processed_sum = 8'd10;	     /// To Here

	@(posedge tb_clk);
	tb_gradient_start = 1'b0;
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



	#(CHECK_DELAY);
	if (tb_processed_sum == expected_processed_sum) begin
		$info("Test Case %d - PASSED", test_case);
	end else begin
		$error("Test Case %d - FAILED", test_case);
	end

	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);

// Test Case 8
	test_case = test_case + 1;
	tb_n_rst = 1;
	@(posedge tb_clk);
	tb_n_rst = 0;
	@(posedge tb_clk);
	tb_n_rst = 1;
	tb_gradient_start = 1'b1;            /// Modify Here for additional Test cases
	tb_P0 = 8'd0;
	tb_P1 = 8'd10;
	tb_P2 = 8'd0;
	tb_P3 = 8'd255;
	tb_P4 = 8'd255;
	tb_P5 = 8'd255;
	tb_P6 = 8'd10;
	tb_P7 = 8'd0;
	tb_P8 = 8'd0;

	expected_processed_sum = 8'd20;	     /// To Here

	@(posedge tb_clk);
	tb_gradient_start = 1'b0;
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



	#(CHECK_DELAY);
	if (tb_processed_sum == expected_processed_sum) begin
		$info("Test Case %d - PASSED", test_case);
	end else begin
		$error("Test Case %d - FAILED", test_case);
	end

	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);

// Test Case 9
	test_case = test_case + 1;
	tb_n_rst = 1;
	@(posedge tb_clk);
	tb_n_rst = 0;
	@(posedge tb_clk);
	tb_n_rst = 1;
	tb_gradient_start = 1'b1;            /// Modify Here for additional Test cases
	tb_P0 = 8'd10;
	tb_P1 = 8'd10;
	tb_P2 = 8'd9;
	tb_P3 = 8'd7;
	tb_P4 = 8'd0;
	tb_P5 = 8'd8;
	tb_P6 = 8'd1;
	tb_P7 = 8'd9;
	tb_P8 = 8'd10;

	expected_processed_sum = 8'd20;	     /// To Here

	@(posedge tb_clk);
	tb_gradient_start = 1'b0;
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



	#(CHECK_DELAY);
	if (tb_processed_sum == expected_processed_sum) begin
		$info("Test Case %d - PASSED", test_case);
	end else begin
		$error("Test Case %d - FAILED", test_case);
	end

	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);

// Test Case 10
	test_case = test_case + 1;
	tb_n_rst = 1;
	@(posedge tb_clk);
	tb_n_rst = 0;
	@(posedge tb_clk);
	tb_n_rst = 1;
	tb_gradient_start = 1'b1;            /// Modify Here for additional Test cases
	tb_P0 = 8'd255;
	tb_P1 = 8'd0;
	tb_P2 = 8'd255;
	tb_P3 = 8'd0;
	tb_P4 = 8'd0;
	tb_P5 = 8'd0;
	tb_P6 = 8'd255;
	tb_P7 = 8'd0;
	tb_P8 = 8'd255;

	expected_processed_sum = 8'd0;	     /// To Here

	@(posedge tb_clk);
	tb_gradient_start = 1'b0;
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




	#(CHECK_DELAY);
	if (tb_processed_sum == expected_processed_sum) begin
		$info("Test Case %d - PASSED", test_case);
	end else begin
		$error("Test Case %d - FAILED", test_case);
	end

	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);



	end // END INITIAL

endmodule
