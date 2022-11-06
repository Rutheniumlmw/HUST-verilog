module mips_signal_extend
(
    inmediate_data  ,
    extend_data   
);
input [15:0] inmediate_data;
output [31:0] extend_data;

assign extend_data = { {(16){inmediate_data[15]}}, inmediate_data};
endmodule
