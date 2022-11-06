`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/18 19:34:55
// Design Name: 
// Module Name: mux_21
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



module mux_21(a, b, sel, out);
    parameter WIDTH = 8;
    
    input [WIDTH-1:0] a, b;
    input sel;
    output [WIDTH-1:0] out;
    
    // ÈýÔªÔËËã·û
    assign out = sel == 0 ? a : b;
    
endmodule

