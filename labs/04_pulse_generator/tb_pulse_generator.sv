module tb_pulse_generator();

    parameter P_CLK_PER_PULSE = 4;
    parameter P_PULSE_CNT = 3;

    localparam PW_PULSE_IDX = $clog2(P_PULSE_CNT);

    reg clk = 1'b0;
    reg i_start = 1'b0;

    wire o_pulse;
    wire [PW_PULSE_IDX-1: 0] o_pulse_idx;

    pulse_generator #(
        .P_CLK_PER_PULSE(4),
        .P_PULSE_CNT(3)
    ) DUT (
        .clk(clk),
        .i_start(i_start),
        .o_pulse(o_pulse),
        .o_pulse_idx(o_pulse_idx)
    );

    initial begin
        forever #1 clk = ~clk;
    end

    initial begin
        repeat(3) @(posedge clk);

        i_start <= 1'b1;
        @(posedge clk);
        i_start <= 1'b0;

        #1000;
        $finish();
    end

endmodule
