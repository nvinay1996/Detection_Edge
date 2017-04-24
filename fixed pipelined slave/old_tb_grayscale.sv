// $Id: $
// File name:   tb_grayscale.sv
// Created:     3/13/2017
// Author:      Chia-Hua Peng
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: test bench for gray scaler

`timescale 1ns / 10ps

module tb_grayscale();

	// Define parameters
	localparam CLK_PERIOD  = 4;  
	localparam CHECK_DELAY 	= 1; 

  
	// Device Under Test
 	logic tb_clk;
	logic tb_n_rst;
	logic tb_i_grayscale_start;
	logic [31:0] tb_i_RGB;
	logic tb_o_grayscale_data_ready;
	logic [7:0] tb_o_gray;
	logic [7:0] tb_R;
	logic [7:0] tb_G;
	logic [7:0] tb_B;

	assign tb_i_RGB = {tb_R, tb_G, tb_B, 8'b0};

	grayscale DUT (
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.i_grayscale_start(tb_i_grayscale_start),
		.i_RGB(tb_i_RGB),
		.o_grayscale_data_ready(tb_o_grayscale_data_ready),
		.o_gray(tb_o_gray)
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
	tb_n_rst = 1;
	tb_i_grayscale_start = 0;
	tb_R = 0;
	tb_G = 0;
	tb_B = 0;
	
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
	if (tb_o_gray == 8'd0) begin
		$info("Test Case 0 - o_gray after asynchronous reset - PASSED");
	end else begin
		$error("Test Case 0 - o_gray after asynchronous reset - FAILED");
	end
	if (tb_o_grayscale_data_ready == 1'b0) begin
		$info("Test Case 0 - o_grayscale_data_ready after asynchronous reset - PASSED");
	end else begin
		$error("Test Case 0 - o_grayscale_data_ready after asynchronous reset - FAILED");
	end

// Test Case 1 - Not Start, Data Not Ready
	test_case = test_case + 1;
	tb_n_rst = 1;
	@(posedge tb_clk);
	tb_n_rst = 0;
	@(posedge tb_clk);
	tb_n_rst = 1;
	tb_i_grayscale_start = 0;
	tb_R = 8'd200;
	tb_G = 8'd100;
	tb_B = 8'd130;

	#(CHECK_DELAY);
	if (tb_o_gray == 8'd0) begin
		$info("Test Case 1 - PASSED");
	end else begin
		$error("Test Case 1 - FAILED");
	end
	if (tb_o_grayscale_data_ready == 1'b0) begin
		$info("Test Case 1 - PASSED");
	end else begin
		$error("Test Case 1 - FAILED");
	end


// Test Case 2 - RGB(200, 100, 130) -> GRAY(150)
	test_case = test_case + 1;
	tb_n_rst = 1;
	@(posedge tb_clk);
	tb_n_rst = 0;
	@(posedge tb_clk);
	tb_n_rst = 1;
	tb_i_grayscale_start = 1;
	tb_R = 8'd200;
	tb_G = 8'd100;
	tb_B = 8'd130;
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
	if (tb_o_gray == 8'd150) begin
		$info("Test Case 2 - PASSED");
	end else begin
		$error("Test Case 2 - FAILED");
	end



// Test Case 3 - RGB(55, 155, 125) -> GRAY(105)
	test_case = test_case + 1;
	tb_n_rst = 1;
	@(posedge tb_clk);
	tb_n_rst = 0;
	@(posedge tb_clk);
	tb_n_rst = 1;
	tb_i_grayscale_start = 1;
	tb_R = 8'd55;
	tb_G = 8'd155;
	tb_B = 8'd125;
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
	if (tb_o_gray == 8'd105) begin
		$info("Test Case 3 - PASSED");
	end else begin
		$error("Test Case 3 - FAILED");
	end
	


// Test Case 4 - RGB(200, 100, 130) -> GRAY(150)
	test_case = test_case + 1;
	tb_n_rst = 1;
	@(posedge tb_clk);
	tb_n_rst = 0;
	@(posedge tb_clk);
	tb_n_rst = 1;
	tb_i_grayscale_start = 1;
	tb_R = 8'd200;
	tb_G = 8'd100;
	tb_B = 8'd130;
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
	if (tb_o_gray == 8'd150) begin
		$info("Test Case 4 - PASSED");
	end else begin
		$error("Test Case 4 - FAILED");
	end

// Test Case 5 - RGB(11, 101, 254) -> GRAY(132)
	test_case = test_case + 1;
	tb_n_rst = 1;
	@(posedge tb_clk);
	tb_n_rst = 0;
	@(posedge tb_clk);
	tb_n_rst = 1;
	tb_i_grayscale_start = 1;
	tb_R = 8'd11;
	tb_G = 8'd101;
	tb_B = 8'd254;
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
	if (tb_o_gray == 8'd132) begin
		$info("Test Case 5 - PASSED");
	end else begin
		$error("Test Case 5 - FAILED");
	end

// Test Case 6 - RGB(255, 240, 230) -> GRAY(242)
	test_case = test_case + 1;
	tb_n_rst = 1;
	@(posedge tb_clk);
	tb_n_rst = 0;
	@(posedge tb_clk);
	tb_n_rst = 1;
	tb_i_grayscale_start = 1;
	tb_R = 8'd255;
	tb_G = 8'd240;
	tb_B = 8'd230;
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
	if (tb_o_gray == 8'd242) begin
		$info("Test Case 6 - PASSED");
	end else begin
		$error("Test Case 6 - FAILED");
	end

// Test Case 7 - RGB(153, 247, 94) -> GRAY(170)
	test_case = test_case + 1;
	tb_n_rst = 1;
	@(posedge tb_clk);
	tb_n_rst = 0;
	@(posedge tb_clk);
	tb_n_rst = 1;
	tb_i_grayscale_start = 1;
	tb_R = 8'd153;
	tb_G = 8'd247;
	tb_B = 8'd94;
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
	if (tb_o_gray == 8'd170) begin
		$info("Test Case 7 - PASSED");
	end else begin
		$error("Test Case 7 - FAILED");
	end

// Test Case 8 - RGB(153, 94, 247) -> GRAY(170)
	test_case = test_case + 1;
	tb_n_rst = 1;
	@(posedge tb_clk);
	tb_n_rst = 0;
	@(posedge tb_clk);
	tb_n_rst = 1;
	tb_i_grayscale_start = 1;
	tb_R = 8'd153;
	tb_G = 8'd94;
	tb_B = 8'd247;
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
	if (tb_o_gray == 8'd170) begin
		$info("Test Case 8 - PASSED");
	end else begin
		$error("Test Case 8 - FAILED");
	end


// Test Case 9 - RGB(100, 100, 100) -> GRAY(100)
	test_case = test_case + 1;
	tb_n_rst = 1;
	@(posedge tb_clk);
	tb_n_rst = 0;
	@(posedge tb_clk);
	tb_n_rst = 1;
	tb_i_grayscale_start = 1;
	tb_R = 8'd100;
	tb_G = 8'd100;
	tb_B = 8'd100;
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
	if (tb_o_gray == 8'd100) begin
		$info("Test Case 9 - PASSED");
	end else begin
		$error("Test Case 9 - FAILED");
	end

// Test Case 10 - RGB(100, 99, 101) -> GRAY(100)
	test_case = test_case + 1;
	tb_n_rst = 1;
	@(posedge tb_clk);
	tb_n_rst = 0;
	@(posedge tb_clk);
	tb_n_rst = 1;
	tb_i_grayscale_start = 1;
	tb_R = 8'd100;
	tb_G = 8'd99;
	tb_B = 8'd101;
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
	if (tb_o_gray == 8'd100) begin
		$info("Test Case 10 - PASSED");
	end else begin
		$error("Test Case 10 - FAILED");
	end

// Test Case 11 - RGB(11, 11, 222) -> GRAY(116)
	test_case = test_case + 1;
	tb_n_rst = 1;
	@(posedge tb_clk);
	tb_n_rst = 0;
	@(posedge tb_clk);
	tb_n_rst = 1;
	tb_i_grayscale_start = 1;
	tb_R = 8'd11;
	tb_G = 8'd11;
	tb_B = 8'd222;
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
	if (tb_o_gray == 8'd116) begin
		$info("Test Case 11 - PASSED");
	end else begin
		$error("Test Case 11 - FAILED");
	end

// Test Case 12 - RGB(220, 220, 21) -> GRAY(120)
	test_case = test_case + 1;
	tb_n_rst = 1;
	@(posedge tb_clk);
	tb_n_rst = 0;
	@(posedge tb_clk);
	tb_n_rst = 1;
	tb_i_grayscale_start = 1;
	tb_R = 8'd220;
	tb_G = 8'd220;
	tb_B = 8'd21;
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
	if (tb_o_gray == 8'd120) begin
		$info("Test Case 12 - PASSED");
	end else begin
		$error("Test Case 12 - FAILED");
	end

// Test Case 13 - RGB(124, 122, 122) -> GRAY(123)
	test_case = test_case + 1;
	tb_n_rst = 1;
	@(posedge tb_clk);
	tb_n_rst = 0;
	@(posedge tb_clk);
	tb_n_rst = 1;
	tb_i_grayscale_start = 1;
	tb_R = 8'd124;
	tb_G = 8'd122;
	tb_B = 8'd122;
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
	if (tb_o_gray == 8'd123) begin
		$info("Test Case 13 - PASSED");
	end else begin
		$error("Test Case 13 - FAILED");
	end

// Test Case 14 - RGB(122, 124, 124) -> GRAY(123)
	test_case = test_case + 1;
	tb_n_rst = 1;
	@(posedge tb_clk);
	tb_n_rst = 0;
	@(posedge tb_clk);
	tb_n_rst = 1;
	tb_i_grayscale_start = 1;
	tb_R = 8'd122;
	tb_G = 8'd124;
	tb_B = 8'd124;
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
	if (tb_o_gray == 8'd123) begin
		$info("Test Case 14 - PASSED");
	end else begin
		$error("Test Case 14 - FAILED");
	end

// Test Case 15 - RGB(255, 255, 255) -> GRAY(255)
	test_case = test_case + 1;
	tb_n_rst = 1;
	@(posedge tb_clk);
	tb_n_rst = 0;
	@(posedge tb_clk);
	tb_n_rst = 1;
	tb_i_grayscale_start = 1;
	tb_R = 8'd255;
	tb_G = 8'd255;
	tb_B = 8'd255;
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
	if (tb_o_gray == 8'd255) begin
		$info("Test Case 15 - PASSED");
	end else begin
		$error("Test Case 15 - FAILED");
	end

	tb_n_rst = 1;
	tb_i_grayscale_start = 1;
	tb_R = 8'd0;
	tb_G = 8'd0;
	tb_B = 8'd0;
	@(posedge tb_clk);
	tb_i_grayscale_start = 0;
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);


	#(CHECK_DELAY);
	if (tb_o_gray == 8'd0) begin
		$info("Test Case 15 - PASSED");
	end else begin
		$error("Test Case 15 - FAILED");
	end


// Test Case N - Not Start, Data Not Ready
	tb_R = 8'd255;
	tb_G = 8'd255;
	tb_B = 8'd255;
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);

	if (tb_o_grayscale_data_ready == 1'b0) begin
		$info("Test Case N - PASSED");
	end else begin
		$error("Test Case N - FAILED");
	end


	end // end initialize

endmodule
