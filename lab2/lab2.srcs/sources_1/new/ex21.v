`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/27 20:10:45
// Design Name: 
// Module Name: ex21
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
module _7Seg_Driver_Direct(SW, CA, CB, CC, CD, CE, CF, CG, DP, AN, LED);
	input [15:0] SW;   // 16位拨动开关
	output CA, CB, CC, CD, CE, CF, CG, DP;  // 7段数码管驱动，低电平有效
	output [7:0] AN;// 7段数码管片选信号，低电平有效
	output [15:0] LED;   // 16位LED显示，高电平有效
	
	assign CA = ~SW[7];
	assign CB = ~SW[6];
	assign CC = ~SW[5];
	assign CD = ~SW[4];
	assign CE = ~SW[3];
	assign CF = ~SW[2];
	assign CG = ~SW[1];
	assign DP = ~SW[0];
	
	assign AN[0] = ~SW[8];
	assign AN[1] = ~SW[9];
	assign AN[2] = ~SW[10];
	assign AN[3] = ~SW[11];
	assign AN[4] = ~SW[12];
	assign AN[5] = ~SW[13];
	assign AN[6] = ~SW[14];
	assign AN[7] = ~SW[15];
	
	assign SW[15:0] = LED[15:0];
	
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
