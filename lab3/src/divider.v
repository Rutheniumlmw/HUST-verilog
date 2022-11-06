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
input clk;                      // 系统时钟
input [2:0] SW;
output reg clk_N;                   // 分频后的时钟
parameter N = 100_000_000;      // 1Hz的时钟,N=fclk/fclk_N
parameter N1 = 10000;
reg [31:0] counter;             /* 计数器变量，通过计数实现分频。
                                   当计数器从0计数到(N/2-1)时，
                                   输出时钟翻转，计数器清零 */
always @(posedge clk)  begin    // 时钟上升沿
    
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
