`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/04 21:12:33
// Design Name: 
// Module Name: counter
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


module counter(clk, out, SW);
input clk;                    // 计数时钟
input [2:0]SW;
output reg [2:0] out;             // 计数值


always @(posedge clk)  begin  // 在时钟上升沿计数器加1 
        
        if(SW == 1)
            out <= out+1;
        else 
            out <= out-1;
        
        //out <= out+flag;
                           // 功能实现
end                           
endmodule
