`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/18 20:02:52
// Design Name: 
// Module Name: datapath
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
//module register(clk, rst, load, d, q)
//module compare(a, b, res)
//module mux_21(a, b, sel, out)  0->a 1->b
//module adder(a, b, c_in, sum, c_out);
//ram(data, read_addr, write_addr, clk, we, q) 


module datapath(clk, rst, SUM_SEL, NEXT_SEL, A_SEL, LD_SUM, LD_NEXT, NEXT_ZERO, sum_out);
input clk,rst,SUM_SEL,NEXT_SEL,A_SEL,LD_SUM,LD_NEXT;    
output NEXT_ZERO;
output [31:0] sum_out;

    wire [31:0] a1out;//a1加法器输出
    wire [31:0] a2out;// a2输出
    wire [31:0] summux_out;//summux多路选择器输出
    wire [31:0] nextmux_out;// nextmux多路选择器输出
    wire [31:0] amux_out;
    wire [31:0] NEXT_R_out;//
    wire [31:0] memory_out; 
    
    mux_21 #(32) SUMmux(.a(0), .b(a1out), .sel(SUM_SEL), .out(summux_out));
    mux_21 #(32) NEXTmux(.a(0), .b(memory_out), .sel(NEXT_SEL), .out(nextmux_out));
    mux_21 #(32) Amux(.a(NEXT_R_out), .b(a2out), .sel(A_SEL), .out(amux_out));
    
    register #(32) SUM_R(.clk(clk), .rst(rst), .load(LD_SUM), .d(summux_out), .q(sum_out));
    register #(32) NEXT_R(.clk(clk), .rst(rst), .load(LD_NEXT), .d(nextmux_out), .q(NEXT_R_out));
    
    adder #(32) add1(.a(sum_out), .b(memory_out), .sum(a1out)); 
    adder #(32) add2(.a(1), .b(NEXT_R_out),.sum(a2out));
    
    ram #(32, 5) memory(.data(), .read_addr(amux_out), .write_addr(), .clk(clk), .we(), .q(memory_out));
    
    compare #32 cmp(.a(0), .b(nextmux_out), .res(NEXT_ZERO));
endmodule
