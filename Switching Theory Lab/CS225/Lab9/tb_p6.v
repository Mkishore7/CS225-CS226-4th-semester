// listing all inputs and outputs, by convention outputs go first
module tb_p6();
  reg [5:0]D;
  wire [63:0]Z;
  integer i;
  p6 UUT (Z,D);
  initial
  begin
    #10 $monitor("D = %b",D, " , Z=%b",Z);
    for(i=0;i<=63;i=i+1)
    begin
      D=i; #10;
    end
  end
endmodule
