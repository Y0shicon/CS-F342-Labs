// fulladder_dataflow.v - 1-bit full adder (dataflow)
module fulladder_dataflow(
    input  a,
    input  b,
    input  cin,
    output sum,
    output cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule
