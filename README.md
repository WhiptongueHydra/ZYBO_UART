# ZYBO UART
Testing pure PL UART driver for the pmodUSBUART on zybo z7-20. Really simple test just to validate my logic, and zybo doesnt have loads of switches, or seven seg decoder, to do custom data. Will eventually add a RAM I think to rattle off loads of data in chunks for a more interesting test.  
<img width="851" height="682" alt="image" src="https://github.com/user-attachments/assets/1c776170-1378-4e3a-81b3-7b4bfa4a2a85" />


## pmodUSBUART Pins
Tx of FPGA -> Rx of this module 
Rx of FPGA -> Tx of this module 

<img width="441" height="421" alt="image" src="https://github.com/user-attachments/assets/0c653674-53b2-4723-9461-c6f09cda6427" />

## pmod Connector 
Say we are looking into a pmod connector head on, it matches the below pinout rotated 90 degrees clockwise. i.e.,

6  5  4 3 2 1  
12 11 10 9 8 7

<img width="763" height="213" alt="image" src="https://github.com/user-attachments/assets/21ae3659-3115-4b22-a713-492e869f4098" />
