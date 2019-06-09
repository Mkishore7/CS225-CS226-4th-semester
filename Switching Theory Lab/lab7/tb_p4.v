module tb_p4();
	parameter N=8;
	reg[N-1:0] a, b;
	wire eq, neq;
	wire lt, lte;
	wire gt, gte;
	display("Checking output for 10 random numbers.\n");
	integer i;
	comparators UUT (eq,neq,lt,lte,gt,gte,a,b);
	initial
		begin 
			#10 $monitor("a = %b, b = %b,  eq = %b, neq = %b, lt = %b, lte = %b, gt = %b, gte = %b",a,b,eq,neq,lt,lte,gt,gte);
		    for( i = 1; i <= 10; i = i + 1)
				begin
					a=$urandom%2**N-1;
					b=$urandom%2**N-1;
					#10;
						$display("\n\n");
				end
		end
endmodule