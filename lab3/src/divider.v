`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/04 20:43:56
// Design Name: 
// Module Name: divider
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


module divider(clk, clk_N, SW);
input clk;                      // ϵͳʱ��
input [2:0] SW;
output reg clk_N;                   // ��Ƶ���ʱ��
parameter N = 100_000_000;      // 1Hz��ʱ��,N=fclk/fclk_N
parameter N1 = 10000;
reg [31:0] counter;             /* ������������ͨ������ʵ�ַ�Ƶ��
                                   ����������0������(N/2-1)ʱ��
                                   ���ʱ�ӷ�ת������������ */
always @(posedge clk)  begin    // ʱ��������
    
    if(SW[2] == 1) begin
        if (counter >= N1) begin
            clk_N <= ~clk_N;
            counter <= 0;
        end
        else begin
                counter <= counter+1;
            end 
    end
    else
        if (counter >= (N/2-1)) begin
            clk_N <= ~clk_N;
            counter <= 0;
        end
        else begin
            counter <= counter+1;
        end 
    end
    

//    if (counter == (N/2-1) && flag == 0 ) begin
//        clk_N <= ~clk_N;
//        counter <= 0;
//    end
//    else begin
//        counter <= counter+1;
//    end                            
     
//end                           
endmodule
