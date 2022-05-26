# Pulse-Width-Modulation
PWM implementation in FPGA.

Based on the clock divider given in the testbech, the code generates two separate clocks.
It features different blocks for creating output clocks dependent on the values of your input clock divider.
Even and odd numbers are possible for the clock divder.
A PWM is generated using this output clock.


The simulation was run on zedboard. 


The generated even and odd clocks where then fed into two separate modules to generaet the PWM. 

The PWM can be varied according to the Duty Cycle requirement. And it can be changed in the respective PWM modules.
