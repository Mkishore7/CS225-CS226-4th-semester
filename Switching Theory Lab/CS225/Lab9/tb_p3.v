module tb_p3();
  reg[15:0] D;
  reg[3:0] S;
  wire Z;
  integer i;
  p3 UUT(Z, D, S);
  initial
  begin
    #10 $monitor(" D = %b", D, " , S = %b", S, " , Z = ", Z);
    for( i = 1; i <= 65535; i = i * 2)
    begin
    D = i;
    S = 0; #10;
    S = 1; #10;
    S = 2; #10;
    S = 3; #10;
    S = 4; #10;
    S = 5; #10;
    S = 6; #10;
    S = 7; #10;
    S = 8; #10;
    S = 9; #10;
    S = 10; #10;
    S = 11; #10;
    S = 12; #10;
    S = 13; #10;
    S = 14; #10;
    S = 15; #10;
    $display("-----------------------------------------");
    end
  end
endmodule

