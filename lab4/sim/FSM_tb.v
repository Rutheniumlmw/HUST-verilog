`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/25 20:09:22
// Design Name: 
// Module Name: FSM_tb
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

//FSM(clk,rst,start,next_zero, LD_SUM, LD_NEXT, SUM_SEL, NEXT_SEL, A_SEL, DONE);
//input clk,rst,start,next_zero;
//output reg LD_SUM,LD_NEXT,SUM_SEL,NEXT_SEL,A_SEL,DONE;

module FSM_tb( );
    reg clk,rst,start,next_zero;
    wire LD_SUM,LD_NEXT,SUM_SEL,NEXT_SEL,A_SEL,DONE;
    
    FSM dut(clk, rst, start, next_zero, LD_SUM, LD_NEXT ,SUM_SEL ,NEXT_SEL, A_SEL, DONE);
    
    initial clk = 0;
    always #10 clk = ~clk;
    
    initial begin
        rst <= 1;
        start <= 0;
        next_zero <= 0;
        #15 rst <= 0;
        #20 start <= 1;
        #85 next_zero <= 1;
        #20 start <= 0;
    end
    
endmodule
