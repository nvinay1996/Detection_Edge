// $Id: $
// File name:   address_counter.sv
// Created:     3/20/2017
// Author:      Chia-Hua Peng
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: address counter


module address_counter
(
	input wire clk,
	input wire n_rst,
	input wire i_inc_raddr,
	input wire i_inc_waddr,
	input wire [31:0] i_init_raddr,
	input wire [31:0] i_init_waddr,
	input wire [8:0] i_img_width,
	input wire [8:0] i_img_height,
	input wire [31:0] i_img_size,
	output reg [31:0] o_raddr,
	output reg [31:0] o_waddr,
	output reg o_r_ready,
	output reg o_w_ready,
	output reg o_done
);



typedef enum logic [4:0] {RIDLE, R_CON_1, R_CON_2, R_CON_3, 
			  READ_ADDR_1,  // offset: addr = prev_addr +1 
			  READ_ADDR_2,  // offset: addr = prev_addr +424 
			  READ_ADDR_3,  // offset: addr = rcolpt
			  READ_ADDR_4, 	// offset: addr = rrowpt
                          READ_READY,
			  WIDLE, W_CON_1, W_CON_2, W_CON_3, 
			  WRITE_ADDR_1,  // offset: addr = prev_addr +1 
			  WRITE_ADDR_2,  // offset: addr = prev_addr +424 
			  WRITE_ADDR_3,  // offset: addr = rcolpt
			  WRITE_ADDR_4,  // offset: addr = rrowpt
                          WRITE_READY
			 } state_type;

state_type curr_read_state, next_read_state, curr_write_state, next_write_state;

// register output
reg next_r_ready;
reg next_w_ready;
reg n_done;

// next read write address
reg [31:0] n_raddr;
reg [31:0] n_waddr;

// window pointers
reg [31:0] n_rrowpt, rrowpt;
reg [31:0] n_rcolpt, rcolpt;
reg [31:0] n_wpt, wpt;

// read address counter
reg [2:0] rct1, n_rct1;
reg [2:0] rct2, n_rct2;
reg [15:0] rct3, n_rct3;

// write address counter
reg [1:0] wct1, n_wct1;
reg [1:0] wct2, n_wct2;
reg [15:0] wct3, n_wct3;



wire [8:0] boundary_1;
wire [8:0] boundary_2;
wire [8:0] boundary_3;

assign boundary_1 = i_img_width - 2;
assign boundary_2 = i_img_width - 4;
assign boundary_3 = i_img_width - 4;


// output registers
always_ff @(posedge clk, negedge n_rst)
begin
	if (n_rst == 0) begin
		o_raddr <= i_init_raddr;
		o_waddr <= i_init_waddr-1;
		o_r_ready <= 1'b0;
		o_w_ready <= 1'b0;
		o_done <= 1'b0;
	end else begin
		o_raddr <= n_raddr;
		o_waddr <= n_waddr;
		o_r_ready <= next_r_ready;
		o_w_ready <= next_w_ready;
		o_done <= n_done;
	end
end

// window pointers registers
always_ff @(posedge clk, negedge n_rst)
begin
	if (n_rst == 0) begin
		rrowpt <= 32'b0;
		rcolpt <= 32'b0;
		wpt <= 32'b0;
	end else begin
		rrowpt <= n_rrowpt;
		rcolpt <= n_rcolpt;
		wpt <= n_wpt;
	end
end

// read address counter registers
always_ff @ (posedge clk, negedge n_rst)
begin
	if (n_rst == 0) begin
		rct1 <= 3'b0;
		rct2 <= 3'b1;
		rct3 <= 15'd3;
	end else begin
		rct1 <= n_rct1;
		rct2 <= n_rct2;
		rct3 <= n_rct3;
	end
end

// write address counter registers
always_ff @ (posedge clk, negedge n_rst)
begin
	if (n_rst == 0) begin
		wct1 <= 2'b0;
		wct2 <= 2'b1;
		wct3 <= 15'd3;
	end else begin
		wct1 <= n_wct1;
		wct2 <= n_wct2;
		wct3 <= n_wct3;
	end
end


// READ address counter FSM
always_ff @(posedge clk, negedge n_rst)
begin
	if (n_rst == 0) begin
		curr_read_state <= RIDLE;
	end else begin
		curr_read_state <= next_read_state;
	end
end

// READ address counter FSM next state logic
always_comb
begin
	next_read_state = curr_read_state;
	case (curr_read_state)
		RIDLE:
		begin		
			if (i_inc_raddr)
				next_read_state = R_CON_1;
			else
				next_read_state = RIDLE;
		end
		R_CON_1:
		begin
			if (rct1 == 3'd5)
				next_read_state = R_CON_2;
			else
				next_read_state = READ_ADDR_1;
		end
		R_CON_2:
		begin
			if (rct2 == 3'd5)
				next_read_state = R_CON_3;
			else
				next_read_state = READ_ADDR_2;
		end
		R_CON_3:
		begin
			if (rct3 == boundary_1)
				next_read_state = READ_ADDR_4;
			else
				next_read_state = READ_ADDR_3;
		end
		READ_ADDR_1:
		begin
			next_read_state = READ_READY;
		end
		READ_ADDR_2:
		begin
			next_read_state = READ_READY;
		end
		READ_ADDR_3:
		begin
			next_read_state = READ_READY;
		end
		READ_ADDR_4:
		begin
			next_read_state = READ_READY;
		end
		READ_READY:
		begin
			next_read_state = RIDLE;
		end
	endcase
end

// READ address counter FSM output logic
always_comb
begin
	n_raddr = o_raddr;
	n_rct1 = rct1;
	n_rct2 = rct2;
	n_rct3 = rct3;
	n_rrowpt = rrowpt;
	n_rcolpt = rcolpt;
	
	next_r_ready = 0;
	case (curr_read_state)
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
			n_rct3 = rct3 + 15'd3;
		end
		READ_ADDR_1:
		begin
			n_raddr = o_raddr + 1;
		end
		READ_ADDR_2:
		begin
			n_raddr = o_raddr + boundary_2;
			n_rct1 = 1;
		end
		READ_ADDR_3:
		begin
			n_raddr = rcolpt;
			n_rct1 = 1;
			n_rct2 = 1;
		end
		READ_ADDR_4:
		begin
			n_raddr = rrowpt;
			n_rct1 = 1;
			n_rct2 = 1;
			n_rct3 = 3;
		end
		READ_READY:
		begin
			if (rct1 == 1 && rct2 == 1)
				n_rcolpt = o_raddr + 3;
			else
				n_rcolpt = rcolpt;

			if (rct1 == 1 && rct2 == 4 && rct3 == 3)
				n_rrowpt = o_raddr;
			else
				n_rrowpt = rrowpt;
			next_r_ready = 1;
		end
	endcase
end



// Write address counter FSM
always_ff @(posedge clk, negedge n_rst)
begin
	if (n_rst == 0) begin
		curr_write_state <= WIDLE;
	end else begin
		curr_write_state <= next_write_state;
	end
end

// WRITE address counter FSM next state logic
always_comb
begin
	next_write_state = curr_write_state;
	case (curr_write_state)
		WIDLE:
		begin
			if (i_inc_waddr)
				next_write_state = W_CON_1;
			else
				next_write_state = WIDLE;
		end
		W_CON_1:
		begin
			if (wct1 == 2'd3)
				next_write_state = W_CON_2;
			else
				next_write_state = WRITE_ADDR_1;
		end
		W_CON_2:
		begin
			if (wct2 == 2'd3)
				next_write_state = W_CON_3;
			else
				next_write_state = WRITE_ADDR_2;
		end
		W_CON_3:
		begin
			if (wct3 == boundary_1)
				next_write_state = WRITE_ADDR_4;
			else
				next_write_state = WRITE_ADDR_3;
		end
		WRITE_ADDR_1:
		begin
			next_write_state = WRITE_READY;
		end
		WRITE_ADDR_2:
		begin
			next_write_state = WRITE_READY;
		end
		WRITE_ADDR_3:
		begin
			next_write_state = WRITE_READY;
		end
		WRITE_ADDR_4:
		begin
			next_write_state = WRITE_READY;
		end
		WRITE_READY:
		begin
			next_write_state = WIDLE;
		end
	endcase
end

// WRITE address counter FSM output logic
always_comb
begin
	n_waddr = o_waddr;
	n_wct1 = wct1;
	n_wct2 = wct2;
	n_wct3 = wct3;
	n_wpt = wpt;
	next_w_ready = 0;
	n_done = 0;

	case (curr_write_state)
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
			n_wct3 = wct3 + 15'd3;
		end
		WRITE_ADDR_1:
		begin
			n_waddr = o_waddr + 1;
		end
		WRITE_ADDR_2:
		begin
			n_waddr = o_waddr + boundary_3;
			n_wct1 = 1;
		end
		WRITE_ADDR_3:
		begin
			n_waddr = wpt;
			n_wct1 = 1;
			n_wct2 = 1;
		end
		WRITE_ADDR_4:
		begin
			n_waddr = o_waddr + 1;
			n_wct1 = 1;
			n_wct2 = 1;
			n_wct3 = 3;
		end
		WRITE_READY:
		begin
			if (wct1 == 1 && wct2 == 1)
				n_wpt = o_waddr + 3;
			else
				n_wpt = wpt;
			if (o_waddr == i_img_size)
				n_done = 1;
			next_w_ready = 1;
		end
	endcase
end


endmodule


