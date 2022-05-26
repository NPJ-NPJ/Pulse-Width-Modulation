`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/11/2022 08:37:33 PM
// Design Name: 
// Module Name: CLK_DIVIDER
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

// This module generates a even and odd clock signals based on the value of the clock divider provided


module CLK_DIVIDER #( range_clk_div = 12)(
    input clk_in,
    input rst,
    input [range_clk_div - 1 : 0] clk_divider_odd, //  The clock divider takes odd values 
    input [range_clk_div - 1 : 0] clk_divider_even, //  The clock divider takes odd values 
    output  clk_out_odd,
    output  clk_out_even
    
);

   
reg [range_clk_div - 1 : 0] pos_edge_counter; 
   
reg [range_clk_div - 1 : 0] neg_edge_counter; 

reg [range_clk_div - 1 : 0] counter; 

reg [range_clk_div - 1 : 0] counter_1; 

wire [range_clk_div - 1 : 0] counter_2; 

reg clk_gen;

   


always @ (posedge clk_in)
begin
    
    if(rst)
    begin
        pos_edge_counter <= 12'd0; 
    end 
    else if (pos_edge_counter == (clk_divider_odd - 1))
        begin
            pos_edge_counter <=12'd0;    
        end
    else        
        begin
            pos_edge_counter <= pos_edge_counter + 12'd1; 
        end
           
end
always @ (negedge clk_in)
begin
    
    if(rst)
    begin
        neg_edge_counter <= 12'd0; 
    end 
    else if (neg_edge_counter == (clk_divider_odd - 1))
        begin
            neg_edge_counter <=12'd0;    
        end
    else          
        begin
            neg_edge_counter <= neg_edge_counter + 12'd1; 
        end
           
end

assign clk_out_odd = ((pos_edge_counter > (clk_divider_odd >> 1)) | (neg_edge_counter > (clk_divider_odd >> 1)));


always @(posedge clk_in)
begin
    
    if(rst)
    begin
        counter_1 <= 12'd0; 
        clk_gen <= 1'b0;
    end else if( counter_2 == (clk_divider_even/2))
        begin
            counter_1 <= 12'd0;
            clk_gen <= ~clk_gen;
        end
    else
        begin
            counter_1 <= counter_2;
        end   
     
end

assign clk_out_even = clk_gen;
assign counter_2 = counter_1 + 1;
   
endmodule
