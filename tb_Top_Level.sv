// $Id: $
// File name:   tb_Top_Level.sv
// Created:     3/16/2017
// Author:      Paul Swartz
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: Top Level Testbench

`timescale 1ns/100ps

module tb_Top_Level(); 				//Not sure what to name this
	localparam CLK_PERIOD=4;  
	localparam IMG_WIDTH=428;		//Input image width
	localparam IMG_HEIGHT=428;		//Input image height
	localparam INPUT="./docs/input_airplane.bmp";
	localparam OUTPUT="./docs/output_airplane.bmp";	

	reg[7:0] img_arr[IMG_HEIGHT*IMG_WIDTH*3*4];
	int j;
	int i;
	int in_ptr;
	int out_ptr;
	int useless;
	reg[7:0] temp;
	int write_flag;
	int write_start;	
	int prev_haddr;

	reg tb_clk;
	reg tb_n_rst;
	reg [31:0] tb_hrdata;
	reg tb_hready;
	reg [31:0] tb_haddr;
	reg [31:0] tb_hwdata;
	reg tb_hwrite;
	reg tb_stop;
	reg tb_done;
	
	always begin
		tb_clk=0;
		#(CLK_PERIOD/2);
		tb_clk=1;
		#(CLK_PERIOD/2);
	end
	
	generate 
		Top_Level DUT(.stop(tb_stop),.done(tb_done),.clk(tb_clk),.n_rst(tb_n_rst),.hrdata(tb_hrdata),.hready(tb_hready),.haddr(tb_haddr),.hwdata(tb_hwdata),.hwrite(tb_hwrite));
	endgenerate

	initial begin
		//INITIALIZE
		tb_n_rst=0;
		tb_hrdata=0;
		tb_hready=0;
		write_flag=0;
		tb_stop=1;
		@(posedge tb_clk);
		#1;
		tb_n_rst=1;
		tb_stop=0;
		#2;
		in_ptr=$fopen(INPUT,"rb");
		out_ptr=$fopen(OUTPUT,"w");
		$fseek(out_ptr,0,0);
		$fseek(in_ptr,0,0);
	
		/*
		for(i=0;i<138;i+=1)begin
			useless=$fscanf(in_ptr,"%c",temp);
			$fwrite(out_ptr,"%c",temp);
		end
*/
		for(i=0;i<IMG_HEIGHT*IMG_WIDTH*3;i+=1)begin
			//useless=$fprintf(in_ptr,"%c",img_arr[i]);
			img_arr[i]=$fgetc(in_ptr);
		end
		$fclose(in_ptr);

		i=0;
		while(i<(IMG_HEIGHT-2)*(IMG_WIDTH-2)*3)begin
			if(prev_haddr != tb_haddr) begin
				prev_haddr=tb_haddr;
				if(tb_hwrite)begin
					if (write_flag ==0)begin
						$info("Write has occurred");
						write_start=tb_haddr;
					end
					write_flag=1;
					@(posedge tb_clk);
					#1;
					tb_hready=1;
					#2;
					img_arr[tb_haddr*3]=tb_hrdata[23:16];
					img_arr[tb_haddr*3+1]=tb_hrdata[15:8];
					img_arr[tb_haddr*3+2]=tb_hrdata[7:0];
					i+=1;
				end
				else begin
					$info("Read has occurred");
					@(posedge tb_clk);
					#1;
					tb_hready=1;
					tb_hrdata={8'b0,img_arr[tb_haddr*3],img_arr[tb_haddr*3+1],img_arr[tb_haddr*3+2]};
				end
			end
			@(posedge tb_clk);
			#1;
			tb_hready=0;
			#2;
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
				$fwrite(out_ptr,"%c",img_arr[3*(i*IMG_WIDTH+j)+write_start*3]);
				$fwrite(out_ptr,"%c",img_arr[3*(i*IMG_WIDTH+j)+1+write_start*3]);
				$fwrite(out_ptr,"%c",img_arr[3*(i*IMG_WIDTH+j)+2+write_start*3]);
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
		$info("DONE");
		$fclose(out_ptr);
	end
endmodule
