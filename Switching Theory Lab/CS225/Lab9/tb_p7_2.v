
module tb_p7_2();
	reg clk = 0;
	wire ctrl;
	integer i = -1;
	decoded_counter UUT(ctrl, clk);
	initial

	for(i = 0; i < 100; i = i + 1)
	#10;
	always @(i) clk = ~clk;
	always @(i/2)
	$display("ctrl = %b", ctrl);
endmodule
