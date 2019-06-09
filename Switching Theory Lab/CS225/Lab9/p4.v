// listing all inputs and outputs, by convention outputs go first
module mux(out,D,S);
  output out;
  input [1:0]D;
  input S;
  assign out = D[S];
endmodule


module p4(out,D,S);
  output out;
  input [15:0]D;
  input [3:0]S;
  mux m1(out1,D[1:0],S[0]);
  mux m2(out2,D[3:2],S[0]);
  mux m3(out3,D[5:4],S[0]);
  mux m4(out4,D[7:6],S[0]);
  mux m5(out5,D[9:8],S[0]);
  mux m6(out6,D[11:10],S[0]);
  mux m7(out7,D[13:12],S[0]);
  mux m8(out8,D[15:14],S[0]);
  mux m9(out9,{out2,out1},S[1]);
  mux m10(out10,{out4,out3},S[1]);
  mux m11(out11,{out6,out5},S[1]);
  mux m12(out12,{out8,out7},S[1]);
  mux m13(out13,{out10,out9},S[2]);
  mux m14(out14,{out12,out11},S[2]);
  mux m15(out,{out14,out13},S[3]);
endmodule
