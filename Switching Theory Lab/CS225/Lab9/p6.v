// listing all inputs and outputs, by convention outputs go first
module decoder(Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7, C, B, A, enable);
  output Y7, Y6, Y5, Y4, Y3, Y2, Y1, Y0;
  input A, B, C;
  input enable;
  //behavioral approach
  assign {Y7,Y6,Y5,Y4,Y3,Y2,Y1,Y0} = ( {enable,A,B,C} == 4'b1000) ? 8'b0000_0001 :  ( {enable,A,B,C} == 4'b1001) ? 8'b0000_0010 :  ( {enable,A,B,C} == 4'b1010) ? 8'b0000_0100 :  ( {enable,A,B,C} == 4'b1011) ? 8'b0000_1000 :  ( {enable,A,B,C} == 4'b1100) ? 8'b0001_0000 :  ( {enable,A,B,C} == 4'b1101) ? 8'b0010_0000 :  ( {enable,A,B,C} == 4'b1110) ? 8'b0100_0000 :  ( {enable,A,B,C} == 4'b1111) ? 8'b1000_0000 :  8'b0000_0000;
endmodule



module p6(out,in);
  output [63:0] out;
  input [5:0] in;
  decoder maingate (a,b,c,d,e,f,g,h,in[3],in[4],in[5],1);
  decoder d1
  (out[0],out[1],out[2],out[3],out[4],out[5],out[6],out[7],in[0],in[1],in[2],a);
  decoder d2
  (out[8],out[9],out[10],out[11],out[12],out[13],out[14],out[15],in[0],in[1],in[2],b);
  decoder d3
  (out[16],out[17],out[18],out[19],out[20],out[21],out[22],out[23],in[0],in[1],in[2],c);
  decoder d4
  (out[24],out[25],out[26],out[27],out[28],out[29],out[30],out[31],in[0],in[1],in[2],d);
  decoder d5
  (out[32],out[33],out[34],out[35],out[36],out[37],out[38],out[39],in[0],in[1],in[2],e);
  decoder d6
  (out[40],out[41],out[42],out[43],out[44],out[45],out[46],out[47],in[0],in[1],in[2],f);
  decoder d7
  (out[48],out[49],out[50],out[51],out[52],out[53],out[54],out[55],in[0],in[1],in[2],g);
  decoder d8
  (out[56],out[57],out[58],out[59],out[60],out[61],out[62],out[63],in[0],in[1],in[2],h);
endmodule

