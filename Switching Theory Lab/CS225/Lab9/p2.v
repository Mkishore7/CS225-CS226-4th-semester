// listing all inputs and outputs, by convention outputs go first
module p2(ans,operation,x,y);
	output[15:0] ans;
	input [15:0] x,y;
	input [2:0] operation;
	reg [15:0] ans;
	always @ (operation)
	case (operation) 
	// ALU is implemented using numbers 
		3'b000: ans <= x+y;
		3'b001: ans <= x-y;
		3'b010: ans <= x&y;
		3'b011: ans <= x^y;
		3'b100: ans <= x|y;
		3'b101: ans <= x+1;
		3'b110: ans <= x<<1;
		3'b111: ans <= x>>1;
		default: ans <= 16'd0;
	endcase
endmodule
