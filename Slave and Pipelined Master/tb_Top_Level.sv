// $Id: $
// File name:   tb_Top_Level.sv
// Created:     3/16/2017
// Author:      Paul Swartz
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: Top Level Testbench

`timescale 1ns/100ps

module tb_Top_Level(); 				
	localparam CLK_PERIOD=4;  
	localparam INPUT="./docs/input.bmp";
	localparam OUTPUT="./docs/output.bmp";
	localparam WAIT=CLK_PERIOD/4;

	int in_ptr;
	int out_ptr;
	reg[7:0] HEADER_BYTES;	
	reg[15:0] IMG_WIDTH;
	reg[15:0] IMG_HEIGHT;
	int useless;
	int j;
	int i;
	int k;
	reg[7:0] img_arr[2500*2500*3*4];	//MAX IMAGE SIZE IS 2500x2500
	reg[7:0] temp;
	reg[7:0] temp2;
	int write_flag;
	int write_start;	
	int prev_haddr;
	int xpadding;
	int ypadding;

	reg tb_clk;
	reg tb_n_rst;
	reg [31:0] tb_m_hrdata;
	reg [31:0] tb_s_hrdata;
	reg tb_m_hready;
	reg tb_s_hready;
	reg [31:0] tb_m_haddr;
	reg [31:0] tb_s_haddr;
	reg [31:0] tb_m_hwdata;
	reg [31:0] tb_s_hwdata;
	reg tb_m_hwrite;
	reg tb_s_hwrite;
	
	always begin
		tb_clk=0;
		#(CLK_PERIOD/2);
		tb_clk=1;
		#(CLK_PERIOD/2);
	end
	
	Top_Level DUT
	(
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.m_hrdata(tb_m_hrdata),
		.s_hrdata(tb_s_hrdata),
		.m_hready(tb_m_hready),
		.s_hready(tb_s_hready),
		.m_haddr(tb_m_haddr),
		.s_haddr(tb_s_haddr),
		.m_hwdata(tb_m_hwdata),
		.s_hwdata(tb_s_hwdata),
		.m_hwrite(tb_m_hwrite),	
		.s_hwrite(tb_s_hwrite)
	);

	initial begin
		tb_n_rst=0;
		tb_m_hrdata=0;
		tb_m_hready=0;
		tb_s_haddr=0;
		tb_s_hwdata=0;
		tb_s_hwrite=0;
		prev_haddr=40;
		write_flag=0;
		@(posedge tb_clk);
		#WAIT;
		tb_n_rst=1;
		#(WAIT*2);
		in_ptr=$fopen(INPUT,"r");
		out_ptr=$fopen(OUTPUT,"w");
		$fseek(in_ptr,10,0);
		useless=$fscanf(in_ptr,"%c",HEADER_BYTES);
		$fseek(in_ptr,18,0);
		useless=$fscanf(in_ptr,"%c",temp);
		useless=$fscanf(in_ptr,"%c",temp2);
		IMG_WIDTH={temp2,temp};
		xpadding=(IMG_WIDTH-8)%12;
		IMG_WIDTH=IMG_WIDTH-xpadding;
		$fseek(in_ptr,22,0);
		useless=$fscanf(in_ptr,"%c",temp);
		useless=$fscanf(in_ptr,"%c",temp2);
		IMG_HEIGHT={temp2,temp};
		ypadding=(IMG_HEIGHT-2)%3;
		IMG_HEIGHT=IMG_HEIGHT-ypadding;
		$info("%d, %d",IMG_WIDTH,IMG_HEIGHT);
		$fseek(out_ptr,0,0);
		$fseek(in_ptr,0,0);

		for(i=0;i<HEADER_BYTES;i+=1)begin
			useless=$fscanf(in_ptr,"%c",temp);
			$fwrite(out_ptr,"%c",temp);
		end
	
		for(i=3;i<(1+IMG_HEIGHT*IMG_WIDTH)*3;i+=1)begin
			img_arr[i]=$fgetc(in_ptr);
		end
		$fclose(in_ptr);
	
		@(posedge tb_clk);
		#WAIT;
		tb_n_rst=1;
		@(posedge tb_clk);
		#WAIT;
		tb_s_hwrite=1;
		tb_s_hwdata={IMG_WIDTH,IMG_HEIGHT};
		@(posedge tb_clk);
		#WAIT;
		tb_s_hwrite=0;
		@(posedge tb_clk);
		#WAIT;
		tb_s_haddr=32'd1;
		tb_s_hwrite=1;
		tb_s_hwdata=32'd1;
		#(WAIT*2); 
		if(tb_s_hready != 1)
		$error("hready not set after img_width/img_height initialization");
		@(posedge tb_clk);
		#WAIT;
		tb_s_hwrite=0;
		@(posedge tb_clk);
		#WAIT;
		tb_s_hwrite=1;
		tb_s_hwdata=32'd200000;
		tb_s_haddr=32'd2;
		#(WAIT*2);
		if(tb_s_hready != 1)
			$error("hready not set after start_raddr initialization");
		@(posedge tb_clk);
		#WAIT;
		tb_s_hwrite=0;
		@(posedge tb_clk);
		#(WAIT*3);
		if(tb_s_hready!=1)
			$error("hready not set after start_waddr initialization");
		if(tb_s_hrdata!=32'b11111111111111111111111111111111)
			$error("hrdata not set to busy after start_waddr initialization");
		@(posedge tb_clk);
		#(WAIT*3);

		i=0;
		while(i<(IMG_HEIGHT-2)*(IMG_WIDTH-2))begin
			if(tb_m_hwrite)begin
				prev_haddr=tb_m_haddr;
				if (write_flag ==0)begin
					write_start=tb_m_haddr;
				end
				write_flag=1;
				@(posedge tb_clk);
				#WAIT;
				tb_m_hready=1;
				#(WAIT*2);
				img_arr[prev_haddr*3]=tb_m_hwdata[23:16];
				img_arr[prev_haddr*3+1]=tb_m_hwdata[15:8];
				img_arr[prev_haddr*3+2]=tb_m_hwdata[7:0];
				i+=1;
			end
			else if(prev_haddr!=tb_m_haddr) begin
				prev_haddr=tb_m_haddr;
				@(posedge tb_clk);
				#WAIT;
				tb_m_hready=1;
				tb_m_hrdata={img_arr[tb_m_haddr*3],img_arr[tb_m_haddr*3+1],img_arr[tb_m_haddr*3+2],8'b0};
			end
			@(posedge tb_clk);
			#WAIT;
			tb_m_hready=0;
			#(WAIT*2);
		end
		
		for(j=0;j<IMG_WIDTH+xpadding;j+=1)begin
			$fwrite(out_ptr,"%c",8'd255);
			$fwrite(out_ptr,"%c",8'd255);
			$fwrite(out_ptr,"%c",8'd255);
		end	
		for(i=0;i<IMG_HEIGHT-2;i+=1)begin
			$fwrite(out_ptr,"%c",8'd255);
			$fwrite(out_ptr,"%c",8'd255);
			$fwrite(out_ptr,"%c",8'd255);
			for(j=0;j<IMG_WIDTH-2;j+=1)begin
				$fwrite(out_ptr,"%c",img_arr[3*(i*(IMG_WIDTH-2)+j)+write_start*3]);
				$fwrite(out_ptr,"%c",img_arr[3*(i*(IMG_WIDTH-2)+j)+1+write_start*3]);
				$fwrite(out_ptr,"%c",img_arr[3*(i*(IMG_WIDTH-2)+j)+2+write_start*3]);
			end
			for(k=0;k<=xpadding;k+=1)begin
				$fwrite(out_ptr,"%c",8'd255);
				$fwrite(out_ptr,"%c",8'd255);
				$fwrite(out_ptr,"%c",8'd255);
			end
		end
		for(k=0;k<=ypadding;k+=1)begin
			for(j=0;j<IMG_WIDTH+xpadding;j+=1)begin
				$fwrite(out_ptr,"%c",8'd255);
				$fwrite(out_ptr,"%c",8'd255);
				$fwrite(out_ptr,"%c",8'd255);
			end	
		end
		$info("DONE");
		$fclose(out_ptr);
	end
endmodule
