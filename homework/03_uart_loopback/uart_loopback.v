module uart_loopback(
    input clk,
    input i_rxd,
    output o_txd
);
    // synchronize rxd and txd 
    
    // create instance of uart_rx to receive data

    // create instance of uart_tx to transmit data

    // connect uart rx output to uart tx inputs so that
    // data received with rx is immidiately transmitted back using tx module.

endmodule