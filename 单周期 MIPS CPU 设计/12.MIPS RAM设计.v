module mips_ram
(
	Addr_i,
	D_in  ,
	W_en  ,
	Mode  ,
	
	D_out ,
   	
	clk	
);

input [11:0] Addr_i;
input [31:0] D_in;
input [1:0] Mode;	
input W_en;
input clk;
output reg [31:0] D_out;
reg [7:0] data[2**12-1:0];
reg [11:0] addr;

    always@(negedge clk) begin
        case(Mode[1:0]) 
            2'b00:begin //32
                addr[11:0] = 0;
                addr[9:0] = (Addr_i >> 2) <<2 ;
                if(W_en) begin //写
                    data[addr] = D_in[7:0];
                    addr = addr + 1;
                    data[addr] = D_in[15:8];
                    addr = addr + 1;
                    data[addr] = D_in[23:16];
                    addr = addr + 1;
                    data[addr] = D_in[31:24];
                end
                else begin //读
                    D_out[7:0] = data[addr];
                    addr = addr + 1;
                    D_out[15:8] = data[addr];
                    addr = addr + 1;
                    D_out[23:16] = data[addr];
                    addr = addr + 1;
                    D_out[31:24] = data[addr];
                end
            end
            2'b10:begin //16
                addr[11:0] = 0;
                addr[9:0] = (Addr_i >> 2) << 2;
                addr = addr + Addr_i[1]*2;
                if(W_en) begin
                    data[addr] = D_in[7:0];
                    addr = addr + 1;
                    data[addr] = D_in[15:8]; 
                end
                else begin
                    D_out[7:0] = data[addr];
                    addr = addr + 1;
                    D_out[15:8] = data[addr];
                    D_out[31:16] = 0;
                end
            end
            2'b01:begin //8
                if(W_en) begin
                    //addr[11:0] = 0;
                    //addr[9:0] = (Addr_i >> 2) << 2;
                    //addr = addr + Addr_i[1:0];

                    data[Addr_i] = D_in[7:0];
                end
                else begin
                    //addr[11:0] = 0;
                    //addr[9:0] = (Addr_i >> 2) << 2;
                    //addr = addr + Addr_i[1:0];
                    
                    D_out[7:0] = data[Addr_i];
                    D_out[31:8] = 0;
                end
            end
        endcase
    end
endmodule	 
