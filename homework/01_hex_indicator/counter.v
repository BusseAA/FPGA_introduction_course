module counter #(
	parameter MAX_VAL = 2
)(
	input clk,
	output val
);

localparam BW_CNT = $clog2(MAX_VAL+1);
reg [BW_CNT-1: 0] cnt;

/*
*	counter code and input/output connection
*/

endmodule