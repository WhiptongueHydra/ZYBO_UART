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

# Tx Pins 
set_property PACKAGE_PIN W16 [get_ports tx]
set_property IOSTANDARD LVCMOS33 [get_ports tx]

# YOU FORGOT TO ADD RX PIN MONKEY
# Should be JE3
set_property PACKAGE_PIN J15 [get_ports rx]
set_property IOSTANDARD LVCMOS33 [get_ports rx]


## LED for if an 'a' is received from putty
# LED 0
set_property PACKAGE_PIN M14 [get_ports a_received_led]
set_property IOSTANDARD LVCMOS33 [get_ports a_received_led]

# LED 1
## LED for if there is a parity error
set_property PACKAGE_PIN M15 [get_ports rx_err_led]
set_property IOSTANDARD LVCMOS33 [get_ports rx_err_led]