`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/18 19:36:02
// Design Name: 
// Module Name: compare
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


module compare(a, b, res); //相等为1 不相同为0
    parameter WIDTH = 8;
    input [WIDTH-1:0] a, b;
    output reg res;   
    always @(a, b) begin
        if(a == b)
            res = 1;
        else
            res = 0;
    end
   // res = 0;

endmodule
