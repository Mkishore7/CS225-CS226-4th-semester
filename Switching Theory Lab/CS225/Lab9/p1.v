module p1(out,binary);
	output [3:0] out;
	input [3:0] binary;
	and gray4(out[3],binary[3],binary[3]);
	xor gray3(out[2],binary[3],binary[2]);
	xor gray2(out[1],binary[2],binary[1]);
	xor gray1(out[0],binary[1],binary[0]);
endmodule
