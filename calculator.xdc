##############################
# CLOCK & RESET
##############################
set_property PACKAGE_PIN F14 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 25.000 -name sys_clk -waveform {0.000 10.000} [get_ports clk]

set_property PACKAGE_PIN J2 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]

##############################
# KEYPAD COLUMNS (OUTPUT)
##############################
set_property PACKAGE_PIN T6 [get_ports {col[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {col[0]}]

set_property PACKAGE_PIN T5 [get_ports {col[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {col[1]}]

set_property PACKAGE_PIN R5 [get_ports {col[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {col[2]}]

set_property PACKAGE_PIN T4 [get_ports {col[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {col[3]}]

##############################
# KEYPAD ROWS (INPUT)
##############################
set_property PACKAGE_PIN R7 [get_ports {row[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {row[0]}]

set_property PACKAGE_PIN P6 [get_ports {row[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {row[1]}]

set_property PACKAGE_PIN P5 [get_ports {row[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {row[2]}]

set_property PACKAGE_PIN R6 [get_ports {row[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {row[3]}]

##############################
# 7-SEGMENT DISPLAY
##############################
set_property PACKAGE_PIN D5 [get_ports {an[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]

set_property PACKAGE_PIN C4 [get_ports {an[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]

set_property PACKAGE_PIN C7 [get_ports {an[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]

set_property PACKAGE_PIN A8 [get_ports {an[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]

set_property PACKAGE_PIN D7 [get_ports {seg[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[0]}]

set_property PACKAGE_PIN C5 [get_ports {seg[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[1]}]

set_property PACKAGE_PIN A5 [get_ports {seg[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[2]}]

set_property PACKAGE_PIN B7 [get_ports {seg[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[3]}]

set_property PACKAGE_PIN A7 [get_ports {seg[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[4]}]

set_property PACKAGE_PIN D6 [get_ports {seg[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[5]}]

set_property PACKAGE_PIN B5 [get_ports {seg[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[6]}]

##############################
# TIMING CONSTRAINTS (DELAY)
##############################

# Input delays (2 lines per signal)
set_input_delay -clock [get_clocks sys_clk] -min 2.000 [get_ports {row[0]}]
set_input_delay -clock [get_clocks sys_clk] -max 10.000 [get_ports {row[0]}]

set_input_delay -clock [get_clocks sys_clk] -min 2.000 [get_ports {row[1]}]
set_input_delay -clock [get_clocks sys_clk] -max 10.000 [get_ports {row[1]}]

set_input_delay -clock [get_clocks sys_clk] -min 2.000 [get_ports {row[2]}]
set_input_delay -clock [get_clocks sys_clk] -max 10.000 [get_ports {row[2]}]

set_input_delay -clock [get_clocks sys_clk] -min 2.000 [get_ports {row[3]}]
set_input_delay -clock [get_clocks sys_clk] -max 10.000 [get_ports {row[3]}]

set_input_delay -clock [get_clocks sys_clk] -min 2.000 [get_ports rst]
set_input_delay -clock [get_clocks sys_clk] -max 10.000 [get_ports rst]

# Output delays (2 lines per signal)
set_output_delay -clock [get_clocks sys_clk] -min 2.000 [get_ports {col[0]}]
set_output_delay -clock [get_clocks sys_clk] -max 10.000 [get_ports {col[0]}]

set_output_delay -clock [get_clocks sys_clk] -min 2.000 [get_ports {col[1]}]
set_output_delay -clock [get_clocks sys_clk] -max 10.000 [get_ports {col[1]}]

set_output_delay -clock [get_clocks sys_clk] -min 2.000 [get_ports {col[2]}]
set_output_delay -clock [get_clocks sys_clk] -max 10.000 [get_ports {col[2]}]

set_output_delay -clock [get_clocks sys_clk] -min 2.000 [get_ports {col[3]}]
set_output_delay -clock [get_clocks sys_clk] -max 10.000 [get_ports {col[3]}]

# seg[0] to seg[6]
set_output_delay -clock [get_clocks sys_clk] -min 2.000 [get_ports {seg[0]}]
set_output_delay -clock [get_clocks sys_clk] -max 10.000 [get_ports {seg[0]}]

set_output_delay -clock [get_clocks sys_clk] -min 2.000 [get_ports {seg[1]}]
set_output_delay -clock [get_clocks sys_clk] -max 10.000 [get_ports {seg[1]}]

set_output_delay -clock [get_clocks sys_clk] -min 2.000 [get_ports {seg[2]}]
set_output_delay -clock [get_clocks sys_clk] -max 10.000 [get_ports {seg[2]}]

set_output_delay -clock [get_clocks sys_clk] -min 2.000 [get_ports {seg[3]}]
set_output_delay -clock [get_clocks sys_clk] -max 10.000 [get_ports {seg[3]}]

set_output_delay -clock [get_clocks sys_clk] -min 2.000 [get_ports {seg[4]}]
set_output_delay -clock [get_clocks sys_clk] -max 10.000 [get_ports {seg[4]}]

set_output_delay -clock [get_clocks sys_clk] -min 2.000 [get_ports {seg[5]}]
set_output_delay -clock [get_clocks sys_clk] -max 10.000 [get_ports {seg[5]}]

set_output_delay -clock [get_clocks sys_clk] -min 2.000 [get_ports {seg[6]}]
set_output_delay -clock [get_clocks sys_clk] -max 10.000 [get_ports {seg[6]}]
 
 
# an[0] to an[3]
set_output_delay -clock [get_clocks sys_clk] -min 2.000 [get_ports {an[0]}]
set_output_delay -clock [get_clocks sys_clk] -max 10.000 [get_ports {an[0]}]

set_output_delay -clock [get_clocks sys_clk] -min 2.000 [get_ports {an[1]}]
set_output_delay -clock [get_clocks sys_clk] -max 10.000 [get_ports {an[1]}]

set_output_delay -clock [get_clocks sys_clk] -min 2.000 [get_ports {an[2]}]
set_output_delay -clock [get_clocks sys_clk] -max 10.000 [get_ports {an[2]}]

set_output_delay -clock [get_clocks sys_clk] -min 2.000 [get_ports {an[3]}]
set_output_delay -clock [get_clocks sys_clk] -max 10.000 [get_ports {an[3]}]
