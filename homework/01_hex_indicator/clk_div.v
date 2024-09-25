module clk_div #(
	parameter DIVIDER = 2
)(
	input clk_in,
	output clk_out
);

	localparam BW_CNT = $clog2(DIVIDER);
	reg [BW_CNT-1: 0] cnt;
	/*
	* counter code and connect input/output
	*/
	
endmodule