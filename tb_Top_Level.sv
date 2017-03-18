// $Id: $
// File name:   tb_Top_Level.sv
// Created:     3/16/2017
// Author:      Paul Swartz
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: Top Level Testbench

`timescale 1ns/10ps

module tb_Top_Level(); 				//Not sure what to name this
	localparam CLK_PERIOD=4;  
	localparam IMG_WIDTH=602;		//Input image width
	localparam IMG_HEIGHT=602;		//Input image height
	localparam WINDOW_WIDTH=5;
	localparam WINDOW_HEIGHT=5;	
	localparam INPUT="./docs/input.bmp";
	localparam OUTPUT="./docs/output.bmp";	
	localparam HEADER_BYTES=138;
	
	typedef struct{
		char red;
		char green;
		char blue;
		char unused;
	} RGB;
	
	int i;
	int j;
	int k;
	int n;
	int m;
	RGB next_read;
	int in_ptr;
	int out_ptr;
	int count;
	int useless;
	char temp;
	
	reg tb_clk;
	reg tb_n_reset;
	reg tb_hrdata;
	reg tb_hready;
	reg tb_haddr;
	reg tb_hwdata;
	reg tb_hwrite;
	
	always begin
		tb_clk=0;
		#(CLK_PERIOD/2);
		tb_clk=1;
		#(CLK_PERIOD/2);
	end
	
	generate 
		Top_Level DUT(.clk(tb_clk),.n_rst(tb_n_rst),.hrdata(tb_hrdata),.hready(tb_hready),.haddr(tb_haddr),.hwdata(tb_hwdata),.hwrite(tb_hwrite));
	endgenerate

	initial begin
		//INITIALIZE
		count=0;
		next_read.unused=0;
		tb_n_reset=0;
		tb_hrdata=0;
		tb_hready=0;
		@(posedge tb_clk);
		#1;
		tb_n_reset=1;
		#2;
		in_ptr=$fopen(INPUT,"r");
		out_ptr=$fopen(OUTPUT,"w");
		$fseek(out_ptr,0,0);

		//CREATE OUTPUT BMP HEADER
		for(i=0;i<HEADER_BYTES;i+=1) begin
			if(i==2)
				$fwrite(out_ptr,"%d",(IMAGE_HEIGHT-2)*(IMAGE_WIDTH-2)*3+HEADER_BYTES);		//File size (bytes)
				i+=3;
			else if(i==18)
				$fwrite(out_ptr,"%d",IMAGE_WIDTH-2);						//Image width (pixels)
				i+=3;
			else if(i==22)
				$fwrite(out_ptr,"%d",IMAGE_HEIGHT-2);						//Image height (pixels)
				i+=3;
			else if(i==34)
				$fwrite(out_ptr,"%d",(IMAGE_HEIGHT-2)*(IMAGE_WIDTH-2)*3);			//Image size (bytes)
				i+=3;
			else begin
				$fseek(in_ptr,i,0);								//Copy input header byte to output header
				useless=$fscanf(in_ptr,"%c",temp);
				$fwrite(out_ptr,"%c",temp);
			end
		end

		//READ/WRITE DATA IN CONVENIENT ORDER
		for(i=0;i<(IMG_HEIGHT-2)/(WINDOW_HEIGHT-2);i+=1) begin 					//This loop increments the vertical window position
			for(j=0;j<(IMG_WIDTH-2)/(WINDOW_WIDTH-2);j+=1) begin 				//This loop increments the horizontal window position
				for(k=0;k<WINDOW_HEIGHT;k+=1) begin 					//This loop increments the vertical pixel position 
					for(n=0;k<WINDOW_WIDTH;n+=1) begin 				//This loop increments the horizontal pixel position
						$fseek(in_ptr,(n+k*IMG_WIDTH+j*(WINDOW_WIDTH-2)+i*(WINDOW_HEIGHT-2)*IMG_WIDTH)*3+HEADER_BYTES,0); //Set input file pointer to the next appropriate pixel to be read from the file 
						useless=$fscanf(in_ptr,"%c",next_read.red); 			//Read in the next 24 bits from the input file
						useless=$fscanf(in_ptr,"%c",next_read.green);
						useless=$fscanf(in_ptr,"%c",next_read.blue);
						while(0==tb_haddr||tb_hwrite) begin			//While read is NOT occurring or write IS occurring...
							if(tb_hwrite) begin				//Check if write is occuring
								@(posedge tb_clk);			
								#1;
								tb_hready=1;				//hready indicates that the data has been written
								#2;					//Wait extra time before sampling input data		
								$fwrite(out_ptr,"%c",tb_hwdata[23:16]);		//Write greyscaled data to output file
								$fwrite(out_ptr,"%c",tb_hwdata[15:8]);
								$fwrite(out_ptr,"%c",tb_hwdata[7:0]);
								count+=1;				//This counter counts total pixels written to output file
							end
							@(posedge tb_clk);
							#1;
							tb_hready=0;
							#2;
						end		
						tb_hrdata=next_read;					//Next data to be sent to the ASIC is put on data bus
						@(posedge tb_clk);
						#1;
						tb_hready=1;						//hready indicates that the data can now be read
						@(posedge tb_clk);
						#1;
						tb_hready=0;	
					end
				end
			end
		end

		//FINISH WRITING
		while(count!=(IMAGE_WIDTH-2)*(IMAGE_HEIGHT-2)) begin			//Keep writing data to the output file until all the pixels have been written 
			if(tb_hwrite) begin						//This block of code is identical to the one a few lines above
				@(posedge tb_clk);
				#1;
				tb_hready=1;
				#2;
				$fwrite(out_ptr,"%c",tb_hwdata[23:16]);
				$fwrite(out_ptr,"%c",tb_hwdata[15:8]);
				$fwrite(out_ptr,"%c",tb_hwdata[7:0]);
				count+=1;
			end
			@(posedge tb_clk);
			#1;
			tb_hready=0;
			#2;
		end
		$fclose(in_ptr);
		$fclose(out_ptr);
	end
endmodule
