`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/18 19:53:57
// Design Name: 
// Module Name: ram
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


module ram(data, read_addr, write_addr, clk, we, q);
  parameter DATA_WIDTH = 8;
  parameter ADDR_WIDTH = 3;

  input clk, we;
  input [DATA_WIDTH-1:0] data;
  input [ADDR_WIDTH-1:0] read_addr, write_addr;
  output reg [DATA_WIDTH-1:0] q;

  // ÉêÃ÷´æ´¢Æ÷Êý×é
  reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];
  initial begin       
          $readmemh("D:\\studysourcefile\\verilog\\lab4\\lab4.srcs\\sources_1\\new\\ram_init.txt", ram);                        
          //$readmemh("ram_init.txt", ram);    
          end
   always @(read_addr) begin
         q <= ram[read_addr];
   end
 endmodule     
  /*        
  always @(posedge clk) begin
    q <= ram[read_addr];
  end    */


