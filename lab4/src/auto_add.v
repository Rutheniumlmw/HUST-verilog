`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/25 21:24:47
// Design Name: 
// Module Name: auto_add
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

//module FSM(clk,rst,start,next_zero, LD_SUM, LD_NEXT, SUM_SEL, NEXT_SEL, A_SEL, DONE);
//datapath(clk, rst, SUM_SEL, NEXT_SEL, A_SEL, LD_SUM, LD_NEXT, NEXT_ZERO, sum_out);

module auto_add(clk,rst,start,DONE,sum_out);
input clk,rst,start;
output DONE;
output [31:0] sum_out;

wire LD_SUM, LD_NEXT, SUM_SEL, NEXT_SEL, A_SEL, next_zero;   

    FSM fsm(clk, rst, start, next_zero, LD_SUM, LD_NEXT, SUM_SEL, NEXT_SEL, A_SEL, DONE);
    datapath DATAPATH(.clk(clk), .rst(rst), .SUM_SEL(SUM_SEL), .NEXT_SEL(NEXT_SEL), .A_SEL(A_SEL), .LD_SUM(LD_SUM), .LD_NEXT(LD_NEXT), .NEXT_ZERO(next_zero), .sum_out(sum_out));
    //FSM fsm(clk, rst, start, next_zero, LD_SUM, LD_NEXT, SUM_SEL, NEXT_SEL, A_SEL, DONE);
endmodule
