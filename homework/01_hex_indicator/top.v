module top #(
	parameter MAX_VAL = 16'h002b
)(
    input CLK,

    output DS_EN1, DS_EN2, DS_EN3, DS_EN4,
    output DS_A, DS_B, DS_C, DS_D, DS_E, DS_F, DS_G
);


wire [3:0] anodes;
assign {DS_EN1, DS_EN2, DS_EN3, DS_EN4} = ~anodes;

wire [6:0] segments;
assign {DS_A, DS_B, DS_C, DS_D, DS_E, DS_F, DS_G} = segments;

/*
*  Make an instance of clock divider that will drive dynamic indication
*/

/*
*	Make another instance of clock divider that will drive counter with required frequency
*/

/*
*	Make instance of counter that will count up to MAX_VAL increasing it's value every 0.1 sec
*/

/*
*   Make an instance of hex display driver (hex_display) here.
*   Connect 'anodes', 'segments', 'data' to corresponding wires in current
*   module.
*/

endmodule