`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/11/2022 09:24:54 PM
// Design Name: 
// Module Name: CLK_DIVIDER_TB
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


module CLK_DIVIDER_TB( );

reg clk_in;
reg rst;
reg [12-1 : 0]clk_divider_odd;
reg [12-1 : 0]clk_divider_even;
wire clk_out_odd;
wire clk_out_even;


CLK_DIVIDER DUT (
    .clk_in (clk_in),
    .clk_out_odd(clk_out_odd),
    .clk_out_even(clk_out_even),
    .clk_divider_odd(clk_divider_odd),
    .clk_divider_even(clk_divider_even),
    .rst(rst));

initial
begin
    rst <= 'b1;
    #50
    rst <= 'b0;
    clk_divider_odd <= 'd5;
    clk_divider_even <= 'd6;
end

always
begin
    clk_in <='b0; 
    #10
    clk_in <= 'b1;
    #10;
end


endmodule
