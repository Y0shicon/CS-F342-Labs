// sel: 2-bit select
// 00 -> in0, 01 -> in1, otherwise -> in2
module bit32_3to1mux(out, sel, in0, in1, in2);
  input [31:0] in0, in1, in2;
  input [1:0] sel;
  output [31:0] out;

  assign out = (sel == 2'b00) ? in0 :
               (sel == 2'b01) ? in1 : in2;
endmodule
