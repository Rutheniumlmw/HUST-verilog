`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/11 20:07:28
// Design Name: 
// Module Name: excounter
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


module excounter(clk, out);
input clk;                    // 计数时钟
output reg [2:0] out;             // 计数值

always @(posedge clk)  begin  // 在时钟上升沿计数器加1
    if(out == 3'b000)
        out <= 3'b111;
    else
        out <= out-1;
                           // 功能实现
end                           
endmodule
