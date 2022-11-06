module mips_alu
(
		a_i					,
        b_i					,
        alu_op				,
                        
        result_1			,
        result_2			,
                        
        over_flow			,
        unsig_over_flow		,
        equal				
);

input [31:0] a_i, b_i;
input [3:0] alu_op;
output reg [31:0] result_1; 
output reg [31:0] result_2;
output reg over_flow;
output reg unsig_over_flow;
output reg equal;
reg [63:0] tmp;
reg [32:0] add_sub;
always@(*) begin
    case(alu_op[3:0])
        4'b0000: begin
            result_1 = a_i << (b_i[4:0]);
            //result_1 = a_i << (b_i & 5'b11111);
            result_2 = 0;
        end
        4'b0001: begin
            result_1 = ( $signed(a_i) ) >>> (b_i & 5'b11111);
            result_2 = 0;
        end
        4'b0010: begin
            result_1 = a_i >> (b_i & 5'b11111);
            result_2 = 0;
        end
        4'b0011: begin
            tmp = a_i*b_i;
            result_1 = (tmp << 32) >> 32;
            result_2 = tmp >> 32;
        end
        4'b0100:begin
            result_1 = a_i/b_i;
            result_2 = a_i%b_i;
        end
        4'b0101: begin //加法
            result_1 = a_i + b_i;
            result_2 = 0;
            add_sub = a_i + b_i;
            if(a_i[31] == b_i[31] && a_i[31] != result_1[31])
                over_flow = 1;
            else
                over_flow = 0;
            if(result_1 < a_i)
                unsig_over_flow = 1;
            else
                unsig_over_flow = 0;
        end
        4'b0110: begin //减法
            result_1 = a_i - b_i;
            result_2 = 0;
            add_sub = a_i - b_i;
            if(a_i[31] != b_i[31] && a_i[31] != result_1[31])
                over_flow = 1;
            else
                over_flow = 0;
            if(result_1 > a_i)
                unsig_over_flow = 0;
            else    
                unsig_over_flow = 1;
        end
        4'b0111: //按位与
            result_1 = a_i & b_i;
        4'b1000: //按位或
            result_1 = a_i | b_i;
        4'b1001: //按位异或
            result_1 = a_i ^ b_i;
        4'b1010: 
            result_1 = ~(a_i | b_i);
        4'b1011:
            result_1 = $signed(a_i) < $signed(b_i) ? 1 : 0;
        4'b1100:
            result_1 = a_i < b_i ? 1 : 0;
    endcase
end
endmodule
