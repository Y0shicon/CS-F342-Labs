// File: mux4_1.v
// 4-to-1 mux where each data input is 32-bit wide.
// ports: out, q1, q2, q3, q4, reg_no (2-bit select)
module mux4_1(
  output [31:0] out,
  input [31:0] q1, q2, q3, q4,
  input [1:0] reg_no
);

  assign out = (reg_no == 2'b00) ? q1 :
               (reg_no == 2'b01) ? q2 :
               (reg_no == 2'b10) ? q3 : q4;

endmodule

