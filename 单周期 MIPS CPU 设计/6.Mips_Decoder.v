
module mips_1stage_decoder(
    input [5:0]         i_op,
	input [5:0]			i_func,
	output wire [3:0]	o_alu_op,
    output wire 		o_MemtoReg,
	output wire 		o_MemWrite,
	output wire 		o_ALU_SRC,
	output wire 		o_RegWrite,
	output wire 		o_SYSCALL,
	output wire 		o_SignedExt,
	output wire 		o_RegDst,
	output wire 		o_BEQ,
	output wire 		o_BNE,
	output wire 		o_JR,	
	output wire 		o_JUMP,
	output wire 		o_JAL
);

assign o_alu_op[3:0] = (i_op==0&&i_func==3)*1+(i_op==0&&i_func==2)*2+(i_op==0&&i_func==32)*5+(i_op==0&&i_func==33)*5+(i_op==0&&i_func==34)*6+(i_op==0&&i_func==36)*7+(i_op==0&&i_func==37)*8+(i_op==0&&i_func==39)*10+(i_op==0&&i_func==42)*11+(i_op==0&&i_func==43)*12+(i_op==4)*11+(i_op==5)*11+(i_op==8)*5+(i_op==12)*7+(i_op==9)*5+(i_op==10)*11+(i_op==13)*8+(i_op==35)*5+(i_op==43)*5;

assign o_MemtoReg = (i_op == 35);

assign o_MemWrite = (i_op == 43);

assign o_ALU_SRC = (i_op== 8||i_op== 12||i_op== 9||i_op== 10||i_op== 13||i_op== 35||i_op== 43);

assign o_RegWrite = (i_op== 3||i_op== 8||i_op== 12||i_op== 10||i_op== 13||i_op== 35||i_op== 9||(i_op==0&&(i_func== 0||i_func== 3||i_func== 2||i_func== 32||i_func== 33||i_func== 34||i_func== 36||i_func== 37||i_func== 39||i_func== 42||i_func== 43)));

assign o_SYSCALL = (i_op ==0&&i_func==12);

assign o_SignedExt = (i_op == 4||i_op == 5||i_op == 8||i_op == 10||i_op == 35||i_op == 43);

assign o_RegDst = (i_op==0&&(i_func== 0||i_func== 3||i_func== 2||i_func== 32||i_func== 33||i_func== 34||i_func== 36||i_func== 37||i_func== 39||i_func== 42||i_func== 43));

assign o_BEQ = (i_op ==4);

assign o_BNE = (i_op ==5);

assign o_JR = (i_op ==0&&i_func==8);

assign o_JUMP = (i_op == 2||i_op ==3||(i_op==0&&i_func==8));

assign o_JAL = (i_op ==3);

  
endmodule
