module pulse_generator #(
    parameter P_CLK_PER_PULSE = 4,
    parameter P_PULSE_CNT = 3
)(
    input clk,
    input i_start,
    output o_pulse,
    output o_pulse_idx
);

    // counter, counting period between pulses
    localparam PW_CNT = $clog2(P_CLK_PER_PULSE);
    reg [PW_CNT-1: 0] r_cnt = {PW_CNT{1'b0}}; 
    
    // counter counting pulse index
    localparam PW_PULSE_IDX = $clog2(P_PULSE_CNT);
    reg [PW_PULSE_IDX-1: 0] r_pulse_idx = {PW_PULSE_IDX{1'b0}};

    always @(posedge clk) begin
        // state r_cnt==0 and r_pulse_idx==0 should be treated separately
        // in this state we are waiting for start condition
        if (r_cnt==0 && r_pulse_idx==0) begin 
            if (i_start) begin // wait for start condition and only then start counting
                r_cnt <= r_cnt + 1'b1;
            end
        end
        else begin
            // after we switched from r_cnt=0 to r_cnt=1 we are here

            // if we counted period then change index or manipulate some other data
            if (r_cnt==P_CLK_PER_PULSE-1) begin
                r_cnt <= {PW_CNT{1'b0}};
                if (r_pulse_idx==P_PULSE_CNT-1) begin
                    r_pulse_idx <= {PW_PULSE_IDX{1'b0}};
                    // actually you can not only change index 
                    // but manipulate any data that should change periodically
                end
                else begin
                    r_pulse_idx <= r_pulse_idx + 1'b1;
                    // actually you can not only change index
                    // but manipulate any data that should change periodically
                end
            end
            else begin
                r_cnt <= r_cnt + 1'b1;
            end
        end
    end

    assign o_pulse_idx = r_pulse_idx;

    // conditions for pulse
    // state r_cnt=0 and r_pulse_idx=0 is treated separately cause it corresponds to waiting
    assign o_pulse = (r_cnt==0 && r_pulse_idx==0 && i_start) || (r_cnt==0 && r_pulse_idx!=0);

endmodule
