module edge_detection
(
  input wire clk,
  input wire n_rst,
  input wire i_gradient_start,
  input wire [7:0] P0,
  input wire [7:0] P1,
  input wire [7:0] P2,
  input wire [7:0] P3,
  input wire [7:0] P4,
  input wire [7:0] P5,
  input wire [7:0] P6,
  input wire [7:0] P7,
  input wire [7:0] P8,

  output reg o_gradient_data_ready,
  output reg [7:0] o_processed_sum

);

reg [8:0] A1;
reg [8:0] B1;
reg [8:0] C1;
reg [8:0] D1;
reg [8:0] E1;
reg signed [10:0] Gy;
reg signed [10:0] Gx;
reg signed [10:0] abs_Gy;
reg signed [10:0] abs_Gx;
reg [8:0] A2;
reg [8:0] B2;
reg [8:0] C2;
reg [8:0] D2;
reg [8:0] E2;
reg [10:0] temp_sum;


typedef enum bit [5:0] {I, Assign_Ax, Assign_Bx, Assign_Cx, Assign_Gx, Assign_Ex, Assign_Dx, Assign_Ay, Assign_By, Assign_Cy, Assign_Gy, Assign_Ey, Assign_Dy, Gx_neg, Gy_neg, Summ, Check} stateType;
stateType state;
stateType next_state;

always_ff @ (posedge n_rst, posedge clk)
begin
if(n_rst == 1'b0)
state <= I;
else
state <= next_state;
end

always_comb
begin
A1 = 0;
B1 = 0;
C1 = 0;
D1 = 0;
E1 = 0;
Gy = 0;
Gx = 0;
A2 = 0;
B2 = 0;
C2 = 0;
D2 = 0;
E2 = 0;
abs_Gx = 0;
abs_Gy = 0;
temp_sum = 0;
o_processed_sum = 0;
next_state = state;
case(state)
I: begin
	if(i_gradient_start == 1)
	next_state = Assign_Ax;
	else
	next_state = I;
end

Assign_Ax: begin
        A1 = {1'b0,P2} - {1'b0,P0};
	next_state = Assign_Bx;
end

Assign_Bx: begin
        B1 = {1'b0,P5} - {1'b0,P3};
	next_state = Assign_Cx;
end

Assign_Cx: begin
        C1 = B1 << 1'b1;
	next_state = Assign_Dx;
end

Assign_Dx: begin
        D1 = {1'b0,P8} - {1'b0,P6};
	next_state = Assign_Ex;
end

Assign_Ex: begin
	E1 = A1 + C1;
	next_state = Assign_Gx;
end

Assign_Gx: begin
	Gx = E1 + D1;
	next_state = Assign_Ay;
end

Assign_Ay: begin
        A2 = {1'b0,P0} - {1'b0,P6};
	next_state = Assign_By;
end

Assign_By: begin
        B2 = {1'b0,P1} - {1'b0,P7};
	next_state = Assign_Cy;
end

Assign_Cy: begin
        C2 = B2 << 1'b1;
	next_state = Assign_Dy;
end

Assign_Dy: begin
        D2 = {1'b0,P2} - {1'b0,P8};
	next_state = Assign_Ey;
end

Assign_Ey: begin
	E2 = A2 + C2;
	next_state = Assign_Gy;
end

Assign_Gy: begin
	Gy = E2 + D2;
	next_state = Gx_neg;
end

Gx_neg: begin
	if(Gx[10] == 1'b1)
	abs_Gx = ~Gx + 1;
        else
	abs_Gx = Gx;
	next_state = Gy_neg;
end

Gy_neg: begin
	if(Gy[10] == 1'b1)
	abs_Gy = ~Gy + 1;
        else
	begin
	abs_Gy = Gy;
	end
	next_state = Summ;
end

Summ : begin
	temp_sum = abs_Gx + abs_Gy;
end

Check: begin
	if(temp_sum[10] == 1 || temp_sum[9] == 1 || temp_sum[8] == 1)
	o_processed_sum = 8'b11111111;
	else
		o_processed_sum = temp_sum[7:0];
	next_state = I;

end

endcase
end

endmodule
