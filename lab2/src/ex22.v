`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/27 20:16:16
// Design Name: 
// Module Name: ex22
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


module _7Seg_Driver_Decode(SW, SEG, AN, LED);
	input [15:0] SW;   // 16位拨动开关
	output reg [7:0] SEG;  // 7段数码管驱动，低电平有效
	output [7:0] AN;// 7段数码管片选信号，低电平有效
	output [15:0] LED;   // 16位LED显示
	
	always@(SW[0], SW[1] , SW[2],  SW[3]) begin
        case(SW[3:0])
            4'b0000 : SEG[7:0] = 8'b11000000;
            4'b0001 : SEG[7:0] = 8'b11111001;
            4'b0010 : SEG[7:0] = 8'b10100100;
            4'b0011 : SEG[7:0] = 8'b10110000;
            4'b0100 : SEG[7:0] = 8'b10011001;
            4'b0101 : SEG[7:0] = 8'b10010010;
            4'b0110 : SEG[7:0] = 8'b10000010;
            4'b0111 : SEG[7:0] = 8'b11111000;
            4'b1000 : SEG[7:0] = 8'b10000000;
            4'b1001 : SEG[7:0] = 8'b10011000;
            4'b1010 : SEG[7:0] = 8'b10001000;
            4'b1011 : SEG[7:0] = 8'b10000011;
            4'b1100 : SEG[7:0] = 8'b11000110;
            4'b1101 : SEG[7:0] = 8'b10100001;
            4'b1110 : SEG[7:0] = 8'b10000110;
            default : SEG[7:0] = 8'b10001110;
        endcase
    end
	
//    assign AN[0] = ~SW[8];
//    assign AN[1] = ~SW[9];
//    assign AN[2] = ~SW[10];
//    assign AN[3] = ~SW[11];
//    assign AN[4] = ~SW[12];
//    assign AN[5] = ~SW[13];
//    assign AN[6] = ~SW[14];
//    assign AN[7] = ~SW[15];

//	assign AN[0] = SW[8];
//    assign AN[1] = SW[9];
//    assign AN[2] = SW[10];
//    assign AN[3] = SW[11];
//    assign AN[4] = SW[12];
//    assign AN[5] = SW[13];
//    assign AN[6] = SW[14];
//    assign AN[7] = SW[15];
	
	
	
	assign LED[0] = SW[0];
    assign LED[1] = SW[1];
    assign LED[2] = SW[2];
    assign LED[3] = SW[3];
    assign LED[4] = SW[4];
    assign LED[5] = SW[5];
    assign LED[6] = SW[6];
    assign LED[7] = SW[7];
    assign LED[8] = SW[8];
    assign LED[9] = SW[9];
    assign LED[10] = SW[10];
    assign LED[11] = SW[11];
    assign LED[12] = SW[12];
    assign LED[13] = SW[13];
    assign LED[14] = SW[14];
    assign LED[15] = SW[15];
endmodule
