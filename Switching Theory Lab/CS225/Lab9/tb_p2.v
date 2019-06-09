module tb_p2(); //test_bench
  wire[15:0] ans;
  reg [15:0] x,y;
  reg [2:0] operation;
  integer i;
  p2 UUT (ans, operation, x, y);
  initial
  begin //checking for random values of A,B
    for( i = 0; i <= 7; i = i + 1)
    begin
      x=$urandom%2**15;
      y=$urandom%2**15;
      operation=i;
      $monitor("operation = %b", i," , first number = %b", x, " , second number = %b", y, " => result= %b", ans);
      #10;
      $display("-----------------------------------------");
    end
  end 
endmodule
