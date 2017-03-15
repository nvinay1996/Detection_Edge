// $Id: $
// File name:   tb_AHB.sv
// Created:     3/14/2017
// Author:      Paul Swartz
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: AHB testbench
`timescale 1ns / 100ps
module tb_AHB();
	localparam CLK_PERIOD = 10; //Not sure what clock rate to use.

	int data[4];
	int k;

	reg tb_clk;
	reg tb_n_rst;
	reg tb_hready;
	reg tb_re;
	reg tb_we;
	reg [31:0] tb_next_waddr;
	reg [31:0] tb_next_raddr;
	reg [31:0] tb_buffer2_data;
	reg [31:0] tb_sram_data;
	reg [31:0] tb_haddr;
	reg [31:0] tb_hrdata;
	reg [31:0] tb_hwdata;
	reg tb_read_complete;
	reg tb_hwrite;
	reg tb_write_complete;

	initial
	begin
		data[0] = 32'hFFFFFFFF;
		data[1] = 32'h00000000;
		data[2] = 32'hAAAAAAAA;
		data[3] = 32'h55555555; 
	end

	always
	begin
		tb_clk = 0;
		#(CLK_PERIOD/2);
		tb_clk = 1;
		#(CLK_PERIOD/2);
	end

	generate
		AHB DUT(.clk(tb_clk),.n_rst(tb_n_rst),.hready(tb_hready),.re(tb_re),.we(tb_we),.next_waddr(tb_next_waddr),.next_raddr(tb_next_raddr),.buffer2_data(tb_buffer2_data),.sram_data(tb_sram_data),.haddr(tb_haddr),.hrdata(tb_hrdata),.hwdata(tb_hwdata),.read_complete(tb_read_complete),.hwrite(tb_hwrite),.write_complete(tb_write_complete));
	endgenerate

	initial
	begin
		tb_n_rst = 0;
		tb_hready = 0;
		tb_re = 0;
		tb_we = 0;
		tb_next_waddr = 0;
		tb_next_raddr = 0;
		tb_buffer2_data = 0;
		tb_sram_data = 0;
		@(posedge tb_clk);
		#1;
		tb_n_rst = 1;	

		//BASIC WRITE CASES
		for(k=0;k<4;k+=1)
		begin
			tb_next_waddr=k;
			tb_buffer2_data=data[k];
			@(posedge tb_clk);
			#1;
			tb_we=1;
			@(posedge tb_clk);
			#1;
			tb_we=0;
			if(tb_haddr == k)
				$info("Correct haddr output on basic write case.");
			else
				$error("INCORRECT HADDR OUTPUT ON BASIC WRITE CASE.");
			if(tb_hwrite == 1)
				$info("Correct hwrite output on basic write case.");
			else
				$error("INCORRECT HWRITE OUTPUT ON BASIC WRITE CASE.");
			if(tb_hwdata == data[k])
				$info("Correct hwdata output on basic write case.");
			else
				$error("INCORRECT HWDATA OUTPUT ON BASIC WRITE CASE.");
			@(posedge tb_clk);
			#1;
			tb_hready=1;
			@(posedge tb_clk);
			#1;
			tb_hready=0;
			if(tb_write_complete)
				$info("Correct write_complete output on basic write case.");
			else
				$error("INCORRECT WRITE_COMPLETE OUTPUT ON BASIC WRITE CASE.");
			@(posedge tb_clk);
			#1;
		end	

		//BASIC READ CASES
		for(k=0;k<4;k+=1)
		begin
			tb_next_raddr=k;
			tb_sram_data=data[k];	
			@(posedge tb_clk);
			#1;
			tb_re=1;
			@(posedge tb_clk);
			#1;
			tb_re=0;
			if(tb_haddr == k)
				$info("Correct haddr output on basic read case.");
			else
				$error("INCORRECT HADDR OUTPUT ON BASIC READ CASE.");
			if(tb_hwrite == 0)
				$info("Correct hwrite output on basic read case.");
			else
				$error("INCORRECT HWRITE OUTPUT ON BASIC READ CASE.");
			if(tb_hrdata == data[k])
				$info("Correct hrdata output on basic read case.");
			else
				$error("INCORRECT HRDATA OUTPUT ON BASIC READ CASE.");
			@(posedge tb_clk);
			#1;
			tb_hready=1;
			@(posedge tb_clk);
			#1;
			tb_hready=0;
			if(tb_read_complete)
				$info("Correct read_complete output on basic read case.");
			else
				$error("INCORRECT READ_COMPLETE OUTPUT ON BASIC READ CASE.");
			@(posedge tb_clk);
			#1;
		end

		//WRITE WITHOUT WAIT STATES
		for(k=0;k<4;k+=1)
		begin
			tb_next_waddr=k;
			tb_buffer2_data=data[k];
			@(posedge tb_clk);
			#1;
			tb_we=1;
			@(posedge tb_clk);
			#1;
			tb_we=0;
			if(tb_haddr == k)
				$info("Correct haddr output on write case without wait states.");
			else
				$error("INCORRECT HADDR OUTPUT ON WRITE CASE WITHOUT WAIT STATES.");
			if(tb_hwrite == 1)
				$info("Correct hwrite output on write case without wait states.");
			else
				$error("INCORRECT HWRITE OUTPUT ON WRITE CASE WITHOUT WAIT STATES.");
			if(tb_hwdata == data[k])
				$info("Correct hwdata output on write case without wait states.");
			else
				$error("INCORRECT HWDATA OUTPUT ON WRITE CASE WITHOUT WAIT STATES.");
			@(posedge tb_clk);
			#1;
			tb_hready=1;
			@(posedge tb_clk);
			#1;
			tb_hready=0;
			if(tb_write_complete)
				$info("Correct write_complete output on write case without wait states.");
			else
				$error("INCORRECT WRITE_COMPLETE OUTPUT ON WRITE CASE WITHOUT WAIT STATES.");
			@(posedge tb_clk);
			#1;
		end	

		//READ WITHOUT WAIT STATES
		for(k=0;k<4;k+=1)
		begin
			tb_next_raddr=k;
			tb_sram_data=data[k];	
			@(posedge tb_clk);
			#1;
			tb_re=1;
			@(posedge tb_clk);
			#1;
			tb_re=0;
			if(tb_haddr == k)
				$info("Correct haddr output on read case without wait states.");
			else
				$error("INCORRECT HADDR OUTPUT ON READ CASE WITHOUT WAIT STATES.");
			if(tb_hwrite == 0)
				$info("Correct hwrite output on read case without wait states.");
			else
				$error("INCORRECT HWRITE OUTPUT ON READ CASE WITHOUT WAIT STATES.");
			if(tb_hrdata == data[k])
				$info("Correct hrdata output on read case without wait states.");
			else
				$error("INCORRECT HRDATA OUTPUT ON READ CASE WITHOUT WAIT STATES.");
			tb_hready=1;
			@(posedge tb_clk);
			#1;
			tb_hready=0;
			if(tb_read_complete)
				$info("Correct read_complete output on read case without wait states.");
			else
				$error("INCORRECT READ_COMPLETE OUTPUT ON READ CASE WITHOUT WAIT STATES.");
			@(posedge tb_clk);
			#1;
		end

		//ERROR TEST CASES
		for(k=0;k<2;k+=1)
		begin	
			tb_n_rst=0;
			if(k==0)
			begin
				tb_next_raddr=32'hFFFFFFFF;
				tb_next_waddr=32'hFFFFFFFF;
				tb_sram_data=32'hFFFFFFFF;
				tb_buffer2_data=32'hFFFFFFFF;
			end
			else 
			begin
				tb_next_raddr=32'h00000000;
				tb_next_waddr=32'h00000000;
				tb_sram_data=32'h00000000;
				tb_buffer2_data=32'h00000000;
			end	
			@(posedge tb_clk);
			#1;
			tb_n_rst=1;
			tb_hready=1;
			tb_re=1;
			@(posedge tb_clk);
			#1;
			if(!tb_read_complete && !tb_write_complete)
				$info("Correct response to erroroneous hready test case 1.");
			else
				$error("INCORRECT RESPONSE TO ERRONEOUS HREADY TEST CASE 1.");
			tb_hready=0;
			tb_n_rst=0;
			@(posedge tb_clk);
			#1;
			tb_n_rst=1;
			tb_hready=1;
			tb_we=1;
			@(posedge tb_clk);
			#1;
			if(!tb_read_complete && !tb_write_complete)
				$info("Correct reponse to erroneous hready test case 2.");
			else
				$error("INCORRECT RESPONSE TO ERRONEOUS HREADY TEST CASE 2.");
			tb_n_rst=0;
			@(posedge tb_clk);
			#1;
			tb_n_rst=1;
			tb_re=1;
			tb_we=1;
			@(posedge tb_clk);
			#1;
			if(tb_hwrite == 0)
				$info("Correct response to simultaneous read/write.");
			else
				$error("INCORRECT RESPONSE TO SIMULTANEOUS READ/WRITE.");
		end
	end
endmodule
