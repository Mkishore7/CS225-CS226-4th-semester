// listing all inputs and outputs, by convention outputs go first
module tb_p5();
  wire [63:0]Z;
  reg [5:0]D;
  integer i;
  p5 UUT (Z,D);
  initial
  begin
    #10 $monitor("D = %b",D, " , Z=%b",Z);
    for(i=0;i<=63;i=i+1)
    begin
      D=i; #10;
    end
  end
endmodule

