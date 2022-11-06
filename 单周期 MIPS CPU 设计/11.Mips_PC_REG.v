module mips_pc_reg
(
		clk				,
        rstn			,
        pc_address_in	,
        pc_address_o	
);
input clk; 
input rstn;
input [31:0] pc_address_in;
output reg [31:0] pc_address_o;

    always@(posedge clk, rstn) begin
        if(!rstn) begin
            pc_address_o = 0;
        end
        else begin
            pc_address_o[31:0] = pc_address_in[31:0];
        end
    end


endmodule
