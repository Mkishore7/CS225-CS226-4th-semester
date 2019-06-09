
module p3(open,clk,reset, c0,c1);
  output[2:0] open;
  input clk, reset;
  input c0,c1;
  reg [2:0] Next;
  reg[2:0]  state;
  parameter [2:0] S0= 3'b000;
  parameter [2:0] S1= 3'b001;
  parameter [2:0] S2 = 3'b010;
  parameter [2:0] S3=3'b011;
  parameter [2:0] S4=3'b100;
  parameter [2:0] S5=3'b101;
  parameter [2:0] S6=3'b110;
  parameter [2:0] S7=3'b111;

  always @(posedge clk) // sequential
  begin
  if (reset) state <= S0;
  else state <= Next;
  end

  always @(state,c0,c1) // combinational
  begin
  case(state)
  S0: if (!c0 && c1)
   		Next = S1;
  	else if (c0 && !c1)
  		Next = S7;
  	else if(c0 && c1)
  		Next = S2;
  S1: if (!c0 && c1)
   		Next = S2;
  	else if (c0 && !c1)
  		Next = S0;
  	else if(c0 && c1)
  		Next = S3;

  S2: if (!c0 && c1)
   		Next = S3;
  	else if (c0 && !c1)
  		Next = S1;
  	else if(c0 && c1)
  		Next = S4;

  S3: if (!c0 && c1)
   		Next = S4;
  	else if (c0 && !c1)
  		Next = S2;
  	else if(c0 && c1)
  		Next = S5;

  S4:if (!c0 && c1)
   		Next = S5;
  	else if (c0 && !c1)
  		Next = S3;
  	else if(c0 && c1)
  		Next = S6;


  S5:if (!c0 && c1)
   		Next = S6;
  	else if (c0 && !c1)
  		Next = S4;
  	else if(c0 && c1)
  		Next = S7;


  S6:if (!c0 && c1)
   		Next = S7;
  	else if (c0 && !c1)
  		Next = S5;
  	else if(c0 && c1)
  		Next = S0;


  S7:if (!c0 && c1)
   		Next = S0;
  	else if (c0 && !c1)
  		Next = S6;
  	else if(c0 && c1)
  		Next = S1;

  	endcase end
  // output logic described using continuous assignment

  assign open = Next;


endmodule


module tb_p3();
  reg reset;
  wire[2:0] open;
  reg clk=0;
  reg c0,c1;
  p3 uut (open,clk,reset, c0,c1);

  always #5 clk = ~clk;

   

  initial
	  begin
		  reset=1'b1; #10;
		  reset=1'b0; c0=1'b0;c1=1'b1;#10;
		  reset=1'b0; c0=1'b1;c1=1'b0;#10;
		  reset=1'b0; c0=1'b1;c1=1'b1;#10;
		  reset=1'b0; c0=1'b0;c1=1'b0;#10;
		  reset=1'b1; #10;
		  reset=1'b0; c0=1'b0;c1=1'b1;#10;
		  reset=1'b0; c0=1'b0;c1=1'b1;#10;
		  reset=1'b1; #10;
	  end
endmodule

