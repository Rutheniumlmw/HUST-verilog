`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/04 22:06:30
// Design Name: 
// Module Name: pattern
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


module pattern(code, patt);
input [3: 0] code;       // 16进制数字的4位二进制编码
output reg [7:0] patt;       // 7段数码管驱动，低电平有效
                       // 功能实现

always@(code[0], code[1] , code[2],  code[3]) begin
        case(code[3:0])
            4'b0000 : patt[7:0] = 8'b11000000;
            4'b0001 : patt[7:0] = 8'b11111001;
            4'b0010 : patt[7:0] = 8'b10100100;
            4'b0011 : patt[7:0] = 8'b10110000;
            4'b0100 : patt[7:0] = 8'b10011001;
            4'b0101 : patt[7:0] = 8'b10010010;
            4'b0110 : patt[7:0] = 8'b10000010;
            4'b0111 : patt[7:0] = 8'b11111000;
            4'b1000 : patt[7:0] = 8'b10000000;
            4'b1001 : patt[7:0] = 8'b10011000;
            4'b1010 : patt[7:0] = 8'b10001000;
            4'b1011 : patt[7:0] = 8'b10000011;
            4'b1100 : patt[7:0] = 8'b11000110;
            4'b1101 : patt[7:0] = 8'b10100001;
            4'b1110 : patt[7:0] = 8'b10000110;
            default : patt[7:0] = 8'b10001110;
        endcase
    end
endmodule
