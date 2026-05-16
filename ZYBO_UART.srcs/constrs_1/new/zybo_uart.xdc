# Clock
create_clock -period 8.00 [get_ports clk]
set_property PACKAGE_PIN K17 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

# Rst pin
set_property PACKAGE_PIN K18 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]

# Start flag pin
set_property PACKAGE_PIN P16 [get_ports start_flag]
set_property IOSTANDARD LVCMOS33 [get_ports start_flag]

# PMIO Tx
# Arbitrary numbers I have set as looking into the pmod
# 1 2 3 4 5 6 
# 7 8 9 10 11 12

# It is pmod JE. Tx of the pmod is the third pin in from the right, so either
# Pin 4 or pin 10. Problem being the schematic doesnt tell you what the pin is.
# Tried JE3 = J15 pin, didnt work
# Tried JE9 = T17 pin, also didnt work

# Realised im an idiot, and meant to hook up Tx of FPGA to Rx of UART chip
# These are pins 5 and 11
# JE2 = W16, This is the one
# JE8 = U17, didnt work

set_property PACKAGE_PIN W16 [get_ports tx]
set_property IOSTANDARD LVCMOS33 [get_ports tx]