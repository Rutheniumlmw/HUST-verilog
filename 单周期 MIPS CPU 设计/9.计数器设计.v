
module counter( 
    input clk,
	input rst,
	input start,
    input up,
    output [3:0] counter_out
);
	reg [3:0] counter_out;

	// 请完成模块的设计
    always@(posedge clk) begin
        if(rst == 1)
           counter_out <= 0;
        else begin
            if(start == 1) begin
                if(up == 1)
                    counter_out <= counter_out+1;
                else
                    counter_out <= counter_out-1;
            end
        end 
    end
	
	
endmodule

