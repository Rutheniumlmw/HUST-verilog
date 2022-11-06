`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/25 19:42:28
// Design Name: 
// Module Name: FSM
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


module FSM(clk,rst,start,next_zero, LD_SUM, LD_NEXT, SUM_SEL, NEXT_SEL, A_SEL, DONE);
input clk,rst,start,next_zero;
output reg LD_SUM,LD_NEXT,SUM_SEL,NEXT_SEL,A_SEL,DONE;

    
    localparam _START = 0, _COMPUTE_SUM = 1, _GET_NEXT = 2, _DONE = 3;
    reg [1:0] State , StateNext;
    
    //State <= 0;
    always @(State, start, next_zero) begin
        //State <= 1;
        case(State)
            _START: begin
                LD_SUM <= 0;
                LD_NEXT <= 0;
                SUM_SEL <= 0;
                NEXT_SEL <= 0;
                A_SEL <= 0;
                DONE <= 0; 
                
                if(start == 1)
                    StateNext <= _COMPUTE_SUM;
                else
                    StateNext <= _START;         
            end
            
            _COMPUTE_SUM: begin
                LD_SUM <= 1;
                LD_NEXT <= 0;
                SUM_SEL <= 1;
                NEXT_SEL <= 1;
                A_SEL <= 1;
                DONE <= 0; 
                
                StateNext <= _GET_NEXT;          
            end
            _GET_NEXT: begin
            
                LD_SUM <= 0;
                LD_NEXT <= 1;
                SUM_SEL <= 1;
                NEXT_SEL <= 1;
                A_SEL <= 0;
                DONE <= 0; 
                       
                if(next_zero == 1)
                    StateNext <= _DONE;
                else
                    StateNext <= _COMPUTE_SUM;                    
            end
            _DONE: begin
                LD_SUM <= 0;
                LD_NEXT <= 0;
                SUM_SEL <= 0;
                NEXT_SEL <= 0;
                A_SEL <= 0;
                DONE <= 1; 
                if(start == 1)
                    StateNext <= _DONE;
                else
                    StateNext <= _START;                                
            end
            default: begin
                //$display("%t: Reset failed", $State);
                State <= _START;
            end
        endcase
    end
    
    always @(posedge clk)
    begin
      if (rst == 1)
        State <= _START;
      else 
        State <= StateNext;            
    end //endalways
endmodule



/*

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

module FSM_tb();
    reg clk,rst,start,next_zero;
    wire LD_SUM,LD_NEXT,SUM_SEL,NEXT_SEL,A_SEL,DONE;
    
    FSM dut(clk, rst, start, next_zero, LD_SUM, LD_NEXT ,SUM_SEL ,NEXT_SEL, A_SEL, DONE);
    
    initial clk = 0;
    always #10 clk <= ~clk;
    
    initial begin
        rst <= 1;
        start <= 0;
        #5 rst <= 0;
        @(posedge clk);
        start <= ~start;
    end
    
    
endmodule

*/
