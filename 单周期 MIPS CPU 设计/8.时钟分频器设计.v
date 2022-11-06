
module divider (clk, clk_N);
    input           clk;
    output reg      clk_N;
    parameter       N = 100000;
    reg [31:0]      counter;
	
    initial begin
        clk_N = 0;
        counter = 0;
	end

    always @(posedge clk)  begin
        if (counter == N) begin
            clk_N <= ~clk_N;
            counter <= 0;
        end
        else begin
            counter = counter+1;
        end
    end
	
endmodule
