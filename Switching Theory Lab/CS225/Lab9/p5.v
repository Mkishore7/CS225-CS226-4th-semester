// listing all inputs and outputs, by convention outputs go first
module p5(out,D);
  output [63:0]out;
  reg [63:0]out;
  input [5:0]D;
  always@(D)
  //behavioral approach 
  begin
    out=0;
    out[D]=1;
  end
endmodule

