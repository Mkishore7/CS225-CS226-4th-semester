module p2(l, d); 
	output l; 
	input[2:0] d;
	
	not not2 (inv_d2, d[2]); 
	not not1 (inv_d1, d[1]);
	not not0 (inv_d0, d[0]); 
	
	and and0 (a0_out, inv_d0, inv_d2); 
	and and1 (a1_out, inv_d1, inv_d2); 
	
	or out (l, a0_out, a1_out); 
endmodule