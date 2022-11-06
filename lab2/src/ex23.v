`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/27 21:20:25
// Design Name: 
// Module Name: ex23
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


module _7Seg_Driver_Choice(SW, SEG, AN, LED);
    input [15:0] SW;   // 16λ��������
    output [7:0] SEG;  // 7��������������͵�ƽ��Ч
    output [7:0] AN;// 7�������Ƭѡ�źţ��͵�ƽ��Ч
    output [15:0] LED;   // 16λLED��ʾ
    
    _7Seg_Driver_Decode(SW, SEG, AN, LED);
    choice(SW, AN);
    
endmodule

module choice(SW, AN);
    input [15:0] SW;   // 16λ��������
    //output reg [7:0] SEG;  // 7��������������͵�ƽ��Ч
    output reg [7:0] AN;// 7�������Ƭѡ�źţ��͵�ƽ��Ч
    //output [15:0] LED;   // 16λLED��ʾ   
    always@(SW[15], SW[14] , SW[13]) begin
        case(SW[15:13])
            3'b000 : AN[7:0] = 8'b11111110;
            3'b001 : AN[7:0] = 8'b11111101;
            3'b010 : AN[7:0] = 8'b11111011;
            3'b011 : AN[7:0] = 8'b11110111;
            3'b100 : AN[7:0] = 8'b11101111;
            3'b101 : AN[7:0] = 8'b11011111;
            3'b110 : AN[7:0] = 8'b10111111;
            default: AN[7:0] = 8'b01111111;
        endcase
    end
endmodule
