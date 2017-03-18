// $Id: $
// File name:   mcu.sv
// Created:     3/16/2017
// Author:      Chia-Hua Peng
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: main control unit


module mcu
(
	input clk,
	input n_rst,
	input i_stop,
	input i_read_complete,
	input i_grayscale_data_ready,
	input i_b1_full,
	input i_gradient_data_ready,
	input i_start_next_write,
	input i_write_complete,
	input i_b2_empty,
	output reg [31:0] o_mcu_raddr,
	output reg o_re,
	output reg o_grayscale_start,
	output reg o_b1_save,
	output reg o_b1_clear,
	output reg o_gradient_start,
	output reg o_b2_save,
	output reg [31:0] o_mcu_waddr,
	output reg o_we,
	output reg o_complete
);

// address logic
reg [31:0] n_mcu_raddr;
reg [31:0] n_mcu_waddr;

// read address counter
reg [2:0] rct1, n_rct1;
reg [2:0] rct2, n_rct2;
reg [7:0] rct3, n_rct3;

// write address counter
reg [1:0] wct1, n_wct1;
reg [1:0] wct2, n_wct2;
reg [7:0] wct3, n_wct3;
//reg [7:0] wct4, n_wct4;

// register output
reg n_re, n_grayscale_start, n_b1_save, n_b1_clear, n_gradient_start, n_b2_save, n_we, n_complete;

// next window start pointer
reg [31:0] n_pt, pt;
reg [31:0] n_wpt, wpt;
reg [31:0] n_rowpt, rowpt;

typedef enum logic [5:0] {IDLE, R_CON_1, R_CON_2, R_CON_3, 
			  READ_ADDR_1, 
			  READ_ADDR_2, //READ_ADDR_2_B, 
			  READ_ADDR_3, //READ_ADDR_3_B, READ_ADDR_3_C, READ_ADDR_3_D, READ_ADDR_3_E, READ_ADDR_3_F, READ_ADDR_3_G, READ_ADDR_3_H, READ_ADDR_3_I, READ_ADDR_3_J,
			  		//READ_ADDR_3_K, READ_ADDR_3_L, READ_ADDR_3_M, READ_ADDR_3_N, READ_ADDR_3_O, READ_ADDR_3_P, READ_ADDR_3_Q, READ_ADDR_3_R, READ_ADDR_3_S, READ_ADDR_3_T,
			  READ_ADDR_4, 
			  READ_EN, WAIT_READ,  			  
			  GRAY_START, WAIT_GRAY, B1_SAVE, B1_WAIT_1, B1_WAIT_2, EDGE_START, WAIT_EDGE, B2_SAVE, 			   		   			  
			  B2_WAIT, W_CON_1, W_CON_2, W_CON_3, 
			  WRITE_ADDR_1, 
			  WRITE_ADDR_2, //WRITE_ADDR_2_B,
			  WRITE_ADDR_3, //WRITE_ADDR_3_B, WRITE_ADDR_3_C, WRITE_ADDR_3_D, WRITE_ADDR_3_E,
			  WRITE_ADDR_4, 
			  WRITE_EN, WAIT_WRITE, CHK_B2_DONE,  // write stages
			  B2_POST_WAIT_1, B2_POST_WAIT_2, OVERALL_DONE_CHK} state_type;

state_type curr, next;


// pointer registers
always_ff @(posedge clk, negedge n_rst)
begin
	if (n_rst == 0) begin
		pt <= 0;
		wpt <= 0;
		rowpt <= 0;
	end else begin
		pt <= n_pt;
		wpt <= n_wpt;
		rowpt <= n_rowpt;
	end
end



// output registers
always_ff @ (posedge clk, negedge n_rst)
begin
	if (n_rst == 0) begin
		o_re <= 1'b0;
		o_grayscale_start <= 1'b0;
		o_b1_save <= 1'b0;
		o_b1_clear <= 1'b0;
		o_gradient_start <= 1'b0;
		o_b2_save <= 1'b0;
		o_we <= 1'b0;
		o_complete <= 1'b0;
	end else begin
		o_re <= n_re;
		o_grayscale_start <= n_grayscale_start;
		o_b1_save <= n_b1_save;
		o_b1_clear <= n_b1_clear;
		o_gradient_start <= n_gradient_start;
		o_b2_save <= n_b2_save;
		o_we <= n_we;
		o_complete <= n_complete;
	end
end

// address logic registers
always_ff @ (posedge clk, negedge n_rst)
begin
	if (n_rst == 0) begin
		o_mcu_raddr <= 32'd0;
		o_mcu_waddr <= 32'd400000;
	end else begin
		o_mcu_raddr <= n_mcu_raddr;
		o_mcu_waddr <= n_mcu_waddr;
	end
end

// address counter registers
always_ff @ (posedge clk, negedge n_rst)
begin
	if (n_rst == 0) begin
		rct1 <= 3'b0;
		rct2 <= 3'b1;
		rct3 <= 8'b1;
		wct1 <= 2'b0;
		wct2 <= 2'b1;
		wct3 <= 8'b1;
		//wct4 <= 8'b1;
	end else begin
		rct1 <= n_rct1;
		rct2 <= n_rct2;
		rct3 <= n_rct3;
		wct1 <= n_wct1;
		wct2 <= n_wct2;
		wct3 <= n_wct3;
		//wct4 <= n_wct4;
	end
end

// FSM register
always_ff @ (posedge clk, negedge n_rst)
begin
	if (n_rst == 0) begin
		curr <= IDLE;
	end else begin
		curr <= next;
	end
end

// Next State Logic
always_comb
begin
	next = curr;
	case (curr)
		IDLE:
		begin
			if (!i_stop)
				next = R_CON_1;
			else
				next = IDLE;
		end
		R_CON_1:
		begin
			if (rct1 == 3'd5)
				next = R_CON_2;
			else
				next = READ_ADDR_1;
		end
		R_CON_2:
		begin
			if (rct2 == 3'd5)
				next = R_CON_3;
			else
				next = READ_ADDR_2;
		end
		R_CON_3:
		begin
			if (rct3 == 8'd200)
				next = READ_ADDR_4;
			else
				next = READ_ADDR_3;
		end



		READ_ADDR_1:
		begin
			next = READ_EN;
		end
		READ_ADDR_2:
		begin
			next = READ_EN;
		end
		READ_ADDR_3:
		begin
			next = READ_EN;
		end
		READ_ADDR_4:
		begin
			next = READ_EN;
		end

/*
		READ_ADDR_1:			// type 1 offset
		begin
			next = READ_EN;
		end


		READ_ADDR_2:			// type 2 offset
		begin
			next = READ_ADDR_2_B;
		end
		READ_ADDR_2_B:
		begin
			next = READ_EN;
		end
	
		
		READ_ADDR_3:			// type 3 offset
		begin
			next = READ_ADDR_3_B;
		end
		READ_ADDR_3_B:
		begin
			next = READ_ADDR_3_C;
		end
		READ_ADDR_3_C:
		begin
			next = READ_ADDR_3_D; 
		end
		READ_ADDR_3_D:
		begin
			next = READ_ADDR_3_E;
		end
		READ_ADDR_3_E:
		begin
			next = READ_ADDR_3_F;
		end
		READ_ADDR_3_F:
		begin
			next = READ_ADDR_3_G;
		end
		READ_ADDR_3_G:
		begin
			next = READ_ADDR_3_H;
		end
		READ_ADDR_3_H:
		begin
			next = READ_ADDR_3_I;
		end
		READ_ADDR_3_I:
		begin
			next = READ_ADDR_3_J;
		end
		READ_ADDR_3_J:
		begin
			next = READ_ADDR_3_K;
		end
		READ_ADDR_3_K:
		begin
			next = READ_ADDR_3_L;
		end
		READ_ADDR_3_L:
		begin
			next = READ_ADDR_3_M;
		end
		READ_ADDR_3_M:
		begin
			next = READ_ADDR_3_N;
		end
		READ_ADDR_3_N:
		begin
			next = READ_ADDR_3_O;
		end
		READ_ADDR_3_O:
		begin
			next = READ_ADDR_3_P;
		end
		READ_ADDR_3_P:
		begin
			next = READ_ADDR_3_Q;
		end
		READ_ADDR_3_Q:
		begin
			next = READ_ADDR_3_R;
		end
		READ_ADDR_3_R:
		begin
			next = READ_ADDR_3_S;
		end
		READ_ADDR_3_S:
		begin
			next = READ_ADDR_3_T;
		end
		READ_ADDR_3_T:
		begin
			next = READ_EN;
		end


		READ_ADDR_4:			// type 4 offset
		begin
			next = READ_EN;
		end

*/
		READ_EN:
		begin
			next = WAIT_READ;
		end
		WAIT_READ:
		begin
			if (i_read_complete)
				next = GRAY_START;
			else
				next = WAIT_READ;
		end
		GRAY_START:
		begin
			next = WAIT_GRAY;
		end
		WAIT_GRAY:
		begin
			if (i_grayscale_data_ready)
				next = B1_SAVE;
			else
				next = WAIT_GRAY;
		end
		B1_SAVE:
		begin
			next = B1_WAIT_1;
		end
		B1_WAIT_1:
		begin
			next = B1_WAIT_2;
		end
		B1_WAIT_2:
		begin
			if (!i_b1_full)
				next = R_CON_1;
			else
				next = EDGE_START;
		end
		EDGE_START:
		begin
			next = WAIT_EDGE;
		end
		WAIT_EDGE:
		begin
			if (i_gradient_data_ready)
				next = B2_SAVE;
			else
				next = WAIT_EDGE; 
		end
		B2_SAVE:
		begin
			next = B2_WAIT;
		end
		B2_WAIT:
		begin
			if (i_start_next_write)
				next = W_CON_1;
			else
				next = B2_WAIT;
		end
		W_CON_1:
		begin
			if (wct1 == 2'd3)
				next = W_CON_2;
			else
				next = WRITE_ADDR_1;
		end
		W_CON_2:
		begin
			if (wct2 == 2'd3)
				next = W_CON_3;
			else
				next = WRITE_ADDR_2;
		end
		W_CON_3:
		begin
			if (wct3 == 8'd200)
				next = WRITE_ADDR_4;
			else
				next = WRITE_ADDR_3;
		end

		WRITE_ADDR_1:
		begin
			next = WRITE_EN;
		end
		WRITE_ADDR_2:
		begin
			next = WRITE_EN;
		end
		WRITE_ADDR_3:
		begin
			next = WRITE_EN;
		end
		WRITE_ADDR_4:
		begin
			next = WRITE_EN;
		end
/*
		WRITE_ADDR_1:			// write address offset type 1
		begin
			next = WRITE_EN;
		end

		WRITE_ADDR_2:			// write address offset type 2
		begin
			next = WRITE_ADDR_2_B;
		end
		WRITE_ADDR_2_B:			
		begin
			next = WRITE_EN;
		end

		WRITE_ADDR_3:			// write address offset type 3
		begin
			next = WRITE_ADDR_3_B;
		end
		WRITE_ADDR_3_B:			
		begin
			next = WRITE_ADDR_3_C;
		end
		WRITE_ADDR_3_C:			
		begin
			next = WRITE_ADDR_3_D;
		end
		WRITE_ADDR_3_D:			
		begin
			next = WRITE_ADDR_3_E;
		end
		WRITE_ADDR_3_E:			
		begin
			next = WRITE_EN;
		end

		WRITE_ADDR_4:			// write address offset type 4
		begin
			next = WRITE_EN;
		end
*/


		WRITE_EN:
		begin
			next = WAIT_WRITE;
		end
		WAIT_WRITE:
		begin
			if (i_write_complete)
				next = B2_POST_WAIT_1;
			else
				next = WAIT_WRITE;
		end
		B2_POST_WAIT_1:
		begin
			next = B2_POST_WAIT_2;
		end
		B2_POST_WAIT_2:
		begin
			next = CHK_B2_DONE;
		end
		CHK_B2_DONE:
		begin
			if (!i_b2_empty)
				next = B2_WAIT;
			else
				next = OVERALL_DONE_CHK;
		end
		OVERALL_DONE_CHK:
		begin
			if (o_mcu_waddr == 32'd760000)
				next = OVERALL_DONE_CHK;
			else
				next = IDLE;
		end
	endcase
end

// Output Logic
always_comb
begin
	n_mcu_raddr = o_mcu_raddr;
	n_mcu_waddr = o_mcu_waddr;
	n_rct1 = rct1;
	n_rct2 = rct2;
	n_rct3 = rct3;
	n_wct1 = wct1;
	n_wct2 = wct2;
	n_wct3 = wct3;
	//n_wct4 = wct4;

	n_re = 0;
	n_grayscale_start = 0;
	n_b1_save = 0;
	n_gradient_start = 0;
	n_b2_save = 0;
	n_we = 0;

	n_complete = 1'b0;

	n_pt = pt;
	n_wpt = wpt;
	n_rowpt = rowpt;

	case (curr)
		R_CON_1:
		begin
			n_rct1 = rct1 + 1;
		end
		R_CON_2:
		begin
			n_rct2 = rct2 + 1;
		end
		R_CON_3:
		begin
			n_rct3 = rct3 + 1;
		end


		READ_ADDR_1:
		begin
			n_mcu_raddr = o_mcu_raddr + 1;
		end
		READ_ADDR_2:
		begin
			n_mcu_raddr = o_mcu_raddr + 32'd598;
			n_rct1 = 1;
		end
		READ_ADDR_3:
		begin
			//n_mcu_raddr = o_mcu_raddr - 32'd2409;
			n_mcu_raddr = pt;

			n_rct1 = 1;
			n_rct2 = 1;
		end
		READ_ADDR_4:
		begin
			//n_mcu_raddr = o_mcu_raddr + 1;
			n_mcu_raddr = rowpt;
			n_rct1 = 1;
			n_rct2 = 1;
			n_rct3 = 1;
		end



/*///////// Read Address Offset

		READ_ADDR_1:			// type 1 offset 	+1
		begin
			n_mcu_raddr = o_mcu_raddr + 1;
		end


		READ_ADDR_2:			// type 2 offset	+598 = 299 + 299
		begin
			n_mcu_raddr = o_mcu_raddr + 32'd299;
			n_rct1 = 1;
		end
		READ_ADDR_2_B:
		begin
			n_mcu_raddr = o_mcu_raddr + 32'd299;
			n_rct1 = 1;
		end
	
		
		READ_ADDR_3:			// type 3 offset 	- 2409 = -60 -63 -127*18
		begin
			n_mcu_raddr = o_mcu_raddr - 32'd127;
			n_rct1 = 1;
			n_rct2 = 1;
		end
		READ_ADDR_3_B:
		begin
			n_mcu_raddr = o_mcu_raddr - 32'd127;
			n_rct1 = 1;
			n_rct2 = 1;
		end
		READ_ADDR_3_C:
		begin
			n_mcu_raddr = o_mcu_raddr - 32'd127;
			n_rct1 = 1;
			n_rct2 = 1;
		end
		READ_ADDR_3_D:
		begin
			n_mcu_raddr = o_mcu_raddr - 32'd127;
			n_rct1 = 1;
			n_rct2 = 1;
		end
		READ_ADDR_3_E:
		begin
			n_mcu_raddr = o_mcu_raddr - 32'd127;
			n_rct1 = 1;
			n_rct2 = 1;
		end
		READ_ADDR_3_F:
		begin
			n_mcu_raddr = o_mcu_raddr - 32'd127;
			n_rct1 = 1;
			n_rct2 = 1;
		end
		READ_ADDR_3_G:
		begin
			n_mcu_raddr = o_mcu_raddr - 32'd127;
			n_rct1 = 1;
			n_rct2 = 1;
		end
		READ_ADDR_3_H:
		begin
			n_mcu_raddr = o_mcu_raddr - 32'd127;
			n_rct1 = 1;
			n_rct2 = 1;
		end
		READ_ADDR_3_I:
		begin
			n_mcu_raddr = o_mcu_raddr - 32'd127;
			n_rct1 = 1;
			n_rct2 = 1;
		end
		READ_ADDR_3_J:
		begin
			n_mcu_raddr = o_mcu_raddr - 32'd127;
			n_rct1 = 1;
			n_rct2 = 1;
		end
		READ_ADDR_3_K:
		begin
			n_mcu_raddr = o_mcu_raddr - 32'd127;
			n_rct1 = 1;
			n_rct2 = 1;
		end
		READ_ADDR_3_L:
		begin
			n_mcu_raddr = o_mcu_raddr - 32'd127;
			n_rct1 = 1;
			n_rct2 = 1;
		end
		READ_ADDR_3_M:
		begin
			n_mcu_raddr = o_mcu_raddr - 32'd127;
			n_rct1 = 1;
			n_rct2 = 1;
		end
		READ_ADDR_3_N:
		begin
			n_mcu_raddr = o_mcu_raddr - 32'd127;
			n_rct1 = 1;
			n_rct2 = 1;
		end
		READ_ADDR_3_O:
		begin
			n_mcu_raddr = o_mcu_raddr - 32'd127;
			n_rct1 = 1;
			n_rct2 = 1;
		end
		READ_ADDR_3_P:
		begin
			n_mcu_raddr = o_mcu_raddr - 32'd127;
			n_rct1 = 1;
			n_rct2 = 1;
		end
		READ_ADDR_3_Q:
		begin
			n_mcu_raddr = o_mcu_raddr - 32'd127;
			n_rct1 = 1;
			n_rct2 = 1;
		end
		READ_ADDR_3_R:
		begin
			n_mcu_raddr = o_mcu_raddr - 32'd127;
			n_rct1 = 1;
			n_rct2 = 1;
		end
		READ_ADDR_3_S:
		begin
			n_mcu_raddr = o_mcu_raddr - 32'd63;
			n_rct1 = 1;
			n_rct2 = 1;
		end
		READ_ADDR_3_T:
		begin
			n_mcu_raddr = o_mcu_raddr - 32'd60;
			n_rct1 = 1;
			n_rct2 = 1;
		end


		READ_ADDR_4:			// type 4 offset 		+1
		begin
			n_mcu_raddr = o_mcu_raddr + 1;
			n_rct1 = 1;
			n_rct2 = 1;
			n_rct3 = 1;
		end
*//////////





		READ_EN:
		begin
			n_re = 1'b1;
		end
		WAIT_READ:
		begin
			if (rct1 == 1 && rct2 == 1)
				n_pt = o_mcu_raddr + 3;
			else
				n_pt = pt;
			if (rct1 == 1 && rct2 == 4 && rct3 == 1)
				n_rowpt = o_mcu_raddr;
			else
				n_rowpt = rowpt;

		end

		GRAY_START:
		begin
			n_grayscale_start = 1'b1;
		end
		B1_SAVE:
		begin
			n_b1_save = 1'b1;
		end

		EDGE_START:
		begin
			n_gradient_start = 1'b1;
		end
		B2_SAVE:
		begin
			n_b2_save = 1'b1;
			n_b1_clear = 1'b1;
		end
		W_CON_1:
		begin
			n_wct1 = wct1 + 1;
		end
		W_CON_2:
		begin
			n_wct2 = wct2 + 1;
		end
		W_CON_3:
		begin
			n_wct3 = wct3 + 1;
		end

		WRITE_ADDR_1:
		begin
			n_mcu_waddr = o_mcu_waddr + 1;
		end
		WRITE_ADDR_2:
		begin
			n_mcu_waddr = o_mcu_waddr + 32'd598;
			n_wct1 = 1;
		end
		WRITE_ADDR_3:
		begin
			//n_mcu_waddr = o_mcu_waddr - 32'd1199;
			n_mcu_waddr = wpt;
			n_wct1 = 1;
			n_wct2 = 1;
		end
		WRITE_ADDR_4:
		begin
			n_mcu_waddr = o_mcu_waddr + 1;
			n_wct1 = 1;
			n_wct2 = 1;
			n_wct3 = 1;
			//n_wct4 = wct4 + 1;
		end


/*///// write address offset

		WRITE_ADDR_1:			// write address offset type 1 		+1
		begin
			n_mcu_waddr = o_mcu_waddr + 1;
		end

		WRITE_ADDR_2:			// write address offset type 2		+598 = +299 + 299
		begin
			n_mcu_waddr = o_mcu_waddr + 32'd299;
			n_wct1 = 1;
		end
		WRITE_ADDR_2_B:			
		begin
			n_mcu_waddr = o_mcu_waddr + 32'd299;
			n_wct1 = 1;
		end

		WRITE_ADDR_3:			// write address offset type 3		-1199 = -239 - 240 -240 -240 -240
		begin
			n_mcu_waddr = o_mcu_waddr - 32'd239;
			n_wct1 = 1;
			n_wct2 = 1;
		end
		WRITE_ADDR_3_B:			
		begin
			n_mcu_waddr = o_mcu_waddr - 32'd240;
			n_wct1 = 1;
			n_wct2 = 1;
		end
		WRITE_ADDR_3_C:			
		begin
			n_mcu_waddr = o_mcu_waddr - 32'd240;
			n_wct1 = 1;
			n_wct2 = 1;
		end
		WRITE_ADDR_3_D:			
		begin
			n_mcu_waddr = o_mcu_waddr - 32'd240;
			n_wct1 = 1;
			n_wct2 = 1;
		end
		WRITE_ADDR_3_E:			
		begin
			n_mcu_waddr = o_mcu_waddr - 32'd240;
			n_wct1 = 1;
			n_wct2 = 1;
		end

		WRITE_ADDR_4:			// write address offset type 4	+1
		begin
			n_mcu_waddr = o_mcu_waddr + 1;
			n_wct1 = 1;
			n_wct2 = 1;
			n_wct3 = 1;
			n_wct4 = wct4 + 1;
		end
*//////


		WRITE_EN:
		begin
			n_we = 1'b1;
		end
		WAIT_WRITE:
		begin
			if (wct1 == 1 && wct2 == 1)
				n_wpt = o_mcu_waddr + 3;
			else
				n_wpt = wpt;
		end

		OVERALL_DONE_CHK:
		begin
			n_complete = 1'b1;
		end
	endcase
end



endmodule
