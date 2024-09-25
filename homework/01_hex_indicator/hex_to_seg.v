module hex_to_seg(
    input [3:0]data,

    output reg [6:0]segments
);

always @(*) begin
    case (data)          /* abcdefg */
        4'h0: segments = 7'b1111110;
        4'h1: segments = 7'b0110000;
        /*
        *   Write logic for missing digits (0x2-0xE) here.
        */
        4'hF: segments = 7'b1000111;
    endcase
end

endmodule