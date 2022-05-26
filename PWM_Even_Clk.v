`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2022 02:04:19 PM
// Design Name: 
// Module Name: PWM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

//PWM generated using Even clock divider 

module PWM_EVEN_CLK #( channel_width = 5)(

    input  rst,
    input  clk_even,
   
    output [channel_width - 1 : 0] pwm_even_clk
    
    );
    
reg [7:0] counter = 0;  



    
always @(posedge clk_even)
begin
    counter <= counter + 1;

end

//  Duty Cycle = counter / total value stored in the counter
// counter = (Duty Cycle * total value stored) /100
//         = (25*256)/100
//         = 64
  
// As per the need of Duty cycle the value of counter can be adjusted  

assign pwm_even_clk[0] = 0;  //  0% Duty Cycle
assign pwm_even_clk[1] = (counter < 64)? 1:0;  // 25% Duty Cycle
assign pwm_even_clk[2] = (counter < 128)? 1:0; // 50% Duty Cycle
assign pwm_even_clk[3] = (counter <192)? 1:0;  // 75% Duty Cycle
assign pwm_even_clk[4] = 1;  // 100% Duty cycle



endmodule