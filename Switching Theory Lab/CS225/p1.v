
 //module declaration with inputs and outputs
module p1(Y,present,clock,reset,input_bit);
//Conventionally output is declared first, then input.
	output Y;
	input clock, reset,input_bit;
	output [2:0] present;
	reg [2:0] next;
	reg[2:0] present;

	parameter [2:0] S0=3'b000;
	parameter [2:0] S1=3'b001;
	parameter [2:0] S2=3'b010;
	parameter [2:0] S3=3'b011;
	parameter [2:0] S4=3'b100;

	initial
	begin
		present = 3'b000;
		next = 3'b000;
	end

	always @(posedge clock) 
  // sequential logic
	begin
		if (reset) present <= S0;
		else present <= next;
		end
    // combinational logic
		always @(present or input_bit) // combinational logic
		begin
			case(present)
				S0: if (reset) next = S0;
						else if(input_bit) next = S1;
						else next = S0;
				S1: if (reset) next = S0;
						else if(input_bit) next = S2;
						else next = S0;
				S2: if (reset) next = S0;
						else if(input_bit) next = S2;
						else next = S3;
				S3: if (reset) next = S0;
						else if(input_bit) next = S4;
						else next = S0;
				S4: if (reset) next = S0;
						else if(input_bit) next = S2;
						else next = S0;
		endcase

	end
	// output logic described using continuous assignment
	assign Y = (present == S4);
endmodule

// Test bench for p1.v
module tb_p1();
	reg clock, reset,input_bit;
	wire Y;
	wire[2:0] present;
	integer i;
	p1 UUT(Y,present,clock,reset,input_bit);
	reg[20:1] Sequence = 20'b11101101001001101101;
	initial reset = 1'b1;
	always #10 clock = ~clock;
	initial
		begin
		clock = 1'b1;
		reset = 1'b0;
		for (i=20;i>0;i=i-1)
		begin
			input_bit = Sequence[i]; #20
			$monitor("Sequence Bit = %b  |  Output = %b  |  reset = %b\n    time=", input_bit, Y, reset, $time);
		end
	end
endmodule
