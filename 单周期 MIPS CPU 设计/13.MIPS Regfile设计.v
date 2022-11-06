module mips_regfile
(
	read_reg1_addr	,
    read_reg2_addr	,
    write_reg_addr	,
    data_in			,
    write_read_ena	,
    clk				,
                    
    read_reg1_data	,
    read_reg2_data	
);

reg [31:0] regs[31:0];

input [4:0] read_reg1_addr;
input [4:0] read_reg2_addr;
input [4:0] write_reg_addr;
input clk, write_read_ena;
input [31:0] data_in;

output reg [31:0] read_reg1_data;
output reg [31:0] read_reg2_data;

    always@(negedge clk) begin
        if(!read_reg1_addr)
            read_reg1_data[31:0] = 0;
        else
            read_reg1_data[31:0] = regs[read_reg1_addr];
        if(!read_reg2_addr)
            read_reg2_data[31:0] = 0;
        else
            read_reg2_data[31:0] = regs[read_reg2_addr];

        if(write_read_ena) begin
            regs[write_reg_addr] = data_in[31:0];
        end
    end
endmodule
