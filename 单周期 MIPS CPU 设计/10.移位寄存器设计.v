module shifter(din,s,srsi,slsi,clk,clr,dout);
	input  [7:0] 	din;
	input  [1:0] 	s;
	input 			srsi,slsi,clk,clr;
	output [7:0] 	dout;
	reg    [7:0] 	dout; 
	
	// 请在下面添加代码，完成 8 位双向移位寄存器功能
	always @(posedge clk, clr) begin
		if(!clr) begin
			dout <= 0;	
		end
		else begin
            case(s[1:0])
                2'b00: begin
                    dout = dout;
                end
                2'b01: begin
                    dout = dout >> 1;
                    dout[7] = srsi;
                end
                2'b10: begin
                    dout = dout << 1;
                    dout[0] = slsi;
                end
                2'b11: begin
                    dout[7:0] = din[7:0];
                end
			endcase
		end	
	end



endmodule
