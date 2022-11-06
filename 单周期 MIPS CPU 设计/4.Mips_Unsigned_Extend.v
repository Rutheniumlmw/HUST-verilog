module mips_unsignal_extend
(
    inmediate_data  ,
    unsig_extend_data   
);

input [15:0] inmediate_data;
output [31:0] unsig_extend_data;
//assign unsig_extend_data = unsig_extend_data;
assign unsig_extend_data = {16'b0000000000000000, inmediate_data};


endmodule
