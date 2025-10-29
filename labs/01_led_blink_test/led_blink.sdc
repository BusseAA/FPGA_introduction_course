create_clock -period 50MHz -name clk [get_ports clk]
derive_pll_clocks
derive_clock_uncertainty
set_false_path -from [get_registers {led*}] -to [get_ports {led*}]
