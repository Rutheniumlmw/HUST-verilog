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
input clk;                    // ����ʱ��
input [2:0]SW;
output reg [2:0] out;             // ����ֵ


always @(posedge clk)  begin  // ��ʱ�������ؼ�������1 
        
        if(SW == 1)
            out <= out+1;
        else 
            out <= out-1;
        
        //out <= out+flag;
                           // ����ʵ��
end                           
endmodule
