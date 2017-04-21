// $Id: $
// File name:   tb_AHB_wrapper.sv
// Created:     4/16/2017
// Author:      Paul Swartz
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: AHB_wrapper Testbench
`timescale 1ns/100ps
module tb_AHB_wrapper();
	localparam CLK_PERIOD=4;
	localparam WAIT=CLK_PERIOD/4;
	localparam INPUT="./docs/input.bmp";

	int temp;
	int in_ptr;
	int temp2;
	int i;
	reg[7:0] a;
	reg[7:0] b;
	reg[7:0] c;
	reg[7:0] d;

	reg tb_clk;
	reg tb_n_rst;
	reg tb_done;
	reg [31:0] tb_s_haddr;
	reg [31:0] tb_m_haddr;
	reg [31:0] tb_s_hrdata;
	reg [31:0] tb_m_hrdata;
	reg [31:0] tb_s_hwdata;
	reg [31:0] tb_m_hwdata;
	reg tb_s_hwrite;
	reg tb_m_hwrite;
	reg tb_s_hready;
	reg tb_m_hready;
	reg tb_re;
	reg tb_we;
	reg [31:0] tb_buffer2_data;
	reg [31:0] tb_greyscale_data;
	reg tb_read_complete;
	reg tb_write_complete;
	
	always begin
		tb_clk=0;
		#(CLK_PERIOD/2);
		tb_clk=1;
		#(CLK_PERIOD/2);
	end
	
	AHB_wrapper DUT 
	(
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.done(tb_done),
		.s_haddr(tb_s_haddr),
		.m_haddr(tb_m_haddr),
		.s_hrdata(tb_s_hrdata),
		.m_hrdata(tb_m_hrdata),
		.m_hwdata(tb_m_hwdata),
		.s_hwdata(tb_s_hwdata),
		.s_hwrite(tb_s_hwrite),
		.m_hwrite(tb_m_hwrite),
		.s_hready(tb_s_hready),
		.m_hready(tb_m_hready),
		.re(tb_re),
		.we(tb_we),
		.buffer2_data(tb_buffer2_data),
		.greyscale_data(tb_greyscale_data),
		.read_complete(tb_read_complete),
		.write_complete(tb_write_complete)
	);
		
	initial begin
		in_ptr=$fopen(INPUT,"r");
		$fseek(in_ptr, 0,0);

		tb_n_rst=0;
		tb_s_haddr=0;
		tb_m_hrdata=0;
		tb_s_hwdata=0;
		tb_s_hwrite=0;
		tb_m_hready=0;
		tb_re=0;
		tb_we=0;
		tb_buffer2_data=0;
	
		
		for(i=0;i<20000;i+=1)begin
			@(posedge tb_clk);
			#WAIT;
			tb_n_rst=1;
			@(posedge tb_clk);
			#WAIT;
			tb_s_hwrite=1;
			$fscanf(in_ptr,"%c",a);
			$fscanf(in_ptr,"%c",b);
			$fscanf(in_ptr,"%c",c);
			$fscanf(in_ptr,"%c",d);
			temp={a,b,c,d};
			tb_s_hwdata=temp;
			@(posedge tb_clk);
			#WAIT;
			tb_s_hwrite=0;
			@(posedge tb_clk);
			#WAIT;
			$fscanf(in_ptr,"%c",a);
			$fscanf(in_ptr,"%c",b);
			$fscanf(in_ptr,"%c",c);
			$fscanf(in_ptr,"%c",d);
			temp={a,b,c,d};
			tb_s_haddr=32'd1;
			tb_s_hwrite=1;
			tb_s_hwdata=temp;
			#(WAIT*2); 
			if(tb_s_hready != 1)
			$error("hready not set after img_width/img_height initialization");
			@(posedge tb_clk);
			#WAIT;
			tb_s_hwrite=0;
			@(posedge tb_clk);
			#WAIT;
			$fscanf(in_ptr,"%c",a);
			$fscanf(in_ptr,"%c",b);
			$fscanf(in_ptr,"%c",c);
			$fscanf(in_ptr,"%c",d);
			temp={a,b,c,d};
			tb_s_hwrite=1;
			tb_s_hwdata=temp;
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
			#WAIT;
			tb_re=1;
			@(posedge tb_clk);
			#WAIT;
			tb_re=0;
			@(posedge tb_clk);
			@(posedge tb_clk);
			#WAIT;
			tb_re=1;
			tb_m_hready=1;
			#(WAIT*2);
			temp=tb_m_haddr;
			@(posedge tb_clk);
			#WAIT;
			tb_re=0;
			tb_m_hready=0;
			@(posedge tb_clk);
			#WAIT;
			$fscanf(in_ptr,"%c",a);
			$fscanf(in_ptr,"%c",b);
			$fscanf(in_ptr,"%c",c);
			$fscanf(in_ptr,"%c",d);
			temp2={a,b,c,d};
			tb_m_hrdata=temp2;
			@(posedge tb_clk);
			#(WAIT);
			tb_m_hrdata=0;
			#(WAIT*2);
			if(tb_read_complete!=1)
				$error("read_complete not asserted after read");
			if(tb_greyscale_data != temp2)
				$error("incorrect output to greyscale");
			while(tb_m_haddr==temp)begin
				@(posedge tb_clk);
				#(WAIT*3);
			end
			@(posedge tb_clk);
			#WAIT;
			tb_m_hready=1;
			tb_re=1;
			#(WAIT*2);
			temp=tb_m_haddr;
			@(posedge tb_clk);
			#WAIT;
			tb_re=0;
			tb_m_hready=0;
			@(posedge tb_clk);
			#WAIT;
			$fscanf(in_ptr,"%c",a);
			$fscanf(in_ptr,"%c",b);
			$fscanf(in_ptr,"%c",c);
			$fscanf(in_ptr,"%c",d);
			temp2={a,b,c,d};
			tb_m_hrdata=temp2;
			@(posedge tb_clk);
			#(WAIT);
			tb_m_hrdata=0;
			#(WAIT*2);		
			if(tb_read_complete!=1)
				$error("read_complete not asserted on consecutive reads");
			if(tb_greyscale_data != temp2)
				$error("incorrect output to greyscale on consecutive read");
			while(tb_m_haddr==temp)begin
				@(posedge tb_clk);
				#(WAIT*3);
			end
			@(posedge tb_clk);
			#WAIT;
			tb_we=1;
			tb_m_hready=1;
			@(posedge tb_clk);
			#WAIT;
			tb_we=0;
			tb_m_hready=0;
			@(posedge tb_clk);
			@(posedge tb_clk);
			#WAIT;
			tb_we=1;
			tb_m_hready=1;
			#(WAIT*2);
			temp=tb_m_haddr;
			@(posedge tb_clk);
			#WAIT;
			tb_we=0;
			tb_m_hready=0;
			@(posedge tb_clk);
			#WAIT;
			$fscanf(in_ptr,"%c",a);
			$fscanf(in_ptr,"%c",b);
			$fscanf(in_ptr,"%c",c);
			$fscanf(in_ptr,"%c",d);
			temp2={a,b,c,d};
			tb_buffer2_data=temp2;
			@(posedge tb_clk);
			#WAIT;
			tb_buffer2_data=0;
			#(WAIT*2);
			if(tb_m_hwdata != temp2)
				$error("write transaction unsuccessful");
			while(temp == tb_m_haddr)begin
				@(posedge tb_clk);
				#(WAIT*3);
			end
			if(tb_write_complete !=1)
				$error("write_complete signal not asserted after successful write transaction");
			if(tb_m_hwrite !=1)
				$error("hwrite signal not asserted during write transaction");
			@(posedge tb_clk);
			#WAIT;
			tb_we =1;
			tb_m_hready=1;
			temp=tb_m_haddr;	
			@(posedge tb_clk);
			#WAIT;
			tb_we =0;
			tb_m_hready=0;
			@(posedge tb_clk);
			#WAIT;
			$fscanf(in_ptr,"%c",a);
			$fscanf(in_ptr,"%c",b);
			$fscanf(in_ptr,"%c",c);
			$fscanf(in_ptr,"%c",d);
			temp2={a,b,c,d};
			tb_buffer2_data=temp2;
			@(posedge tb_clk);
			#WAIT;
			tb_buffer2_data=0;
			#(WAIT*2);
			if(tb_m_hwdata != temp2)
				$error("consecutive write transaction not successful");
			while(temp== tb_m_haddr)begin
				@(posedge tb_clk);
				#(WAIT*3);
			end
			if(tb_write_complete != 1)
				$error("tb_write_complete not asserted after consecutive write");
			if(tb_m_hwrite !=1)
				$error("hwrite signal not asserted during write transaction");
			@(posedge tb_clk);
		end
	end
endmodule	
