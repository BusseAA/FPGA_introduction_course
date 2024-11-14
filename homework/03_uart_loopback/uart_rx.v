module uart_rx #(
    parameter P_CLK_PER_BIT = 50000000/9600
)(
    input clk,
    input i_rxd,
    output [7: 0] o_data,
    output o_data_en
);
    // states defined as parameters for readability
    localparam PS_IDLE = 2'd0;
    localparam PS_START_BIT = 2'd1;
    localparam PS_DATA_BIT = 2'd2;
    localparam PS_STOP_BIT = 2'd3;

    reg [1: 0] r_state = PS_IDLE;
    reg [2: 0] r_bit_idx = 3'd0;

    // counter for waiting
    localparam PW_CNT = $clog2(P_CLK_PER_BIT);
    reg [PW_CNT-1: 0] r_cnt = {PW_CNT{1'b0}};

    // data storage
    reg [7: 0] r_data = 8'b0; // save receiving data to this register
    reg r_data_en = 1'b0;

    // state machine description
    always @(posedge clk) begin
        case (r_state)
            PS_IDLE: // waiting for the next start bit 
            begin
                if (i_rxd==1'b0) begin
                    // detected start bit
                    // go to the next state (PS_START_BIT)
                    // reset counter to 0
                end
            end
            
            PS_START_BIT: // wait half of bit period and go to the next state
            // using counter to wait
            // and when we counted up to P_CLK_PER_BIT/2 go to the next state
            begin
                if (r_cnt==(P_CLK_PER_BIT/2)-2) begin // -2 because zero indexation and 1 clock is already going
                    // we have waited for P_CLK_PER_BIT
                    // go to the next state (PS_DATA_BIT)
                    // reset counter and bit_idx to 0
                end
                else begin
                    // increment counter to wait
                end
            end

            PS_DATA_BIT: // wait bit period and sample
            begin
                if (r_cnt==P_CLK_PER_BIT-1) begin
                    // we have waited for P_CLK_PER_BIT
                    // reset counter to 0
                    // increment bit_idx
                    // its time to sample bit with r_bit_idx index

                    if (r_bit_idx==3'd7) begin
                        // last 7'th bit was received 
                        // go to the next state (PS_STOP_BIT)
                        // as last bit was receved we can raise r_data_en flag
                        // but don't forget to clear this flag 1 clk later (in PS_STOP_BIT_CLAUSE)
                    end
                end
                else begin
                    //increment counter to wait
                end
            end

            PS_STOP_BIT: // wait 1 bit period and go to IDLE
            begin
                if (r_cnt=={PW_CNT{1'b0}}) begin
                    // it's first clock in this clause (because we reset counter before at the same time we are going here)
                    // so we have to clear r_data_en flag here
                end
                if (r_cnt==P_CLK_PER_BIT-1) begin
                    // we've waited enough 
                    // and we can go to the IDLE state
                end
                else begin
                    // increment counter to wait
                end


            end
            
        endcase
    end
    
    assign o_data = r_data;
    assign o_data_en = r_data_en;

endmodule
    