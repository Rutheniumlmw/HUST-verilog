
module finite_state_machine( 
    input clk,
	input reset,
	input w,
	output [2:0] state,
	output [2:0] next_state,
    output z
);
    reg [2:0] state; 
    reg [2:0] next_state;
    reg z;
	// 请完成模块的设计
    localparam A = 0, B = 1, C = 2, D = 3, E = 4, F = 5;
    initial begin
        next_state = 0;
        z = 0;
    end
    always@(state, w) begin
        case(state) 
            A: begin
                state = A;
                z = 0;
                if(w)
                    next_state = A;
                else
                    next_state = B;
            end
            B: begin
                state = B;
                z = 0;
                if(w)
                    next_state = D;
                else
                    next_state = C;
            end
            C: begin
                state = C;
                z = 0;
                if(w)
                    next_state = D;
                else
                    next_state = E;

            end
            D: begin
                state = D;
                z = 0;
                if(w)
                    next_state = A;
                else
                    next_state = F;
            end
            E: begin
                state = E;
                z = 1;
                if(w)
                    next_state = D;
                else
                    next_state = E;
            end
            F: begin
                state = F;
                z = 1;
                if(w)
                    next_state = D;
                else
                    next_state = C;
            end
        endcase
    end

	always@(posedge clk)begin
        if (reset == 1)
            state <= A;
        else 
            state <= next_state; 
    end
	
endmodule

