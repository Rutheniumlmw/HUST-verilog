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
input clk;                    // ����ʱ��
output reg [2:0] out;             // ����ֵ

always @(posedge clk)  begin  // ��ʱ�������ؼ�������1
    if(out == 3'b000)
        out <= 3'b111;
    else
        out <= out-1;
                           // ����ʵ��
end                           
endmodule
