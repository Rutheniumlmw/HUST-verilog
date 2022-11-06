`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/25 21:37:40
// Design Name: 
// Module Name: auto_add_tb
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


module auto_add_tb();

    reg clk,rst,start;
    wire DONE;
    wire [31:0] sum_out;
    
    auto_add dut(clk,rst,start,DONE,sum_out);
    
    initial clk = 0;
    always #10 clk = ~clk;
    
    initial begin
        rst <= 1;
        start <= 0;
        #15 rst <= 0;
        #5 start <= 1;
        #105 start <= 0;
//        @(posedge clk); //到达下一个时钟上升沿
//            #5 if (LD_SUM != 0)    //延迟5ns后验证复位是否成功
//                $display("%t: Reset failed", $time);
    end







endmodule
