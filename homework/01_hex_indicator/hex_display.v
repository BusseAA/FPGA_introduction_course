module hex_display(
    input clk,
    input [15:0]data,

    output [3:0]anodes,
    output [6:0]segments
);

/*
*   Write logic for dynamic indication here.
*/

hex_to_seg hex_to_seg(.data(b), .segments(segments));

endmodule