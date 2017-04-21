// $Id: $
// File name:   tb_grayscale.sv
// Created:     4/1/2017
// Author:      Paul Swartz
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: Grayscale Image Testbench
`timescale 1ns/100ps
module tb_grayscale();
	localparam CLK_PERIOD = 4; 
	localparam INPUT="./docs/input.bmp";
	localparam OUTPUT="./docs/output_gray.bmp";	
	localparam IMG_SIZE=428*428*3;
	localparam HEADER_SIZE=138;

	reg tb_clk;
	int i;
	reg tb_n_rst;
	reg tb_i_grayscale_start;
	reg[31:0] tb_i_RGB;
	reg tb_o_grayscale_data_ready;
	reg [7:0] tb_o_gray;	
	int in_ptr;
	int out_ptr;
	reg[7:0] img_arr[IMG_SIZE*2];
	reg[7:0] temp;
	
	always
	begin
		tb_clk = 0;
		#(CLK_PERIOD/2);
		tb_clk = 1;
		#(CLK_PERIOD/2);
	end
	
	generate
		grayscale DUT(.clk(tb_clk),.n_rst(tb_n_rst),.i_grayscale_start(tb_i_grayscale_start),.i_RGB(tb_i_RGB),.o_grayscale_data_ready(tb_o_grayscale_data_ready),.o_gray(tb_o_gray));
	endgenerate
	
	initial
	begin
		tb_n_rst=0;
		in_ptr=$fopen(INPUT,"r");
		out_ptr=$fopen(OUTPUT,"w");
		$fseek(in_ptr,0,0);
		$fseek(out_ptr,0,0);
		tb_i_grayscale_start=0;
		
		for(i=0;i<HEADER_SIZE;i+=1)begin
			temp=$fgetc(in_ptr);
			$fwrite(out_ptr,"%c",temp);
		end
		
		for(i=0;i<IMG_SIZE;i+=1)begin
			img_arr[i]=$fgetc(in_ptr);
		end

		@(posedge tb_clk);
		#1;	
		tb_n_rst=1;
		tb_i_grayscale_start=1;
		tb_i_RGB={8'd0,img_arr[0],img_arr[1],img_arr[2]};
		i=0;
		while(i<IMG_SIZE/3)begin
			@(posedge tb_clk);
			#1;
			tb_i_grayscale_start=0;
			#2;
			if(tb_o_grayscale_data_ready)begin
				img_arr[IMG_SIZE+i*3]=tb_o_gray;
				img_arr[IMG_SIZE+i*3+1]=tb_o_gray;
				img_arr[IMG_SIZE+i*3+2]=tb_o_gray;
				i+=1;
				if(i!=IMG_SIZE/3)begin
					@(posedge tb_clk);
					#1;
					tb_i_grayscale_start=1;
					tb_i_RGB={img_arr[i*3],img_arr[i*3+1],img_arr[i*3+2],8'b0};
				end
			end	
		end
		for(i=0;i<IMG_SIZE;i+=1)begin
			$fwrite(out_ptr,"%c",img_arr[i+IMG_SIZE]);
		end
		$fclose(out_ptr);
		$fclose(in_ptr);
		$info("DONE");
	end
endmodule
