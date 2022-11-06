module full_adder( 
    input [2:0] a, b,
    input cin,
    output cout,
    output [2:0] sum
);
	
// 请完成模块的设计
	
assign {cout, sum} = a + b + cin;	
endmodule
