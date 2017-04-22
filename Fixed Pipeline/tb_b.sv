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
	localparam WINDOW_WIDTH=5;		//5x5 pixel window
	localparam WINDOW_HEIGHT=5;	
	localparam INPUT="./docs/input.bmp";
	localparam OUTPUT="./docs/output.bmp";	
	localparam HEADER_BYTES=138;		//Bytes in BMP Header
	localparam PIX_SIZE=3;			//Bytes per pixel
	localparam WDATA_START=IMG_HEIGHT*IMG_WIDTH*PIX_SIZE+HEADER_BYTES;
	localparam INITIAL_ADDRESS=1;

	reg[7:0] img_arr[IMG_WIDTH*IMG_HEIGHT*2*PIX_SIZE+WDATA_START];	
	int i;
	int j;
	int k;
	int in_ptr;
	int out_ptr;
	int useless;
	reg[7:0] temp;
	reg[7:0] prev_haddr; //issue
				//write start
	
	reg tb_clk;
	reg tb_n_reset;
	reg[31:0] tb_hrdata;
	reg tb_hready;
	reg[31:0] tb_haddr;
	reg[31:0] tb_hwdata;
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
		Top_Level DUT(.clk(tb_clk),.n_rst(tb_n_reset),.hrdata(tb_hrdata),.hready(tb_hready),.haddr(tb_haddr),.hwdata(tb_hwdata),.hwrite(tb_hwrite),.stop(tb_stop),.done(tb_done));
	endgenerate

	initial begin
		//INITIALIZE
		tb_stop=1;
		tb_n_reset=0;
		tb_hrdata=0;
		tb_hready=0;
		prev_haddr=INITIAL_ADDRESS;
		@(posedge tb_clk);
		#1;
		tb_n_reset=1;
		tb_stop=0;		
		#2;
		in_ptr=$fopen(INPUT,"r");
		out_ptr=$fopen(OUTPUT,"w");
		$fseek(out_ptr,0,0);
		$fseek(in_ptr,0,0);	
			 				
		//CREATE OUTPUT BMP HEADER
		for(i=0;i<HEADER_BYTES;i+=1) begin
			useless=$fscanf(in_ptr,"%c",temp);
			$fwrite(out_ptr,"%c",temp);
		end

		//READ INPUT IMAGE INTO AN ARRAY
		for(j=0;j<IMG_HEIGHT;j+=1)begin
			for(i=0;i<IMG_WIDTH;i+=1)begin
				for(k=0;k<PIX_SIZE;k+=1)begin
					useless=$fscanf(in_ptr,"%c",temp);
					img_arr[(i+j*IMG_WIDTH)*PIX_SIZE+k]=temp;
				end	
			end
		end
	
		//READ/WRITE FROM/TO CHIP
		j=0;
		i=0;
		while(j<(IMG_HEIGHT-2)*(IMG_WIDTH-2))begin
			if(tb_haddr!=0)begin
				prev_haddr=tb_haddr;
				if(tb_hwrite)begin
					@(posedge tb_clk);
					#1;
					tb_hready=1;
					#2;
					j+=1;
					img_arr[tb_haddr*PIX_SIZE]=tb_hwdata[23:16];
					img_arr[tb_haddr*PIX_SIZE+1]=tb_hwdata[15:8];
					img_arr[tb_haddr*PIX_SIZE+2]=tb_hwdata[7:0];
					$info("write has occurred");
				end
				else begin
					@(posedge tb_clk);
					#1;
					tb_hready=1;
					tb_hrdata={8'b0,img_arr[tb_haddr*PIX_SIZE],img_arr[tb_haddr*PIX_SIZE+1],img_arr[tb_haddr*PIX_SIZE+2]};
					$info("read has occurred");
				end
			end
			@(posedge tb_clk);
			#1;
			tb_hready=0;
			#2;
		end
			
		//WRITE ARRAY TO OUTPUT FILE
		for(j=0;j<IMG_HEIGHT;j+=1)begin
			if(j==0||j==IMG_HEIGHT-1) begin
				for(i=0;i<IMG_WIDTH;i+=1)begin
					for(k=0;k<PIX_SIZE;k+=1)begin
						$fwrite(out_ptr,"%c",8'b0);
					end
				end
			end
			else begin
				for(i=0;i<IMG_WIDTH;i+=1)begin
					if(i==0||i==IMG_WIDTH-1)begin
						for(k=0;k<PIX_SIZE;k+=1)begin
							$fwrite(out_ptr,"%c",8'b0);	
						end
					end
					else begin
						for(k=0;k<PIX_SIZE;k+=1)begin
							$info("write has occured");
							$fwrite(out_ptr,"%c",img_arr[(i+j*IMG_WIDTH)*PIX_SIZE+k+WDATA_START]);
						end
					end	
				end
			end
		end
		$fclose(in_ptr);
		$fclose(out_ptr);
		$info("FINISHED");
	end
endmodule
