module led_blink(
	input wire clk,
	output wire led1,
	output wire led2
);

	reg [23:0] cnt = 24'h0;

	always @(posedge clk) 
	begin
		cnt = cnt + 24'b1;
	end

	assign led1 = cnt[23];
	assign led2 = ~cnt[23];

endmodule