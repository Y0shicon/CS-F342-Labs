// FADDER.v - full adder implemented using the DECODER outputs (dataflow style for outputs)
module FADDER(
    output s,
    output c,
    input  x, input y, input z
);
    wire d0,d1,d2,d3,d4,d5,d6,d7;
    DECODER dec(.d0(d0),.d1(d1),.d2(d2),.d3(d3),.d4(d4),.d5(d5),.d6(d6),.d7(d7),
                .x(x),.y(y),.z(z));
    assign s = d1 | d2 | d4 | d7;
    assign c = d3 | d5 | d6 | d7;
endmodule
