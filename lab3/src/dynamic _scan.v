`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/04 22:08:24
// Design Name: 
// Module Name: dynamic _scan
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

//01 �ҵ���
//10 ����
//11 ֹͣ

module dynamic_scan(clk,  SEG, AN, SW);
input clk;              // ϵͳʱ��
input [2:0] SW;
output  [7:0] SEG;  		// �ֱ��ӦCA��CB��CC��CD��CE��CF��CG��DP
output  [7:0] AN;        // 8λ�����Ƭѡ�ź�

    wire clk_N;
    wire [2:0] out;
    wire [3:0] data;
    
    //always@(SW[0], SW[1], SW[2]) begin
    divider(clk, clk_N, SW);
    counter(clk_N, out, SW);
    decoder3_8(out, AN);
    rom8x4(out, data, SW);
    pattern(data, SEG);
    //end
                     // ����ʵ��
endmodule
