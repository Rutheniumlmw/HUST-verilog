`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/04 21:22:07
// Design Name: 
// Module Name: counterdivider
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

module counterdivider(clk, out);
    input clk;                    
    output [2:0] out;
   // reg clk_N;
    divider(clk, clk_N);
    counter(.clk(clk_N) , .out(out));
   // divider(clk, clk_N)

endmodule
