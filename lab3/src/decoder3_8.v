`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/04 22:04:23
// Design Name: 
// Module Name: decoder3_8
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


module decoder3_8(num, sel);
input [2: 0] num;       // 数码管编号：0~7
output reg [7:0] sel;       // 7段数码管片选信号，低电平有效
                     // 功能实现
always@(num[2], num[1], num[0]) begin
        case(num[2:0])
            3'b000 : sel[7:0] = 8'b11111110;
            3'b001 : sel[7:0] = 8'b11111101;
            3'b010 : sel[7:0] = 8'b11111011;
            3'b011 : sel[7:0] = 8'b11110111;
            3'b100 : sel[7:0] = 8'b11101111;
            3'b101 : sel[7:0] = 8'b11011111;
            3'b110 : sel[7:0] = 8'b10111111;
            default: sel[7:0] = 8'b01111111;
        endcase
    end
endmodule
