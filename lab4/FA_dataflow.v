module FA_dataflow(Cout, Sum, In1, In2, Cin);
  input In1, In2, Cin;
  output Cout, Sum;
  assign {Cout, Sum} = In1 + In2 + Cin;
endmodule
