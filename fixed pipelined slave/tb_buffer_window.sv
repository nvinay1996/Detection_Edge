// $Id: $
// File name:   tb_buffer_window.sv
// Created:     3/14/2017
// Author:      Chia-Hua Peng
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: test bench for buffer window (buffer 1)

`timescale 1ns / 10ps

module tb_buffer_window();

	// Define parameters
	localparam CLK_PERIOD  = 4;  
	localparam CHECK_DELAY 	= 1; 

  
	// Device Under Test
 	logic tb_clk;
	logic tb_n_rst;
	logic [7:0] tb_data_in;
	logic tb_save;
	logic tb_clear;
	logic tb_full;
	logic tb_empty;
	logic [7:0] tb_m1;
	logic [7:0] tb_m2;
	logic [7:0] tb_m3;
	logic [7:0] tb_m4;
	logic [7:0] tb_m5;
	logic [7:0] tb_m6;
	logic [7:0] tb_m7;
	logic [7:0] tb_m8;
	logic [7:0] tb_m9;
	logic [7:0] tb_m10;
	logic [7:0] tb_m11;
	logic [7:0] tb_m12;
	logic [7:0] tb_m13;
	logic [7:0] tb_m14;
	logic [7:0] tb_m15;
	logic [7:0] tb_m16;
	logic [7:0] tb_m17;
	logic [7:0] tb_m18;
	logic [7:0] tb_m19;
	logic [7:0] tb_m20;
	logic [7:0] tb_m21;
	logic [7:0] tb_m22;
	logic [7:0] tb_m23;
	logic [7:0] tb_m24;
	logic [7:0] tb_m25;




	buffer_window DUT (
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.i_data_in(tb_data_in),
		.i_save(tb_save),
		.i_clear(tb_clear),
		.o_full(tb_full),
		.o_empty(tb_empty),
		.o_m1(tb_m1),
		.o_m2(tb_m2),
		.o_m3(tb_m3),
		.o_m4(tb_m4),
		.o_m5(tb_m5),
		.o_m6(tb_m6),
		.o_m7(tb_m7),
		.o_m8(tb_m8),
		.o_m9(tb_m9),
		.o_m10(tb_m10),
		.o_m11(tb_m11),
		.o_m12(tb_m12),
		.o_m13(tb_m13),
		.o_m14(tb_m14),
		.o_m15(tb_m15),
		.o_m16(tb_m16),
		.o_m17(tb_m17),
		.o_m18(tb_m18),
		.o_m19(tb_m19),
		.o_m20(tb_m20),
		.o_m21(tb_m21),
		.o_m22(tb_m22),
		.o_m23(tb_m23),
		.o_m24(tb_m24),
		.o_m25(tb_m25)
	);



	logic [7:0] expected_m1;
	logic [7:0] expected_m2;
	logic [7:0] expected_m3;
	logic [7:0] expected_m4;
	logic [7:0] expected_m5;
	logic [7:0] expected_m6;
	logic [7:0] expected_m7;
	logic [7:0] expected_m8;
	logic [7:0] expected_m9;
	logic [7:0] expected_m10;
	logic [7:0] expected_m11;
	logic [7:0] expected_m12;
	logic [7:0] expected_m13;
	logic [7:0] expected_m14;
	logic [7:0] expected_m15;
	logic [7:0] expected_m16;
	logic [7:0] expected_m17;
	logic [7:0] expected_m18;
	logic [7:0] expected_m19;
	logic [7:0] expected_m20;
	logic [7:0] expected_m21;
	logic [7:0] expected_m22;
	logic [7:0] expected_m23;
	logic [7:0] expected_m24;
	logic [7:0] expected_m25;


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

	expected_m1 = 8'd21;
	expected_m2 = 8'd255;
	expected_m3 = 8'd252;
	expected_m4 = 8'd244;
	expected_m5 = 8'd135;
	expected_m6 = 8'd32;
	expected_m7 = 8'd64;
	expected_m8 = 8'd73;
	expected_m9 = 8'd0;
	expected_m10 = 8'd11;
	expected_m11 = 8'd99;
	expected_m12 = 8'd231;
	expected_m13 = 8'd221;
	expected_m14 = 8'd154;
	expected_m15 = 8'd142;
	expected_m16 = 8'd195;
	expected_m17 = 8'd111;
	expected_m18 = 8'd18;
	expected_m19 = 8'd19;
	expected_m20 = 8'd57;
	expected_m21 = 8'd3;
	expected_m22 = 8'd201;
	expected_m23 = 8'd234;
	expected_m24 = 8'd129;
	expected_m25 = 8'd184;

	tb_data_in = expected_m1;
	tb_save = 1'b0;
	tb_clear = 1'b0;


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
	if (tb_empty == 1'b1 && tb_full == 1'b0) begin
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == 8'b0 && tb_m2 == 8'b0 && tb_m3 == 8'b0 && tb_m4 == 8'b0 && tb_m5 == 8'b0 &&
	    tb_m6 == 8'b0 && tb_m7 == 8'b0 && tb_m8 == 8'b0 && tb_m9 == 8'b0 && tb_m10 == 8'b0 &&
	    tb_m11 == 8'b0 && tb_m12 == 8'b0 && tb_m13 == 8'b0 && tb_m14 == 8'b0 && tb_m15 == 8'b0 &&
	    tb_m16 == 8'b0 && tb_m17 == 8'b0 && tb_m18 == 8'b0 && tb_m19 == 8'b0 && tb_m20 == 8'b0 &&
	    tb_m21 == 8'b0 && tb_m22 == 8'b0 && tb_m23 == 8'b0 && tb_m24 == 8'b0 && tb_m25 == 8'b0) begin
		$info("Test Case 0 Correct Data Storage - PASSED");
	end else begin
		$error("Test Case 0 Incorrect Data Storage - FAILED");
	end

// Test Cases
	tb_n_rst = 1;
	@(posedge tb_clk);
	tb_n_rst = 0;
	@(posedge tb_clk);
	tb_n_rst = 1;

	expected_m1 = 8'd21;
	expected_m2 = 8'd255;
	expected_m3 = 8'd252;
	expected_m4 = 8'd244;
	expected_m5 = 8'd135;
	expected_m6 = 8'd32;
	expected_m7 = 8'd64;
	expected_m8 = 8'd73;
	expected_m9 = 8'd0;
	expected_m10 = 8'd11;
	expected_m11 = 8'd99;
	expected_m12 = 8'd231;
	expected_m13 = 8'd221;
	expected_m14 = 8'd154;
	expected_m15 = 8'd142;
	expected_m16 = 8'd195;
	expected_m17 = 8'd111;
	expected_m18 = 8'd18;
	expected_m19 = 8'd19;
	expected_m20 = 8'd57;
	expected_m21 = 8'd3;
	expected_m22 = 8'd201;
	expected_m23 = 8'd234;
	expected_m24 = 8'd129;
	expected_m25 = 8'd184;

// Case 1 - Before Start
	test_case = test_case + 1;
	tb_data_in = expected_m1;
	tb_save = 1'b0;
	tb_clear = 1'b0;

	@(posedge tb_clk);

	#(CHECK_DELAY);
	if (tb_empty == 1'b1 && tb_full == 1'b0) begin
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == 8'b0) begin
		$info("Test Case %d Correct Data Storage - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Data Storage - FAILED", test_case);
	end

	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);

// Case 2 - Store first data
	test_case = test_case + 1;
	tb_data_in = expected_m1;
	tb_save = 1'b1;
	tb_clear = 1'b0;

	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	#(CHECK_DELAY);
	if (tb_empty == 1'b0 && tb_full == 1'b0) begin
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == expected_m1) begin
		$info("Test Case %d Correct Data Storage - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Data Storage - FAILED", test_case);
	end

	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);

// Case 3 - Store first data
	test_case = test_case + 1;
	tb_data_in = expected_m2;
	tb_save = 1'b1;
	tb_clear = 1'b0;

	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	#(CHECK_DELAY);
	if (tb_empty == 1'b0 && tb_full == 1'b0) begin
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == expected_m1 && tb_m2 == expected_m2) begin
		$info("Test Case %d Correct Data Storage - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Data Storage - FAILED", test_case);
	end

	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);

// Case 4 - Store first data
	test_case = test_case + 1;
	tb_data_in = expected_m3;		// change this line for more test cases
	tb_save = 1'b1;
	tb_clear = 1'b0;

	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	#(CHECK_DELAY);
	if (tb_empty == 1'b0 && tb_full == 1'b0) begin					// change here for more test cases
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == expected_m1 && tb_m2 == expected_m2 && tb_m3 == expected_m3) begin				// change here for more test cases
		$info("Test Case %d Correct Data Storage - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Data Storage - FAILED", test_case);
	end

	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);

// Case 5
	test_case = test_case + 1;
	tb_data_in = expected_m4;		// change this line for more test cases
	tb_save = 1'b1;
	tb_clear = 1'b0;

	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	#(CHECK_DELAY);
	if (tb_empty == 1'b0 && tb_full == 1'b0) begin					// change here for more test cases
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == expected_m1 && tb_m2 == expected_m2 && tb_m3 == expected_m3 &&
	    tb_m4 == expected_m4) begin				// change here for more test cases
		$info("Test Case %d Correct Data Storage - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Data Storage - FAILED", test_case);
	end

	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);

// Case 6
	test_case = test_case + 1;
	tb_data_in = expected_m5;		// change this line for more test cases
	tb_save = 1'b1;
	tb_clear = 1'b0;

	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	#(CHECK_DELAY);
	if (tb_empty == 1'b0 && tb_full == 1'b0) begin					// change here for more test cases
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == expected_m1 && tb_m2 == expected_m2 && tb_m3 == expected_m3 &&
	    tb_m4 == expected_m4 && tb_m5 == expected_m5) begin				// change here for more test cases
		$info("Test Case %d Correct Data Storage - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Data Storage - FAILED", test_case);
	end

	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);

// Case 7
	test_case = test_case + 1;
	tb_data_in = expected_m6;		// change this line for more test cases
	tb_save = 1'b1;
	tb_clear = 1'b0;

	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	#(CHECK_DELAY);
	if (tb_empty == 1'b0 && tb_full == 1'b0) begin					// change here for more test cases
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == expected_m1 && tb_m2 == expected_m2 && tb_m3 == expected_m3 &&
	    tb_m4 == expected_m4 && tb_m5 == expected_m5 && tb_m6 == expected_m6) begin				// change here for more test cases
		$info("Test Case %d Correct Data Storage - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Data Storage - FAILED", test_case);
	end

	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);

// Case 8
	test_case = test_case + 1;
	tb_data_in = expected_m7;		// change this line for more test cases
	tb_save = 1'b1;
	tb_clear = 1'b0;

	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	#(CHECK_DELAY);
	if (tb_empty == 1'b0 && tb_full == 1'b0) begin					// change here for more test cases
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == expected_m1 && tb_m2 == expected_m2 && tb_m3 == expected_m3 &&
	    tb_m4 == expected_m4 && tb_m5 == expected_m5 && tb_m6 == expected_m6 &&
	    tb_m7 == expected_m7) begin				// change here for more test cases
		$info("Test Case %d Correct Data Storage - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Data Storage - FAILED", test_case);
	end

	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);

// Case 9
	test_case = test_case + 1;
	tb_data_in = expected_m8;		// change this line for more test cases
	tb_save = 1'b1;
	tb_clear = 1'b0;

	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	#(CHECK_DELAY);
	if (tb_empty == 1'b0 && tb_full == 1'b0) begin					// change here for more test cases
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == expected_m1 && tb_m2 == expected_m2 && tb_m3 == expected_m3 &&
	    tb_m4 == expected_m4 && tb_m5 == expected_m5 && tb_m6 == expected_m6 &&
	    tb_m7 == expected_m7 && tb_m8 == expected_m8) begin				// change here for more test cases
		$info("Test Case %d Correct Data Storage - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Data Storage - FAILED", test_case);
	end

	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);

// Case 10
	test_case = test_case + 1;
	tb_data_in = expected_m9;		// change this line for more test cases
	tb_save = 1'b1;
	tb_clear = 1'b0;

	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	#(CHECK_DELAY);
	if (tb_empty == 1'b0 && tb_full == 1'b0) begin					// change here for more test cases
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == expected_m1 && tb_m2 == expected_m2 && tb_m3 == expected_m3 &&
	    tb_m4 == expected_m4 && tb_m5 == expected_m5 && tb_m6 == expected_m6 &&
	    tb_m7 == expected_m7 && tb_m8 == expected_m8 && tb_m9 == expected_m9) begin				// change here for more test cases
		$info("Test Case %d Correct Data Storage - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Data Storage - FAILED", test_case);
	end

	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);

// Case 11
	test_case = test_case + 1;
	tb_data_in = expected_m10;		// change this line for more test cases
	tb_save = 1'b1;
	tb_clear = 1'b0;

	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	#(CHECK_DELAY);
	if (tb_empty == 1'b0 && tb_full == 1'b0) begin					// change here for more test cases
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == expected_m1 && tb_m2 == expected_m2 && tb_m3 == expected_m3 &&
	    tb_m4 == expected_m4 && tb_m5 == expected_m5 && tb_m6 == expected_m6 &&
	    tb_m7 == expected_m7 && tb_m8 == expected_m8 && tb_m9 == expected_m9 &&
	    tb_m10 == expected_m10) begin				// change here for more test cases
		$info("Test Case %d Correct Data Storage - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Data Storage - FAILED", test_case);
	end

	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);

// Case 12
	test_case = test_case + 1;
	tb_data_in = expected_m11;		// change this line for more test cases
	tb_save = 1'b1;
	tb_clear = 1'b0;

	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	#(CHECK_DELAY);
	if (tb_empty == 1'b0 && tb_full == 1'b0) begin					// change here for more test cases
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == expected_m1 && tb_m2 == expected_m2 && tb_m3 == expected_m3 &&
	    tb_m4 == expected_m4 && tb_m5 == expected_m5 && tb_m6 == expected_m6 &&
	    tb_m7 == expected_m7 && tb_m8 == expected_m8 && tb_m9 == expected_m9 &&
	    tb_m10 == expected_m10 && tb_m11 == expected_m11) begin				// change here for more test cases
		$info("Test Case %d Correct Data Storage - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Data Storage - FAILED", test_case);
	end

	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);

// Case 13
	test_case = test_case + 1;
	tb_data_in = expected_m12;		// change this line for more test cases
	tb_save = 1'b1;
	tb_clear = 1'b0;

	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	#(CHECK_DELAY);
	if (tb_empty == 1'b0 && tb_full == 1'b0) begin					// change here for more test cases
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == expected_m1 && tb_m2 == expected_m2 && tb_m3 == expected_m3 &&
	    tb_m4 == expected_m4 && tb_m5 == expected_m5 && tb_m6 == expected_m6 &&
	    tb_m7 == expected_m7 && tb_m8 == expected_m8 && tb_m9 == expected_m9 &&
	    tb_m10 == expected_m10 && tb_m11 == expected_m11 && tb_m12 == expected_m12) begin				// change here for more test cases
		$info("Test Case %d Correct Data Storage - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Data Storage - FAILED", test_case);
	end

	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);

// Case 14
	test_case = test_case + 1;
	tb_data_in = expected_m13;		// change this line for more test cases
	tb_save = 1'b1;
	tb_clear = 1'b0;

	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	#(CHECK_DELAY);
	if (tb_empty == 1'b0 && tb_full == 1'b0) begin					// change here for more test cases
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == expected_m1 && tb_m2 == expected_m2 && tb_m3 == expected_m3 &&
	    tb_m4 == expected_m4 && tb_m5 == expected_m5 && tb_m6 == expected_m6 &&
	    tb_m7 == expected_m7 && tb_m8 == expected_m8 && tb_m9 == expected_m9 &&
	    tb_m10 == expected_m10 && tb_m11 == expected_m11 && tb_m12 == expected_m12 &&
	    tb_m13 == expected_m13) begin				// change here for more test cases
		$info("Test Case %d Correct Data Storage - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Data Storage - FAILED", test_case);
	end

	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);

// Case 15
	test_case = test_case + 1;
	tb_data_in = expected_m14;		// change this line for more test cases
	tb_save = 1'b1;
	tb_clear = 1'b0;

	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	#(CHECK_DELAY);
	if (tb_empty == 1'b0 && tb_full == 1'b0) begin					// change here for more test cases
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == expected_m1 && tb_m2 == expected_m2 && tb_m3 == expected_m3 &&
	    tb_m4 == expected_m4 && tb_m5 == expected_m5 && tb_m6 == expected_m6 &&
	    tb_m7 == expected_m7 && tb_m8 == expected_m8 && tb_m9 == expected_m9 &&
	    tb_m10 == expected_m10 && tb_m11 == expected_m11 && tb_m12 == expected_m12 &&
	    tb_m13 == expected_m13 && tb_m14 == expected_m14) begin				// change here for more test cases
		$info("Test Case %d Correct Data Storage - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Data Storage - FAILED", test_case);
	end

	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);

// Case 16
	test_case = test_case + 1;
	tb_data_in = expected_m15;		// change this line for more test cases
	tb_save = 1'b1;
	tb_clear = 1'b0;

	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	#(CHECK_DELAY);
	if (tb_empty == 1'b0 && tb_full == 1'b0) begin					// change here for more test cases
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == expected_m1 && tb_m2 == expected_m2 && tb_m3 == expected_m3 &&
	    tb_m4 == expected_m4 && tb_m5 == expected_m5 && tb_m6 == expected_m6 &&
	    tb_m7 == expected_m7 && tb_m8 == expected_m8 && tb_m9 == expected_m9 &&
	    tb_m10 == expected_m10 && tb_m11 == expected_m11 && tb_m12 == expected_m12 &&
	    tb_m13 == expected_m13 && tb_m14 == expected_m14 && tb_m15 == expected_m15) begin				// change here for more test cases
		$info("Test Case %d Correct Data Storage - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Data Storage - FAILED", test_case);
	end

	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);

// Case 17
	test_case = test_case + 1;
	tb_data_in = expected_m16;		// change this line for more test cases
	tb_save = 1'b1;
	tb_clear = 1'b0;

	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	#(CHECK_DELAY);
	if (tb_empty == 1'b0 && tb_full == 1'b0) begin					// change here for more test cases
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == expected_m1 && tb_m2 == expected_m2 && tb_m3 == expected_m3 &&
	    tb_m4 == expected_m4 && tb_m5 == expected_m5 && tb_m6 == expected_m6 &&
	    tb_m7 == expected_m7 && tb_m8 == expected_m8 && tb_m9 == expected_m9 &&
	    tb_m10 == expected_m10 && tb_m11 == expected_m11 && tb_m12 == expected_m12 &&
	    tb_m13 == expected_m13 && tb_m14 == expected_m14 && tb_m15 == expected_m15 &&
	    tb_m16 == expected_m16) begin				// change here for more test cases
		$info("Test Case %d Correct Data Storage - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Data Storage - FAILED", test_case);
	end

	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);

// Case 18
	test_case = test_case + 1;
	tb_data_in = expected_m17;		// change this line for more test cases
	tb_save = 1'b1;
	tb_clear = 1'b0;

	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	#(CHECK_DELAY);
	if (tb_empty == 1'b0 && tb_full == 1'b0) begin					// change here for more test cases
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == expected_m1 && tb_m2 == expected_m2 && tb_m3 == expected_m3 &&
	    tb_m4 == expected_m4 && tb_m5 == expected_m5 && tb_m6 == expected_m6 &&
	    tb_m7 == expected_m7 && tb_m8 == expected_m8 && tb_m9 == expected_m9 &&
	    tb_m10 == expected_m10 && tb_m11 == expected_m11 && tb_m12 == expected_m12 &&
	    tb_m13 == expected_m13 && tb_m14 == expected_m14 && tb_m15 == expected_m15 &&
	    tb_m16 == expected_m16 && tb_m17 == expected_m17) begin				// change here for more test cases
		$info("Test Case %d Correct Data Storage - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Data Storage - FAILED", test_case);
	end

	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);


// Case 19
	test_case = test_case + 1;
	tb_data_in = expected_m18;		// change this line for more test cases
	tb_save = 1'b1;
	tb_clear = 1'b0;

	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	#(CHECK_DELAY);
	if (tb_empty == 1'b0 && tb_full == 1'b0) begin					// change here for more test cases
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == expected_m1 && tb_m2 == expected_m2 && tb_m3 == expected_m3 &&
	    tb_m4 == expected_m4 && tb_m5 == expected_m5 && tb_m6 == expected_m6 &&
	    tb_m7 == expected_m7 && tb_m8 == expected_m8 && tb_m9 == expected_m9 &&
	    tb_m10 == expected_m10 && tb_m11 == expected_m11 && tb_m12 == expected_m12 &&
	    tb_m13 == expected_m13 && tb_m14 == expected_m14 && tb_m15 == expected_m15 &&
	    tb_m16 == expected_m16 && tb_m17 == expected_m17 && tb_m18 == expected_m18) begin				// change here for more test cases
		$info("Test Case %d Correct Data Storage - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Data Storage - FAILED", test_case);
	end

	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);

// Case 20
	test_case = test_case + 1;
	tb_data_in = expected_m19;		// change this line for more test cases
	tb_save = 1'b1;
	tb_clear = 1'b0;

	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	#(CHECK_DELAY);
	if (tb_empty == 1'b0 && tb_full == 1'b0) begin					// change here for more test cases
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == expected_m1 && tb_m2 == expected_m2 && tb_m3 == expected_m3 &&
	    tb_m4 == expected_m4 && tb_m5 == expected_m5 && tb_m6 == expected_m6 &&
	    tb_m7 == expected_m7 && tb_m8 == expected_m8 && tb_m9 == expected_m9 &&
	    tb_m10 == expected_m10 && tb_m11 == expected_m11 && tb_m12 == expected_m12 &&
	    tb_m13 == expected_m13 && tb_m14 == expected_m14 && tb_m15 == expected_m15 &&
	    tb_m16 == expected_m16 && tb_m17 == expected_m17 && tb_m18 == expected_m18 &&
	    tb_m19 == expected_m19) begin				// change here for more test cases
		$info("Test Case %d Correct Data Storage - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Data Storage - FAILED", test_case);
	end

	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);

// Case 21
	test_case = test_case + 1;
	tb_data_in = expected_m20;		// change this line for more test cases
	tb_save = 1'b1;
	tb_clear = 1'b0;

	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	#(CHECK_DELAY);
	if (tb_empty == 1'b0 && tb_full == 1'b0) begin					// change here for more test cases
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == expected_m1 && tb_m2 == expected_m2 && tb_m3 == expected_m3 &&
	    tb_m4 == expected_m4 && tb_m5 == expected_m5 && tb_m6 == expected_m6 &&
	    tb_m7 == expected_m7 && tb_m8 == expected_m8 && tb_m9 == expected_m9 &&
	    tb_m10 == expected_m10 && tb_m11 == expected_m11 && tb_m12 == expected_m12 &&
	    tb_m13 == expected_m13 && tb_m14 == expected_m14 && tb_m15 == expected_m15 &&
	    tb_m16 == expected_m16 && tb_m17 == expected_m17 && tb_m18 == expected_m18 &&
	    tb_m19 == expected_m19 && tb_m20 == expected_m20) begin				// change here for more test cases
		$info("Test Case %d Correct Data Storage - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Data Storage - FAILED", test_case);
	end

	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);

// Case 22
	test_case = test_case + 1;
	tb_data_in = expected_m21;		// change this line for more test cases
	tb_save = 1'b1;
	tb_clear = 1'b0;

	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	#(CHECK_DELAY);
	if (tb_empty == 1'b0 && tb_full == 1'b0) begin					// change here for more test cases
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == expected_m1 && tb_m2 == expected_m2 && tb_m3 == expected_m3 &&
	    tb_m4 == expected_m4 && tb_m5 == expected_m5 && tb_m6 == expected_m6 &&
	    tb_m7 == expected_m7 && tb_m8 == expected_m8 && tb_m9 == expected_m9 &&
	    tb_m10 == expected_m10 && tb_m11 == expected_m11 && tb_m12 == expected_m12 &&
	    tb_m13 == expected_m13 && tb_m14 == expected_m14 && tb_m15 == expected_m15 &&
	    tb_m16 == expected_m16 && tb_m17 == expected_m17 && tb_m18 == expected_m18 &&
	    tb_m19 == expected_m19 && tb_m20 == expected_m20 && tb_m21 == expected_m21) begin				// change here for more test cases
		$info("Test Case %d Correct Data Storage - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Data Storage - FAILED", test_case);
	end

	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);

// Case 23
	test_case = test_case + 1;
	tb_data_in = expected_m22;		// change this line for more test cases
	tb_save = 1'b1;
	tb_clear = 1'b0;

	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	#(CHECK_DELAY);
	if (tb_empty == 1'b0 && tb_full == 1'b0) begin					// change here for more test cases
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == expected_m1 && tb_m2 == expected_m2 && tb_m3 == expected_m3 &&
	    tb_m4 == expected_m4 && tb_m5 == expected_m5 && tb_m6 == expected_m6 &&
	    tb_m7 == expected_m7 && tb_m8 == expected_m8 && tb_m9 == expected_m9 &&
	    tb_m10 == expected_m10 && tb_m11 == expected_m11 && tb_m12 == expected_m12 &&
	    tb_m13 == expected_m13 && tb_m14 == expected_m14 && tb_m15 == expected_m15 &&
	    tb_m16 == expected_m16 && tb_m17 == expected_m17 && tb_m18 == expected_m18 &&
	    tb_m19 == expected_m19 && tb_m20 == expected_m20 && tb_m21 == expected_m21 &&
	    tb_m22 == expected_m22) begin				// change here for more test cases
		$info("Test Case %d Correct Data Storage - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Data Storage - FAILED", test_case);
	end

	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);

// Case 24
	test_case = test_case + 1;
	tb_data_in = expected_m23;		// change this line for more test cases
	tb_save = 1'b1;
	tb_clear = 1'b0;

	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	#(CHECK_DELAY);
	if (tb_empty == 1'b0 && tb_full == 1'b0) begin					// change here for more test cases
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == expected_m1 && tb_m2 == expected_m2 && tb_m3 == expected_m3 &&
	    tb_m4 == expected_m4 && tb_m5 == expected_m5 && tb_m6 == expected_m6 &&
	    tb_m7 == expected_m7 && tb_m8 == expected_m8 && tb_m9 == expected_m9 &&
	    tb_m10 == expected_m10 && tb_m11 == expected_m11 && tb_m12 == expected_m12 &&
	    tb_m13 == expected_m13 && tb_m14 == expected_m14 && tb_m15 == expected_m15 &&
	    tb_m16 == expected_m16 && tb_m17 == expected_m17 && tb_m18 == expected_m18 &&
	    tb_m19 == expected_m19 && tb_m20 == expected_m20 && tb_m21 == expected_m21 &&
	    tb_m22 == expected_m22 && tb_m23 == expected_m23) begin				// change here for more test cases
		$info("Test Case %d Correct Data Storage - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Data Storage - FAILED", test_case);
	end

	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);

// Case 25
	test_case = test_case + 1;
	tb_data_in = expected_m24;		// change this line for more test cases
	tb_save = 1'b1;
	tb_clear = 1'b0;

	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	#(CHECK_DELAY);
	if (tb_empty == 1'b0 && tb_full == 1'b0) begin					// change here for more test cases
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == expected_m1 && tb_m2 == expected_m2 && tb_m3 == expected_m3 &&
	    tb_m4 == expected_m4 && tb_m5 == expected_m5 && tb_m6 == expected_m6 &&
	    tb_m7 == expected_m7 && tb_m8 == expected_m8 && tb_m9 == expected_m9 &&
	    tb_m10 == expected_m10 && tb_m11 == expected_m11 && tb_m12 == expected_m12 &&
	    tb_m13 == expected_m13 && tb_m14 == expected_m14 && tb_m15 == expected_m15 &&
	    tb_m16 == expected_m16 && tb_m17 == expected_m17 && tb_m18 == expected_m18 &&
	    tb_m19 == expected_m19 && tb_m20 == expected_m20 && tb_m21 == expected_m21 &&
	    tb_m22 == expected_m22 && tb_m23 == expected_m23 && tb_m24 == expected_m24) begin				// change here for more test cases
		$info("Test Case %d Correct Data Storage - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Data Storage - FAILED", test_case);
	end

	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);

// Case 26 -- buffer is full
	test_case = test_case + 1;
	tb_data_in = expected_m25;		// change this line for more test cases
	tb_save = 1'b1;
	tb_clear = 1'b0;

	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	#(CHECK_DELAY);
	if (tb_empty == 1'b0 && tb_full == 1'b1) begin					// change here for more test cases
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == expected_m1 && tb_m2 == expected_m2 && tb_m3 == expected_m3 &&
	    tb_m4 == expected_m4 && tb_m5 == expected_m5 && tb_m6 == expected_m6 &&
	    tb_m7 == expected_m7 && tb_m8 == expected_m8 && tb_m9 == expected_m9 &&
	    tb_m10 == expected_m10 && tb_m11 == expected_m11 && tb_m12 == expected_m12 &&
	    tb_m13 == expected_m13 && tb_m14 == expected_m14 && tb_m15 == expected_m15 &&
	    tb_m16 == expected_m16 && tb_m17 == expected_m17 && tb_m18 == expected_m18 &&
	    tb_m19 == expected_m19 && tb_m20 == expected_m20 && tb_m21 == expected_m21 &&
	    tb_m22 == expected_m22 && tb_m23 == expected_m23 && tb_m24 == expected_m24 &&
	    tb_m25 == expected_m25) begin				// change here for more test cases
		$info("Test Case %d Correct Data Storage - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Data Storage - FAILED", test_case);
	end

	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);

// Test case 27 - Additional input after full
	test_case = test_case + 1;
	tb_data_in = 8'd255;		// change this line for more test cases
	tb_save = 1'b1;
	tb_clear = 1'b0;

	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	#(CHECK_DELAY);
	if (tb_empty == 1'b0 && tb_full == 1'b1) begin					// change here for more test cases
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == expected_m1 && tb_m2 == expected_m2 && tb_m3 == expected_m3 &&
	    tb_m4 == expected_m4 && tb_m5 == expected_m5 && tb_m6 == expected_m6 &&
	    tb_m7 == expected_m7 && tb_m8 == expected_m8 && tb_m9 == expected_m9 &&
	    tb_m10 == expected_m10 && tb_m11 == expected_m11 && tb_m12 == expected_m12 &&
	    tb_m13 == expected_m13 && tb_m14 == expected_m14 && tb_m15 == expected_m15 &&
	    tb_m16 == expected_m16 && tb_m17 == expected_m17 && tb_m18 == expected_m18 &&
	    tb_m19 == expected_m19 && tb_m20 == expected_m20 && tb_m21 == expected_m21 &&
	    tb_m22 == expected_m22 && tb_m23 == expected_m23 && tb_m24 == expected_m24 &&
	    tb_m25 == expected_m25) begin				// change here for more test cases
		$info("Test Case %d Correct Data Storage - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Data Storage - FAILED", test_case);
	end

	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);

// Test Case 28 - Clear
	test_case = test_case + 1;
	tb_data_in = 8'd255;		// change this line for more test cases
	tb_save = 1'b0;
	tb_clear = 1'b1;

	@(posedge tb_clk);
	tb_clear = 1'b0;
	@(posedge tb_clk);

	#(CHECK_DELAY);
	if (tb_empty == 1'b1 && tb_full == 1'b0) begin					// change here for more test cases
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == 8'b0 && tb_m2 == 8'b0 && tb_m3 == 8'b0 && tb_m4 == 8'b0 && tb_m5 == 8'b0 &&
	    tb_m6 == 8'b0 && tb_m7 == 8'b0 && tb_m8 == 8'b0 && tb_m9 == 8'b0 && tb_m10 == 8'b0 &&
	    tb_m11 == 8'b0 && tb_m12 == 8'b0 && tb_m13 == 8'b0 && tb_m14 == 8'b0 && tb_m15 == 8'b0 &&
	    tb_m16 == 8'b0 && tb_m17 == 8'b0 && tb_m18 == 8'b0 && tb_m19 == 8'b0 && tb_m20 == 8'b0 &&
	    tb_m21 == 8'b0 && tb_m22 == 8'b0 && tb_m23 == 8'b0 && tb_m24 == 8'b0 && tb_m25 == 8'b0) begin
		$info("Test Case 0 Correct Data Storage - PASSED");
	end else begin
		$error("Test Case 0 Incorrect Data Storage - FAILED");
	end

	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);

// Test case 29 - additional clear test cases
	test_case = test_case + 1;

	expected_m1 = 8'd255 - 8'd21;
	expected_m2 = 8'd255 - 8'd255;
	expected_m3 = 8'd255 - 8'd252;
	expected_m4 = 8'd255 - 8'd244;
	expected_m5 = 8'd255 - 8'd135;
	expected_m6 = 8'd255 - 8'd32;
	expected_m7 = 8'd255 - 8'd64;
	expected_m8 = 8'd255 - 8'd73;
	expected_m9 = 8'd255 - 8'd0;
	expected_m10 = 8'd255 -  8'd11;
	expected_m11 = 8'd255 - 8'd99;
	expected_m12 = 8'd255 - 8'd231;
	expected_m13 = 8'd255 - 8'd221;
	expected_m14 = 8'd255 - 8'd154;
	expected_m15 = 8'd255 - 8'd142;
	expected_m16 = 8'd255 - 8'd195;
	expected_m17 = 8'd255 - 8'd111;
	expected_m18 = 8'd255 - 8'd18;
	expected_m19 = 8'd255 - 8'd19;
	expected_m20 = 8'd255 - 8'd57;
	expected_m21 = 8'd255 - 8'd3;
	expected_m22 = 8'd255 - 8'd201;
	expected_m23 = 8'd255 - 8'd234;
	expected_m24 = 8'd255 - 8'd129;
	expected_m25 = 8'd255 - 8'd184;

	
	tb_data_in = expected_m1;		// change this line for more test cases
	tb_save = 1'b1;
	tb_clear = 1'b0;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	tb_clear = 1'b1;
	@(posedge tb_clk);
	tb_clear = 1'b0;
	@(posedge tb_clk);
	#(CHECK_DELAY);
	if (tb_empty == 1'b1 && tb_full == 1'b0) begin					// change here for more test cases
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == 8'b0 && tb_m2 == 8'b0 && tb_m3 == 8'b0 && tb_m4 == 8'b0 && tb_m5 == 8'b0 &&
	    tb_m6 == 8'b0 && tb_m7 == 8'b0 && tb_m8 == 8'b0 && tb_m9 == 8'b0 && tb_m10 == 8'b0 &&
	    tb_m11 == 8'b0 && tb_m12 == 8'b0 && tb_m13 == 8'b0 && tb_m14 == 8'b0 && tb_m15 == 8'b0 &&
	    tb_m16 == 8'b0 && tb_m17 == 8'b0 && tb_m18 == 8'b0 && tb_m19 == 8'b0 && tb_m20 == 8'b0 &&
	    tb_m21 == 8'b0 && tb_m22 == 8'b0 && tb_m23 == 8'b0 && tb_m24 == 8'b0 && tb_m25 == 8'b0) begin
		$info("Test Case 0 Correct Data Storage - PASSED");
	end else begin
		$error("Test Case 0 Incorrect Data Storage - FAILED");
	end
	tb_data_in = expected_m1;		
	tb_save = 1'b1;
	tb_clear = 1'b0;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m2;
	tb_save = 1'b1;
	tb_clear = 1'b0;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	tb_clear = 1'b1;		// clear
	@(posedge tb_clk);
	tb_clear = 1'b0;
	@(posedge tb_clk);
	#(CHECK_DELAY);
	if (tb_empty == 1'b1 && tb_full == 1'b0) begin					
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == 8'b0 && tb_m2 == 8'b0 && tb_m3 == 8'b0 && tb_m4 == 8'b0 && tb_m5 == 8'b0 &&
	    tb_m6 == 8'b0 && tb_m7 == 8'b0 && tb_m8 == 8'b0 && tb_m9 == 8'b0 && tb_m10 == 8'b0 &&
	    tb_m11 == 8'b0 && tb_m12 == 8'b0 && tb_m13 == 8'b0 && tb_m14 == 8'b0 && tb_m15 == 8'b0 &&
	    tb_m16 == 8'b0 && tb_m17 == 8'b0 && tb_m18 == 8'b0 && tb_m19 == 8'b0 && tb_m20 == 8'b0 &&
	    tb_m21 == 8'b0 && tb_m22 == 8'b0 && tb_m23 == 8'b0 && tb_m24 == 8'b0 && tb_m25 == 8'b0) begin
		$info("Test Case 0 Correct Data Storage - PASSED");
	end else begin
		$error("Test Case 0 Incorrect Data Storage - FAILED");
	end
	tb_data_in = expected_m1;		
	tb_save = 1'b1;
	tb_clear = 1'b0;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m2;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m3;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	tb_clear = 1'b1;		// clear
	@(posedge tb_clk);
	tb_clear = 1'b0;
	@(posedge tb_clk);
	#(CHECK_DELAY);
	if (tb_empty == 1'b1 && tb_full == 1'b0) begin					
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == 8'b0 && tb_m2 == 8'b0 && tb_m3 == 8'b0 && tb_m4 == 8'b0 && tb_m5 == 8'b0 &&
	    tb_m6 == 8'b0 && tb_m7 == 8'b0 && tb_m8 == 8'b0 && tb_m9 == 8'b0 && tb_m10 == 8'b0 &&
	    tb_m11 == 8'b0 && tb_m12 == 8'b0 && tb_m13 == 8'b0 && tb_m14 == 8'b0 && tb_m15 == 8'b0 &&
	    tb_m16 == 8'b0 && tb_m17 == 8'b0 && tb_m18 == 8'b0 && tb_m19 == 8'b0 && tb_m20 == 8'b0 &&
	    tb_m21 == 8'b0 && tb_m22 == 8'b0 && tb_m23 == 8'b0 && tb_m24 == 8'b0 && tb_m25 == 8'b0) begin
		$info("Test Case 0 Correct Data Storage - PASSED");
	end else begin
		$error("Test Case 0 Incorrect Data Storage - FAILED");
	end
	tb_data_in = expected_m1;		
	tb_save = 1'b1;
	tb_clear = 1'b0;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m2;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m3;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m4;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk)


	tb_clear = 1'b1;		// clear
	@(posedge tb_clk);
	tb_clear = 1'b0;
	@(posedge tb_clk);
	#(CHECK_DELAY);
	if (tb_empty == 1'b1 && tb_full == 1'b0) begin					
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == 8'b0 && tb_m2 == 8'b0 && tb_m3 == 8'b0 && tb_m4 == 8'b0 && tb_m5 == 8'b0 &&
	    tb_m6 == 8'b0 && tb_m7 == 8'b0 && tb_m8 == 8'b0 && tb_m9 == 8'b0 && tb_m10 == 8'b0 &&
	    tb_m11 == 8'b0 && tb_m12 == 8'b0 && tb_m13 == 8'b0 && tb_m14 == 8'b0 && tb_m15 == 8'b0 &&
	    tb_m16 == 8'b0 && tb_m17 == 8'b0 && tb_m18 == 8'b0 && tb_m19 == 8'b0 && tb_m20 == 8'b0 &&
	    tb_m21 == 8'b0 && tb_m22 == 8'b0 && tb_m23 == 8'b0 && tb_m24 == 8'b0 && tb_m25 == 8'b0) begin
		$info("Test Case 0 Correct Data Storage - PASSED");
	end else begin
		$error("Test Case 0 Incorrect Data Storage - FAILED");
	end


	tb_data_in = expected_m1;		
	tb_save = 1'b1;
	tb_clear = 1'b0;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m2;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m3;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m4;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m5;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	tb_clear = 1'b1;		// clear
	@(posedge tb_clk);
	tb_clear = 1'b0;
	@(posedge tb_clk);
	#(CHECK_DELAY);
	if (tb_empty == 1'b1 && tb_full == 1'b0) begin					
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == 8'b0 && tb_m2 == 8'b0 && tb_m3 == 8'b0 && tb_m4 == 8'b0 && tb_m5 == 8'b0 &&
	    tb_m6 == 8'b0 && tb_m7 == 8'b0 && tb_m8 == 8'b0 && tb_m9 == 8'b0 && tb_m10 == 8'b0 &&
	    tb_m11 == 8'b0 && tb_m12 == 8'b0 && tb_m13 == 8'b0 && tb_m14 == 8'b0 && tb_m15 == 8'b0 &&
	    tb_m16 == 8'b0 && tb_m17 == 8'b0 && tb_m18 == 8'b0 && tb_m19 == 8'b0 && tb_m20 == 8'b0 &&
	    tb_m21 == 8'b0 && tb_m22 == 8'b0 && tb_m23 == 8'b0 && tb_m24 == 8'b0 && tb_m25 == 8'b0) begin
		$info("Test Case 0 Correct Data Storage - PASSED");
	end else begin
		$error("Test Case 0 Incorrect Data Storage - FAILED");
	end
	tb_data_in = expected_m1;		
	tb_save = 1'b1;
	tb_clear = 1'b0;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m2;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m3;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m4;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m5;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m6;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	tb_clear = 1'b1;		// clear
	@(posedge tb_clk);
	tb_clear = 1'b0;
	@(posedge tb_clk);
	#(CHECK_DELAY);
	if (tb_empty == 1'b1 && tb_full == 1'b0) begin					
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == 8'b0 && tb_m2 == 8'b0 && tb_m3 == 8'b0 && tb_m4 == 8'b0 && tb_m5 == 8'b0 &&
	    tb_m6 == 8'b0 && tb_m7 == 8'b0 && tb_m8 == 8'b0 && tb_m9 == 8'b0 && tb_m10 == 8'b0 &&
	    tb_m11 == 8'b0 && tb_m12 == 8'b0 && tb_m13 == 8'b0 && tb_m14 == 8'b0 && tb_m15 == 8'b0 &&
	    tb_m16 == 8'b0 && tb_m17 == 8'b0 && tb_m18 == 8'b0 && tb_m19 == 8'b0 && tb_m20 == 8'b0 &&
	    tb_m21 == 8'b0 && tb_m22 == 8'b0 && tb_m23 == 8'b0 && tb_m24 == 8'b0 && tb_m25 == 8'b0) begin
		$info("Test Case 0 Correct Data Storage - PASSED");
	end else begin
		$error("Test Case 0 Incorrect Data Storage - FAILED");
	end

	tb_data_in = expected_m1;		
	tb_save = 1'b1;
	tb_clear = 1'b0;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m2;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m3;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m4;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m5;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m6;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m7;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	tb_clear = 1'b1;		// clear
	@(posedge tb_clk);
	tb_clear = 1'b0;
	@(posedge tb_clk);
	#(CHECK_DELAY);
	if (tb_empty == 1'b1 && tb_full == 1'b0) begin					
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == 8'b0 && tb_m2 == 8'b0 && tb_m3 == 8'b0 && tb_m4 == 8'b0 && tb_m5 == 8'b0 &&
	    tb_m6 == 8'b0 && tb_m7 == 8'b0 && tb_m8 == 8'b0 && tb_m9 == 8'b0 && tb_m10 == 8'b0 &&
	    tb_m11 == 8'b0 && tb_m12 == 8'b0 && tb_m13 == 8'b0 && tb_m14 == 8'b0 && tb_m15 == 8'b0 &&
	    tb_m16 == 8'b0 && tb_m17 == 8'b0 && tb_m18 == 8'b0 && tb_m19 == 8'b0 && tb_m20 == 8'b0 &&
	    tb_m21 == 8'b0 && tb_m22 == 8'b0 && tb_m23 == 8'b0 && tb_m24 == 8'b0 && tb_m25 == 8'b0) begin
		$info("Test Case 0 Correct Data Storage - PASSED");
	end else begin
		$error("Test Case 0 Incorrect Data Storage - FAILED");
	end
	tb_data_in = expected_m1;		
	tb_save = 1'b1;
	tb_clear = 1'b0;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m2;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m3;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m4;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m5;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m6;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m7;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m8;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	tb_clear = 1'b1;		// clear
	@(posedge tb_clk);
	tb_clear = 1'b0;
	@(posedge tb_clk);
	#(CHECK_DELAY);
	if (tb_empty == 1'b1 && tb_full == 1'b0) begin					
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == 8'b0 && tb_m2 == 8'b0 && tb_m3 == 8'b0 && tb_m4 == 8'b0 && tb_m5 == 8'b0 &&
	    tb_m6 == 8'b0 && tb_m7 == 8'b0 && tb_m8 == 8'b0 && tb_m9 == 8'b0 && tb_m10 == 8'b0 &&
	    tb_m11 == 8'b0 && tb_m12 == 8'b0 && tb_m13 == 8'b0 && tb_m14 == 8'b0 && tb_m15 == 8'b0 &&
	    tb_m16 == 8'b0 && tb_m17 == 8'b0 && tb_m18 == 8'b0 && tb_m19 == 8'b0 && tb_m20 == 8'b0 &&
	    tb_m21 == 8'b0 && tb_m22 == 8'b0 && tb_m23 == 8'b0 && tb_m24 == 8'b0 && tb_m25 == 8'b0) begin
		$info("Test Case 0 Correct Data Storage - PASSED");
	end else begin
		$error("Test Case 0 Incorrect Data Storage - FAILED");
	end
	tb_data_in = expected_m1;		
	tb_save = 1'b1;
	tb_clear = 1'b0;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m2;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m3;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m4;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m5;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m6;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m7;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m8;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m9;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);


	tb_clear = 1'b1;		// clear
	@(posedge tb_clk);
	tb_clear = 1'b0;
	@(posedge tb_clk);
	#(CHECK_DELAY);
	if (tb_empty == 1'b1 && tb_full == 1'b0) begin					
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == 8'b0 && tb_m2 == 8'b0 && tb_m3 == 8'b0 && tb_m4 == 8'b0 && tb_m5 == 8'b0 &&
	    tb_m6 == 8'b0 && tb_m7 == 8'b0 && tb_m8 == 8'b0 && tb_m9 == 8'b0 && tb_m10 == 8'b0 &&
	    tb_m11 == 8'b0 && tb_m12 == 8'b0 && tb_m13 == 8'b0 && tb_m14 == 8'b0 && tb_m15 == 8'b0 &&
	    tb_m16 == 8'b0 && tb_m17 == 8'b0 && tb_m18 == 8'b0 && tb_m19 == 8'b0 && tb_m20 == 8'b0 &&
	    tb_m21 == 8'b0 && tb_m22 == 8'b0 && tb_m23 == 8'b0 && tb_m24 == 8'b0 && tb_m25 == 8'b0) begin
		$info("Test Case 0 Correct Data Storage - PASSED");
	end else begin
		$error("Test Case 0 Incorrect Data Storage - FAILED");
	end
	tb_data_in = expected_m1;		
	tb_save = 1'b1;
	tb_clear = 1'b0;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m2;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m3;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m4;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m5;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m6;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m7;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m8;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m9;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m10;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	tb_clear = 1'b1;		// clear
	@(posedge tb_clk);
	tb_clear = 1'b0;
	@(posedge tb_clk);
	#(CHECK_DELAY);
	if (tb_empty == 1'b1 && tb_full == 1'b0) begin					
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == 8'b0 && tb_m2 == 8'b0 && tb_m3 == 8'b0 && tb_m4 == 8'b0 && tb_m5 == 8'b0 &&
	    tb_m6 == 8'b0 && tb_m7 == 8'b0 && tb_m8 == 8'b0 && tb_m9 == 8'b0 && tb_m10 == 8'b0 &&
	    tb_m11 == 8'b0 && tb_m12 == 8'b0 && tb_m13 == 8'b0 && tb_m14 == 8'b0 && tb_m15 == 8'b0 &&
	    tb_m16 == 8'b0 && tb_m17 == 8'b0 && tb_m18 == 8'b0 && tb_m19 == 8'b0 && tb_m20 == 8'b0 &&
	    tb_m21 == 8'b0 && tb_m22 == 8'b0 && tb_m23 == 8'b0 && tb_m24 == 8'b0 && tb_m25 == 8'b0) begin
		$info("Test Case 0 Correct Data Storage - PASSED");
	end else begin
		$error("Test Case 0 Incorrect Data Storage - FAILED");
	end
	tb_data_in = expected_m1;		
	tb_save = 1'b1;
	tb_clear = 1'b0;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m2;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m3;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m4;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m5;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m6;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m7;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m8;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m9;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m10;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m11;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	tb_clear = 1'b1;		// clear
	@(posedge tb_clk);
	tb_clear = 1'b0;
	@(posedge tb_clk);
	#(CHECK_DELAY);
	if (tb_empty == 1'b1 && tb_full == 1'b0) begin					
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == 8'b0 && tb_m2 == 8'b0 && tb_m3 == 8'b0 && tb_m4 == 8'b0 && tb_m5 == 8'b0 &&
	    tb_m6 == 8'b0 && tb_m7 == 8'b0 && tb_m8 == 8'b0 && tb_m9 == 8'b0 && tb_m10 == 8'b0 &&
	    tb_m11 == 8'b0 && tb_m12 == 8'b0 && tb_m13 == 8'b0 && tb_m14 == 8'b0 && tb_m15 == 8'b0 &&
	    tb_m16 == 8'b0 && tb_m17 == 8'b0 && tb_m18 == 8'b0 && tb_m19 == 8'b0 && tb_m20 == 8'b0 &&
	    tb_m21 == 8'b0 && tb_m22 == 8'b0 && tb_m23 == 8'b0 && tb_m24 == 8'b0 && tb_m25 == 8'b0) begin
		$info("Test Case 0 Correct Data Storage - PASSED");
	end else begin
		$error("Test Case 0 Incorrect Data Storage - FAILED");
	end
	tb_data_in = expected_m1;		
	tb_save = 1'b1;
	tb_clear = 1'b0;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m2;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m3;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m4;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m5;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m6;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m7;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m8;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m9;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m10;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m11;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m12;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	tb_clear = 1'b1;		// clear
	@(posedge tb_clk);
	tb_clear = 1'b0;
	@(posedge tb_clk);
	#(CHECK_DELAY);
	if (tb_empty == 1'b1 && tb_full == 1'b0) begin					
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == 8'b0 && tb_m2 == 8'b0 && tb_m3 == 8'b0 && tb_m4 == 8'b0 && tb_m5 == 8'b0 &&
	    tb_m6 == 8'b0 && tb_m7 == 8'b0 && tb_m8 == 8'b0 && tb_m9 == 8'b0 && tb_m10 == 8'b0 &&
	    tb_m11 == 8'b0 && tb_m12 == 8'b0 && tb_m13 == 8'b0 && tb_m14 == 8'b0 && tb_m15 == 8'b0 &&
	    tb_m16 == 8'b0 && tb_m17 == 8'b0 && tb_m18 == 8'b0 && tb_m19 == 8'b0 && tb_m20 == 8'b0 &&
	    tb_m21 == 8'b0 && tb_m22 == 8'b0 && tb_m23 == 8'b0 && tb_m24 == 8'b0 && tb_m25 == 8'b0) begin
		$info("Test Case 0 Correct Data Storage - PASSED");
	end else begin
		$error("Test Case 0 Incorrect Data Storage - FAILED");
	end
	tb_data_in = expected_m1;		
	tb_save = 1'b1;
	tb_clear = 1'b0;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m2;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m3;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m4;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m5;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m6;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m7;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m8;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m9;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m10;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m11;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m12;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m13;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	tb_clear = 1'b1;		// clear
	@(posedge tb_clk);
	tb_clear = 1'b0;
	@(posedge tb_clk);
	#(CHECK_DELAY);
	if (tb_empty == 1'b1 && tb_full == 1'b0) begin					
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == 8'b0 && tb_m2 == 8'b0 && tb_m3 == 8'b0 && tb_m4 == 8'b0 && tb_m5 == 8'b0 &&
	    tb_m6 == 8'b0 && tb_m7 == 8'b0 && tb_m8 == 8'b0 && tb_m9 == 8'b0 && tb_m10 == 8'b0 &&
	    tb_m11 == 8'b0 && tb_m12 == 8'b0 && tb_m13 == 8'b0 && tb_m14 == 8'b0 && tb_m15 == 8'b0 &&
	    tb_m16 == 8'b0 && tb_m17 == 8'b0 && tb_m18 == 8'b0 && tb_m19 == 8'b0 && tb_m20 == 8'b0 &&
	    tb_m21 == 8'b0 && tb_m22 == 8'b0 && tb_m23 == 8'b0 && tb_m24 == 8'b0 && tb_m25 == 8'b0) begin
		$info("Test Case 0 Correct Data Storage - PASSED");
	end else begin
		$error("Test Case 0 Incorrect Data Storage - FAILED");
	end
	tb_data_in = expected_m1;		
	tb_save = 1'b1;
	tb_clear = 1'b0;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m2;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m3;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m4;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m5;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m6;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m7;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m8;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m9;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m10;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m11;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m12;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m13;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m14;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	tb_clear = 1'b1;		// clear
	@(posedge tb_clk);
	tb_clear = 1'b0;
	@(posedge tb_clk);
	#(CHECK_DELAY);
	if (tb_empty == 1'b1 && tb_full == 1'b0) begin					
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == 8'b0 && tb_m2 == 8'b0 && tb_m3 == 8'b0 && tb_m4 == 8'b0 && tb_m5 == 8'b0 &&
	    tb_m6 == 8'b0 && tb_m7 == 8'b0 && tb_m8 == 8'b0 && tb_m9 == 8'b0 && tb_m10 == 8'b0 &&
	    tb_m11 == 8'b0 && tb_m12 == 8'b0 && tb_m13 == 8'b0 && tb_m14 == 8'b0 && tb_m15 == 8'b0 &&
	    tb_m16 == 8'b0 && tb_m17 == 8'b0 && tb_m18 == 8'b0 && tb_m19 == 8'b0 && tb_m20 == 8'b0 &&
	    tb_m21 == 8'b0 && tb_m22 == 8'b0 && tb_m23 == 8'b0 && tb_m24 == 8'b0 && tb_m25 == 8'b0) begin
		$info("Test Case 0 Correct Data Storage - PASSED");
	end else begin
		$error("Test Case 0 Incorrect Data Storage - FAILED");
	end
	tb_data_in = expected_m1;		
	tb_save = 1'b1;
	tb_clear = 1'b0;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m2;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m3;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m4;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m5;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m6;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m7;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m8;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m9;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m10;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m11;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m12;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m13;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m14;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m15;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	tb_clear = 1'b1;		// clear
	@(posedge tb_clk);
	tb_clear = 1'b0;
	@(posedge tb_clk);
	#(CHECK_DELAY);
	if (tb_empty == 1'b1 && tb_full == 1'b0) begin					
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == 8'b0 && tb_m2 == 8'b0 && tb_m3 == 8'b0 && tb_m4 == 8'b0 && tb_m5 == 8'b0 &&
	    tb_m6 == 8'b0 && tb_m7 == 8'b0 && tb_m8 == 8'b0 && tb_m9 == 8'b0 && tb_m10 == 8'b0 &&
	    tb_m11 == 8'b0 && tb_m12 == 8'b0 && tb_m13 == 8'b0 && tb_m14 == 8'b0 && tb_m15 == 8'b0 &&
	    tb_m16 == 8'b0 && tb_m17 == 8'b0 && tb_m18 == 8'b0 && tb_m19 == 8'b0 && tb_m20 == 8'b0 &&
	    tb_m21 == 8'b0 && tb_m22 == 8'b0 && tb_m23 == 8'b0 && tb_m24 == 8'b0 && tb_m25 == 8'b0) begin
		$info("Test Case 0 Correct Data Storage - PASSED");
	end else begin
		$error("Test Case 0 Incorrect Data Storage - FAILED");
	end
	tb_data_in = expected_m1;		
	tb_save = 1'b1;
	tb_clear = 1'b0;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m2;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m3;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m4;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m5;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m6;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m7;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m8;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m9;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m10;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m11;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m12;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m13;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m14;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m15;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m16;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	tb_clear = 1'b1;		// clear
	@(posedge tb_clk);
	tb_clear = 1'b0;
	@(posedge tb_clk);
	#(CHECK_DELAY);
	if (tb_empty == 1'b1 && tb_full == 1'b0) begin					
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == 8'b0 && tb_m2 == 8'b0 && tb_m3 == 8'b0 && tb_m4 == 8'b0 && tb_m5 == 8'b0 &&
	    tb_m6 == 8'b0 && tb_m7 == 8'b0 && tb_m8 == 8'b0 && tb_m9 == 8'b0 && tb_m10 == 8'b0 &&
	    tb_m11 == 8'b0 && tb_m12 == 8'b0 && tb_m13 == 8'b0 && tb_m14 == 8'b0 && tb_m15 == 8'b0 &&
	    tb_m16 == 8'b0 && tb_m17 == 8'b0 && tb_m18 == 8'b0 && tb_m19 == 8'b0 && tb_m20 == 8'b0 &&
	    tb_m21 == 8'b0 && tb_m22 == 8'b0 && tb_m23 == 8'b0 && tb_m24 == 8'b0 && tb_m25 == 8'b0) begin
		$info("Test Case 0 Correct Data Storage - PASSED");
	end else begin
		$error("Test Case 0 Incorrect Data Storage - FAILED");
	end
	tb_data_in = expected_m1;		
	tb_save = 1'b1;
	tb_clear = 1'b0;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m2;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m3;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m4;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m5;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m6;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m7;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m8;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m9;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m10;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m11;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m12;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m13;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m14;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m15;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m16;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m17;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	tb_clear = 1'b1;		// clear
	@(posedge tb_clk);
	tb_clear = 1'b0;
	@(posedge tb_clk);
	#(CHECK_DELAY);
	if (tb_empty == 1'b1 && tb_full == 1'b0) begin					
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == 8'b0 && tb_m2 == 8'b0 && tb_m3 == 8'b0 && tb_m4 == 8'b0 && tb_m5 == 8'b0 &&
	    tb_m6 == 8'b0 && tb_m7 == 8'b0 && tb_m8 == 8'b0 && tb_m9 == 8'b0 && tb_m10 == 8'b0 &&
	    tb_m11 == 8'b0 && tb_m12 == 8'b0 && tb_m13 == 8'b0 && tb_m14 == 8'b0 && tb_m15 == 8'b0 &&
	    tb_m16 == 8'b0 && tb_m17 == 8'b0 && tb_m18 == 8'b0 && tb_m19 == 8'b0 && tb_m20 == 8'b0 &&
	    tb_m21 == 8'b0 && tb_m22 == 8'b0 && tb_m23 == 8'b0 && tb_m24 == 8'b0 && tb_m25 == 8'b0) begin
		$info("Test Case 0 Correct Data Storage - PASSED");
	end else begin
		$error("Test Case 0 Incorrect Data Storage - FAILED");
	end
	tb_data_in = expected_m1;		
	tb_save = 1'b1;
	tb_clear = 1'b0;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m2;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m3;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m4;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m5;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m6;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m7;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m8;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m9;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m10;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m11;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m12;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m13;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m14;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m15;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m16;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m17;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m18;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	tb_clear = 1'b1;		// clear
	@(posedge tb_clk);
	tb_clear = 1'b0;
	@(posedge tb_clk);
	#(CHECK_DELAY);
	if (tb_empty == 1'b1 && tb_full == 1'b0) begin					
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == 8'b0 && tb_m2 == 8'b0 && tb_m3 == 8'b0 && tb_m4 == 8'b0 && tb_m5 == 8'b0 &&
	    tb_m6 == 8'b0 && tb_m7 == 8'b0 && tb_m8 == 8'b0 && tb_m9 == 8'b0 && tb_m10 == 8'b0 &&
	    tb_m11 == 8'b0 && tb_m12 == 8'b0 && tb_m13 == 8'b0 && tb_m14 == 8'b0 && tb_m15 == 8'b0 &&
	    tb_m16 == 8'b0 && tb_m17 == 8'b0 && tb_m18 == 8'b0 && tb_m19 == 8'b0 && tb_m20 == 8'b0 &&
	    tb_m21 == 8'b0 && tb_m22 == 8'b0 && tb_m23 == 8'b0 && tb_m24 == 8'b0 && tb_m25 == 8'b0) begin
		$info("Test Case 0 Correct Data Storage - PASSED");
	end else begin
		$error("Test Case 0 Incorrect Data Storage - FAILED");
	end
	tb_data_in = expected_m1;		
	tb_save = 1'b1;
	tb_clear = 1'b0;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m2;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m3;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m4;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m5;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m6;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m7;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m8;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m9;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m10;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m11;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m12;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m13;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m14;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m15;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m16;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m17;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m18;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m19;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	tb_clear = 1'b1;		// clear
	@(posedge tb_clk);
	tb_clear = 1'b0;
	@(posedge tb_clk);
	#(CHECK_DELAY);
	if (tb_empty == 1'b1 && tb_full == 1'b0) begin					
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == 8'b0 && tb_m2 == 8'b0 && tb_m3 == 8'b0 && tb_m4 == 8'b0 && tb_m5 == 8'b0 &&
	    tb_m6 == 8'b0 && tb_m7 == 8'b0 && tb_m8 == 8'b0 && tb_m9 == 8'b0 && tb_m10 == 8'b0 &&
	    tb_m11 == 8'b0 && tb_m12 == 8'b0 && tb_m13 == 8'b0 && tb_m14 == 8'b0 && tb_m15 == 8'b0 &&
	    tb_m16 == 8'b0 && tb_m17 == 8'b0 && tb_m18 == 8'b0 && tb_m19 == 8'b0 && tb_m20 == 8'b0 &&
	    tb_m21 == 8'b0 && tb_m22 == 8'b0 && tb_m23 == 8'b0 && tb_m24 == 8'b0 && tb_m25 == 8'b0) begin
		$info("Test Case 0 Correct Data Storage - PASSED");
	end else begin
		$error("Test Case 0 Incorrect Data Storage - FAILED");
	end
	tb_data_in = expected_m1;		
	tb_save = 1'b1;
	tb_clear = 1'b0;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m2;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m3;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m4;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m5;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m6;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m7;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m8;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m9;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m10;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m11;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m12;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m13;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m14;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m15;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m16;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m17;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m18;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m19;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m20;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);


	tb_clear = 1'b1;		// clear
	@(posedge tb_clk);
	tb_clear = 1'b0;
	@(posedge tb_clk);
	#(CHECK_DELAY);
	if (tb_empty == 1'b1 && tb_full == 1'b0) begin					
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == 8'b0 && tb_m2 == 8'b0 && tb_m3 == 8'b0 && tb_m4 == 8'b0 && tb_m5 == 8'b0 &&
	    tb_m6 == 8'b0 && tb_m7 == 8'b0 && tb_m8 == 8'b0 && tb_m9 == 8'b0 && tb_m10 == 8'b0 &&
	    tb_m11 == 8'b0 && tb_m12 == 8'b0 && tb_m13 == 8'b0 && tb_m14 == 8'b0 && tb_m15 == 8'b0 &&
	    tb_m16 == 8'b0 && tb_m17 == 8'b0 && tb_m18 == 8'b0 && tb_m19 == 8'b0 && tb_m20 == 8'b0 &&
	    tb_m21 == 8'b0 && tb_m22 == 8'b0 && tb_m23 == 8'b0 && tb_m24 == 8'b0 && tb_m25 == 8'b0) begin
		$info("Test Case 0 Correct Data Storage - PASSED");
	end else begin
		$error("Test Case 0 Incorrect Data Storage - FAILED");
	end
	tb_data_in = expected_m1;		
	tb_save = 1'b1;
	tb_clear = 1'b0;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m2;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m3;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m4;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m5;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m6;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m7;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m8;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m9;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m10;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m11;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m12;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m13;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m14;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m15;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m16;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m17;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m18;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m19;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m20;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m21;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);


	tb_clear = 1'b1;		// clear
	@(posedge tb_clk);
	tb_clear = 1'b0;
	@(posedge tb_clk);
	#(CHECK_DELAY);
	if (tb_empty == 1'b1 && tb_full == 1'b0) begin					
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == 8'b0 && tb_m2 == 8'b0 && tb_m3 == 8'b0 && tb_m4 == 8'b0 && tb_m5 == 8'b0 &&
	    tb_m6 == 8'b0 && tb_m7 == 8'b0 && tb_m8 == 8'b0 && tb_m9 == 8'b0 && tb_m10 == 8'b0 &&
	    tb_m11 == 8'b0 && tb_m12 == 8'b0 && tb_m13 == 8'b0 && tb_m14 == 8'b0 && tb_m15 == 8'b0 &&
	    tb_m16 == 8'b0 && tb_m17 == 8'b0 && tb_m18 == 8'b0 && tb_m19 == 8'b0 && tb_m20 == 8'b0 &&
	    tb_m21 == 8'b0 && tb_m22 == 8'b0 && tb_m23 == 8'b0 && tb_m24 == 8'b0 && tb_m25 == 8'b0) begin
		$info("Test Case 0 Correct Data Storage - PASSED");
	end else begin
		$error("Test Case 0 Incorrect Data Storage - FAILED");
	end
	tb_data_in = expected_m1;		
	tb_save = 1'b1;
	tb_clear = 1'b0;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m2;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m3;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m4;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m5;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m6;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m7;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m8;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m9;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m10;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m11;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m12;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m13;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m14;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m15;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m16;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m17;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m18;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m19;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m20;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m21;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m22;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);


	tb_clear = 1'b1;		// clear
	@(posedge tb_clk);
	tb_clear = 1'b0;
	@(posedge tb_clk);
	#(CHECK_DELAY);
	if (tb_empty == 1'b1 && tb_full == 1'b0) begin					
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == 8'b0 && tb_m2 == 8'b0 && tb_m3 == 8'b0 && tb_m4 == 8'b0 && tb_m5 == 8'b0 &&
	    tb_m6 == 8'b0 && tb_m7 == 8'b0 && tb_m8 == 8'b0 && tb_m9 == 8'b0 && tb_m10 == 8'b0 &&
	    tb_m11 == 8'b0 && tb_m12 == 8'b0 && tb_m13 == 8'b0 && tb_m14 == 8'b0 && tb_m15 == 8'b0 &&
	    tb_m16 == 8'b0 && tb_m17 == 8'b0 && tb_m18 == 8'b0 && tb_m19 == 8'b0 && tb_m20 == 8'b0 &&
	    tb_m21 == 8'b0 && tb_m22 == 8'b0 && tb_m23 == 8'b0 && tb_m24 == 8'b0 && tb_m25 == 8'b0) begin
		$info("Test Case 0 Correct Data Storage - PASSED");
	end else begin
		$error("Test Case 0 Incorrect Data Storage - FAILED");
	end
	tb_data_in = expected_m1;		
	tb_save = 1'b1;
	tb_clear = 1'b0;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m2;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m3;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m4;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m5;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m6;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m7;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m8;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m9;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m10;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m11;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m12;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m13;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m14;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m15;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m16;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m17;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m18;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m19;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m20;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m21;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m22;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m23;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);


	tb_clear = 1'b1;		// clear
	@(posedge tb_clk);
	tb_clear = 1'b0;
	@(posedge tb_clk);
	#(CHECK_DELAY);
	if (tb_empty == 1'b1 && tb_full == 1'b0) begin					
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == 8'b0 && tb_m2 == 8'b0 && tb_m3 == 8'b0 && tb_m4 == 8'b0 && tb_m5 == 8'b0 &&
	    tb_m6 == 8'b0 && tb_m7 == 8'b0 && tb_m8 == 8'b0 && tb_m9 == 8'b0 && tb_m10 == 8'b0 &&
	    tb_m11 == 8'b0 && tb_m12 == 8'b0 && tb_m13 == 8'b0 && tb_m14 == 8'b0 && tb_m15 == 8'b0 &&
	    tb_m16 == 8'b0 && tb_m17 == 8'b0 && tb_m18 == 8'b0 && tb_m19 == 8'b0 && tb_m20 == 8'b0 &&
	    tb_m21 == 8'b0 && tb_m22 == 8'b0 && tb_m23 == 8'b0 && tb_m24 == 8'b0 && tb_m25 == 8'b0) begin
		$info("Test Case 0 Correct Data Storage - PASSED");
	end else begin
		$error("Test Case 0 Incorrect Data Storage - FAILED");
	end
	tb_data_in = expected_m1;		
	tb_save = 1'b1;
	tb_clear = 1'b0;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m2;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m3;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m4;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m5;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m6;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m7;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m8;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m9;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m10;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m11;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m12;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m13;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m14;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m15;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m16;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m17;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m18;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m19;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m20;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m21;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m22;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m23;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m24;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	tb_clear = 1'b1;		// clear
	@(posedge tb_clk);
	tb_clear = 1'b0;
	@(posedge tb_clk);
	#(CHECK_DELAY);
	if (tb_empty == 1'b1 && tb_full == 1'b0) begin					
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == 8'b0 && tb_m2 == 8'b0 && tb_m3 == 8'b0 && tb_m4 == 8'b0 && tb_m5 == 8'b0 &&
	    tb_m6 == 8'b0 && tb_m7 == 8'b0 && tb_m8 == 8'b0 && tb_m9 == 8'b0 && tb_m10 == 8'b0 &&
	    tb_m11 == 8'b0 && tb_m12 == 8'b0 && tb_m13 == 8'b0 && tb_m14 == 8'b0 && tb_m15 == 8'b0 &&
	    tb_m16 == 8'b0 && tb_m17 == 8'b0 && tb_m18 == 8'b0 && tb_m19 == 8'b0 && tb_m20 == 8'b0 &&
	    tb_m21 == 8'b0 && tb_m22 == 8'b0 && tb_m23 == 8'b0 && tb_m24 == 8'b0 && tb_m25 == 8'b0) begin
		$info("Test Case 0 Correct Data Storage - PASSED");
	end else begin
		$error("Test Case 0 Incorrect Data Storage - FAILED");
	end
	tb_data_in = expected_m1;		
	tb_save = 1'b1;
	tb_clear = 1'b0;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m2;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m3;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m4;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m5;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m6;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m7;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m8;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m9;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m10;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m11;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m12;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m13;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m14;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m15;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m16;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m17;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m18;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m19;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m20;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m21;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m22;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m23;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m24;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m25;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	tb_clear = 1'b1;		// clear
	@(posedge tb_clk);
	tb_clear = 1'b0;
	@(posedge tb_clk);
	#(CHECK_DELAY);
	if (tb_empty == 1'b1 && tb_full == 1'b0) begin					
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == 8'b0 && tb_m2 == 8'b0 && tb_m3 == 8'b0 && tb_m4 == 8'b0 && tb_m5 == 8'b0 &&
	    tb_m6 == 8'b0 && tb_m7 == 8'b0 && tb_m8 == 8'b0 && tb_m9 == 8'b0 && tb_m10 == 8'b0 &&
	    tb_m11 == 8'b0 && tb_m12 == 8'b0 && tb_m13 == 8'b0 && tb_m14 == 8'b0 && tb_m15 == 8'b0 &&
	    tb_m16 == 8'b0 && tb_m17 == 8'b0 && tb_m18 == 8'b0 && tb_m19 == 8'b0 && tb_m20 == 8'b0 &&
	    tb_m21 == 8'b0 && tb_m22 == 8'b0 && tb_m23 == 8'b0 && tb_m24 == 8'b0 && tb_m25 == 8'b0) begin
		$info("Test Case 0 Correct Data Storage - PASSED");
	end else begin
		$error("Test Case 0 Incorrect Data Storage - FAILED");
	end

// Cheat for Coverage
	test_case = test_case + 1;

	expected_m1 = 8'd21;
	expected_m2 = 8'd255;
	expected_m3 = 8'd252;
	expected_m4 = 8'd244;
	expected_m5 = 8'd135;
	expected_m6 = 8'd32;
	expected_m7 = 8'd64;
	expected_m8 = 8'd73;
	expected_m9 = 8'd0;
	expected_m10 = 8'd11;
	expected_m11 = 8'd99;
	expected_m12 = 8'd231;
	expected_m13 = 8'd221;
	expected_m14 = 8'd154;
	expected_m15 = 8'd142;
	expected_m16 = 8'd195;
	expected_m17 = 8'd111;
	expected_m18 = 8'd18;
	expected_m19 = 8'd19;
	expected_m20 = 8'd57;
	expected_m21 = 8'd3;
	expected_m22 = 8'd201;
	expected_m23 = 8'd234;
	expected_m24 = 8'd129;
	expected_m25 = 8'd184;

	tb_data_in = expected_m1;		
	tb_save = 1'b1;
	tb_clear = 1'b0;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m2;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m3;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m4;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m5;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m6;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m7;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m8;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m9;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m10;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m11;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m12;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m13;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m14;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m15;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m16;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m17;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m18;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m19;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m20;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m21;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m22;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m23;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m24;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);
	tb_data_in = expected_m25;
	tb_save = 1'b1;
	@(posedge tb_clk);
	tb_save = 1'b0;
	@(posedge tb_clk);

	#(CHECK_DELAY);
	if (tb_empty == 1'b0 && tb_full == 1'b1) begin					// change here for more test cases
		$info("Test Case %d Correct Empty and Full - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Empty or Full - FAILED", test_case);
	end
	if (tb_m1 == expected_m1 && tb_m2 == expected_m2 && tb_m3 == expected_m3 &&
	    tb_m4 == expected_m4 && tb_m5 == expected_m5 && tb_m6 == expected_m6 &&
	    tb_m7 == expected_m7 && tb_m8 == expected_m8 && tb_m9 == expected_m9 &&
	    tb_m10 == expected_m10 && tb_m11 == expected_m11 && tb_m12 == expected_m12 &&
	    tb_m13 == expected_m13 && tb_m14 == expected_m14 && tb_m15 == expected_m15 &&
	    tb_m16 == expected_m16 && tb_m17 == expected_m17 && tb_m18 == expected_m18 &&
	    tb_m19 == expected_m19 && tb_m20 == expected_m20 && tb_m21 == expected_m21 &&
	    tb_m22 == expected_m22 && tb_m23 == expected_m23 && tb_m24 == expected_m24 &&
	    tb_m25 == expected_m25) begin				// change here for more test cases
		$info("Test Case %d Correct Data Storage - PASSED", test_case);
	end else begin
		$error("Test Case %d Incorrect Data Storage - FAILED", test_case);
	end

	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);
	@(posedge tb_clk);



	end // END INITIAL

endmodule
