`include "mux2to1.v"

module bit32_2to1mux(out, sel, in1, in2);
  input [31:0] in1, in2;
  output [31:0] out;
  input sel;

  genvar i;
  generate
    for (i = 0; i < 32; i = i + 1) begin : mux_loop
      mux2to1 m(out[i], sel, in1[i], in2[i]);
    end
  endgenerate
endmodule
