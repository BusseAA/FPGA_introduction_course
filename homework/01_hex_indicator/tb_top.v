`timescale 1 ns / 100 ps

module tb_top();

reg clk = 1'b0;
initial begin
	forever begin
		#1 
		clk = ~clk;
	end
end	

wire DS_EN1, DS_EN2, DS_EN3, DS_EN4;
wire DS_A, DS_B, DS_C, DS_D, DS_E, DS_F, DS_G;
 
top top(
	.CLK(clk), 
	.DS_EN1(DS_EN1), .DS_EN2(DS_EN2), .DS_EN3(DS_EN3), .DS_EN4(DS_EN4), 
	.DS_A(DS_A), .DS_B(DS_B), .DS_C(DS_C), .DS_D(DS_D), .DS_E(DS_E), .DS_F(DS_F), .DS_G(DS_G)
);

endmodule