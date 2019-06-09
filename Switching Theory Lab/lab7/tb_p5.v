module tb_p5();
	reg m2, m1, m0;
	wire A;
	//checking all possible cases
	p5 UUT (A, m2, m1, m0);
	initial
		begin
			m2 = 1'b0;
			m1 = 1'b0; //000
			m0 = 1'b0;
			#10;
			
			m2 = 1'b0;
			m1 = 1'b0; //001
			m0 = 1'b1;
			#10;
			
			m2 = 1'b0;
			m1 = 1'b1; //010
			m0 = 1'b0;
			#10;
			
			m2 = 1'b0;
			m1 = 1'b1; //011
			m0 = 1'b1;
			#10;
			
			m2 = 1'b1;
			m1 = 1'b0; //100
			m0 = 1'b0;
			#10;
			
			m2 = 1'b1;
			m1 = 1'b0; //101
			m0 = 1'b1;
			#10;
			
			m2 = 1'b1;
			m1 = 1'b1; //110
			m0 = 1'b0;
			#10;
			
			m2 = 1'b1;
			m1 = 1'b1; //111
			m0 = 1'b1;
			#10;
		end
		
		initial
		begin
			$monitor("A = %b, m2 = %b, m1 = %b, m0 = %b, time = %t\n\n", A, m2, m1, m0, $time);
		end
endmodule