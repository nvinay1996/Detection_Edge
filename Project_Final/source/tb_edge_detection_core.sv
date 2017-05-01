// $Id: $
// File name:   tb_edge_detection_core.sv
// Created:     4/1/2017
// Author:      Paul Swartz
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: edge_detection_core testbench image input/output
`timescale 1ns/100ps
module tb_edge_detection_core();
	localparam INPUT="./docs/output_gray.bmp";
	localparam OUTPUT="./docs/output_edge.bmp";
	localparam IMG_SIZE=428*428;
	localparam CLK_PERIOD=4;
	localparam HEADER_SIZE=138;
	localparam IMG_WIDTH=428;		//Input image width
	localparam IMG_HEIGHT=428;		//Input image height

	reg tb_clk;
	reg tb_n_rst;
	reg [7:0] tb_i_m1;
	reg [7:0] tb_i_m2;
	reg [7:0] tb_i_m3;
	reg[7:0] tb_i_m4;
	reg[7:0] tb_i_m5;
	reg[7:0] tb_i_m6;
	reg[7:0] tb_i_m7;
	reg[7:0] tb_i_m8;
	reg[7:0] tb_i_m9;
	reg [7:0] tb_i_m10;
	reg[7:0] tb_i_m11;
	reg[7:0] tb_i_m12;
	reg[7:0] tb_i_m13;
	reg[7:0] tb_i_m14;
	reg[7:0] tb_i_m15;
	reg[7:0] tb_i_m16;
	reg[7:0] tb_i_m17;
	reg[7:0] tb_i_m18;
	reg[7:0] tb_i_m19;
	reg[7:0] tb_i_m20;
	reg[7:0] tb_i_m21;
	reg[7:0] tb_i_m22;
	reg[7:0] tb_i_m23;
	reg[7:0] tb_i_m24;
	reg[7:0] tb_i_m25;
	reg tb_i_gradient_start;
	reg tb_o_gradient_ready;
	reg[7:0] tb_o_processed_sum_1;
	reg[7:0] tb_o_processed_sum_2;
	reg[7:0] tb_o_processed_sum_3;
	reg[7:0] tb_o_processed_sum_4;
	reg[7:0] tb_o_processed_sum_5;
	reg[7:0] tb_o_processed_sum_6;
	reg[7:0] tb_o_processed_sum_7;
	reg[7:0] tb_o_processed_sum_8;
	reg[7:0] tb_o_processed_sum_9;

	int i;
	int j;
	reg[7:0] img_arr[IMG_SIZE*2];
	int in_ptr;
	int out_ptr;
	reg[7:0] temp;

	always
	begin
		tb_clk = 0;
		#(CLK_PERIOD/2);
		tb_clk = 1;
		#(CLK_PERIOD/2);
	end
	
	generate
		edge_detection_core DUT(.clk(tb_clk),.n_rst(tb_n_rst),.i_m1(tb_i_m1),.i_m2(tb_i_m2),.i_m3(tb_i_m3),.i_m4(tb_i_m4),.i_m5(tb_i_m5),.i_m6(tb_i_m6),.i_m7(tb_i_m7),.i_m8(tb_i_m8),.i_m9(tb_i_m9),.i_m10(tb_i_m10),.i_m11(tb_i_m11),.i_m12(tb_i_m12),.i_m13(tb_i_m13),.i_m14(tb_i_m14),.i_m15(tb_i_m15),.i_m16(tb_i_m16),.i_m17(tb_i_m17),.i_m18(tb_i_m18),.i_m19(tb_i_m19),.i_m20(tb_i_m20),.i_m21(tb_i_m21),.i_m22(tb_i_m22),.i_m23(tb_i_m23),.i_m24(tb_i_m24),.i_m25(tb_i_m25),.i_gradient_start(tb_i_gradient_start),.o_gradient_ready(tb_o_gradient_ready),.o_processed_sum_1(tb_o_processed_sum_1),.o_processed_sum_2(tb_o_processed_sum_2),.o_processed_sum_3(tb_o_processed_sum_3),.o_processed_sum_4(tb_o_processed_sum_4),.o_processed_sum_5(tb_o_processed_sum_5),.o_processed_sum_6(tb_o_processed_sum_6),.o_processed_sum_7(tb_o_processed_sum_7),.o_processed_sum_8(tb_o_processed_sum_8),.o_processed_sum_9(tb_o_processed_sum_9));
	endgenerate
	
	initial begin
		tb_n_rst=0;
		tb_i_gradient_start=0;
		@(posedge tb_clk);
		#1;
		tb_n_rst=1;
		tb_i_gradient_start=1;		

		in_ptr=$fopen(INPUT,"r");
		out_ptr=$fopen(OUTPUT,"w");
		for(i=0;i<HEADER_SIZE;i+=1)begin
			temp=$fgetc(in_ptr);
			$fwrite(out_ptr,"%c",temp);
		end
		
		for(i=0;i<IMG_SIZE;i+=1)begin
			img_arr[i]=$fgetc(in_ptr);
			$fseek(in_ptr,2,1);
		end

		tb_i_m1=img_arr[0];
		tb_i_m2=img_arr[1];
		tb_i_m3=img_arr[2];
		tb_i_m4=img_arr[3];
		tb_i_m5=img_arr[4];
		tb_i_m6=img_arr[IMG_WIDTH];
		tb_i_m7=img_arr[IMG_WIDTH+1];
		tb_i_m8=img_arr[IMG_WIDTH+2];
		tb_i_m9=img_arr[IMG_WIDTH+3];
		tb_i_m10=img_arr[IMG_WIDTH+4];
		tb_i_m11=img_arr[IMG_WIDTH*2];
		tb_i_m12=img_arr[IMG_WIDTH*2+1];
		tb_i_m13=img_arr[IMG_WIDTH*2+2];
		tb_i_m14=img_arr[IMG_WIDTH*2+3];
		tb_i_m15=img_arr[IMG_WIDTH*2+4];
		tb_i_m16=img_arr[IMG_WIDTH*3];
		tb_i_m17=img_arr[IMG_WIDTH*3+1];
		tb_i_m18=img_arr[IMG_WIDTH*3+2];
		tb_i_m19=img_arr[IMG_WIDTH*3+3];
		tb_i_m20=img_arr[IMG_WIDTH*3+4];
		tb_i_m21=img_arr[IMG_WIDTH*4];
		tb_i_m22=img_arr[IMG_WIDTH*4+1];
		tb_i_m23=img_arr[IMG_WIDTH*4+2];
		tb_i_m24=img_arr[IMG_WIDTH*4+3];
		tb_i_m25=img_arr[IMG_WIDTH*4+4];
		#2;
		i=0;
		while(i<=424)begin
			@(posedge tb_clk);
			#1;
			tb_i_gradient_start=0;
			#2;
			if(tb_o_gradient_ready)begin
				$info("data processed");
				img_arr[(i+1)*IMG_WIDTH+j+1+IMG_SIZE]=tb_o_processed_sum_1;
				img_arr[(i+1)*IMG_WIDTH+j+2+IMG_SIZE]=tb_o_processed_sum_2;
				img_arr[(i+1)*IMG_WIDTH+j+3+IMG_SIZE]=tb_o_processed_sum_3;
				img_arr[(i+2)*IMG_WIDTH+j+1+IMG_SIZE]=tb_o_processed_sum_4;
				img_arr[(i+2)*IMG_WIDTH+j+2+IMG_SIZE]=tb_o_processed_sum_5;
				img_arr[(i+2)*IMG_WIDTH+j+3+IMG_SIZE]=tb_o_processed_sum_6;
				img_arr[(i+3)*IMG_WIDTH+j+1+IMG_SIZE]=tb_o_processed_sum_7;
				img_arr[(i+3)*IMG_WIDTH+j+2+IMG_SIZE]=tb_o_processed_sum_8;
				img_arr[(i+3)*IMG_WIDTH+j+3+IMG_SIZE]=tb_o_processed_sum_9;
				j+=3;
				if(j>424)begin
					j=0;
					i+=3;
				end
				if(i<=424)begin
					@(posedge tb_clk);
					#1;
					tb_i_gradient_start=1;
					tb_i_m1=img_arr[i*IMG_WIDTH+j];
					tb_i_m2=img_arr[i*IMG_WIDTH+j+1];
					tb_i_m3=img_arr[i*IMG_WIDTH+j+2];
					tb_i_m4=img_arr[i*IMG_WIDTH+j+3];
					tb_i_m5=img_arr[i*IMG_WIDTH+j+4];
					tb_i_m6=img_arr[(i+1)*IMG_WIDTH+j+0];
					tb_i_m7=img_arr[(i+1)*IMG_WIDTH+j+1];
					tb_i_m8=img_arr[(i+1)*IMG_WIDTH+j+2];
					tb_i_m9=img_arr[(i+1)*IMG_WIDTH+j+3];
					tb_i_m10=img_arr[(i+1)*IMG_WIDTH+j+4];
					tb_i_m11=img_arr[(i+2)*IMG_WIDTH+j+0];
					tb_i_m12=img_arr[(i+2)*IMG_WIDTH+j+1];
					tb_i_m13=img_arr[(i+2)*IMG_WIDTH+j+2];
					tb_i_m14=img_arr[(i+2)*IMG_WIDTH+j+3];
					tb_i_m15=img_arr[(i+2)*IMG_WIDTH+j+4];
					tb_i_m16=img_arr[(i+3)*IMG_WIDTH+j+0];
					tb_i_m17=img_arr[(i+3)*IMG_WIDTH+j+1];
					tb_i_m18=img_arr[(i+3)*IMG_WIDTH+j+2];
					tb_i_m19=img_arr[(i+3)*IMG_WIDTH+j+3];
					tb_i_m20=img_arr[(i+3)*IMG_WIDTH+j+4];
					tb_i_m21=img_arr[(i+4)*IMG_WIDTH+j+0];
					tb_i_m22=img_arr[(i+4)*IMG_WIDTH+j+1];
					tb_i_m23=img_arr[(i+4)*IMG_WIDTH+j+2];
					tb_i_m24=img_arr[(i+4)*IMG_WIDTH+j+3];
					tb_i_m25=img_arr[(i+4)*IMG_WIDTH+j+4];	
				end
			end	
		end
		
		for(j=0;j<IMG_WIDTH;j+=1)begin
			$fwrite(out_ptr,"%c",8'd255);
			$fwrite(out_ptr,"%c",8'd255);
			$fwrite(out_ptr,"%c",8'd255);
		end	
		for(i=0;i<IMG_HEIGHT-2;i+=1)begin
			$fwrite(out_ptr,"%c",8'd255);
			$fwrite(out_ptr,"%c",8'd255);
			$fwrite(out_ptr,"%c",8'd255);
			for(j=0;j<IMG_WIDTH-2;j+=1)begin
				$fwrite(out_ptr,"%c",img_arr[i*IMG_WIDTH+j+IMG_SIZE]);
				$fwrite(out_ptr,"%c",img_arr[i*IMG_WIDTH+j+IMG_SIZE]);
				$fwrite(out_ptr,"%c",img_arr[i*IMG_WIDTH+j+IMG_SIZE]);
			end
			$fwrite(out_ptr,"%c",8'd255);
			$fwrite(out_ptr,"%c",8'd255);
			$fwrite(out_ptr,"%c",8'd255);
		end
		for(j=0;j<IMG_WIDTH;j+=1)begin
			$fwrite(out_ptr,"%c",8'd255);
			$fwrite(out_ptr,"%c",8'd255);
			$fwrite(out_ptr,"%c",8'd255);
		end
		$fclose(out_ptr);
		$fclose(in_ptr);
		$info("DONE");
	end
endmodule
