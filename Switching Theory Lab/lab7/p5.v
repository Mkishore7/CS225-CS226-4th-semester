module p5(A, m2, m1, m0);
	output A; 
	input m2, m1, m0;
	
	and and0 (out0, m1, m0);
	and and1 (out1, m2, m0); 
	and and2 (out2, m2, m1); 
	or out (A, out0, out1, out2);
endmodule