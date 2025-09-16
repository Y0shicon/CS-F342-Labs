module bit32adder(Cout, Sum, In1, In2, Cin);
  input [31:0] In1, In2;
  input Cin;
  output [31:0] Sum;
  output Cout;

  // vector addition: produces carry-out as MSB of the wider vector
  assign {Cout, Sum} = In1 + In2 + Cin;
endmodule
