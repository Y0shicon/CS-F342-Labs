// fulladder_gate.v - 1-bit full adder (gate level)
module fulladder_gate(
    input  a,
    input  b,
    input  cin,
    output sum,
    output cout
);
    wire axb, aandb, bxorcin;
    xor (axb, a, b);
    xor (sum, axb, cin);
    and (aandb, a, b);
    and (bxorcin, axb, cin);
    or  (cout, aandb, bxorcin);
endmodule
