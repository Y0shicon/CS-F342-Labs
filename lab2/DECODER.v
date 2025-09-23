// DECODER.v - 3-to-8 decoder (gate level)
module DECODER(
    output d0, output d1, output d2, output d3,
    output d4, output d5, output d6, output d7,
    input  x, input y, input z
);
    wire x0, y0, z0;
    not n1(x0, x);
    not n2(y0, y);
    not n3(z0, z);
    and a0(d0, x0, y0, z0);
    and a1(d1, x0, y0, z);
    and a2(d2, x0, y, z0);
    and a3(d3, x0, y, z);
    and a4(d4, x, y0, z0);
    and a5(d5, x, y0, z);
    and a6(d6, x, y, z0);
    and a7(d7, x, y, z);
endmodule
