module p3(out,D,S);
  // listing all inputs and outputs, by convention outputs go first
  output out; 
  input [15:0]D;
  input [3:0]S;

  //behavioral approach
  assign out = D[S];
endmodule