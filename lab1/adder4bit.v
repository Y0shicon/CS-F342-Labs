// adder4bit.v - 4-bit ripple-carry adder using 1-bit full adders
module adder4bit(
    input  [3:0] A,
    input  [3:0] B,
    input        Cin,
    output [3:0] Sum,
    output       Cout
);
    wire c1, c2, c3;
    fulladder_gate fa0(.a(A[0]), .b(B[0]), .cin(Cin), .sum(Sum[0]), .cout(c1));
    fulladder_gate fa1(.a(A[1]), .b(B[1]), .cin(c1),  .sum(Sum[1]), .cout(c2));
    fulladder_gate fa2(.a(A[2]), .b(B[2]), .cin(c2),  .sum(Sum[2]), .cout(c3));
    fulladder_gate fa3(.a(A[3]), .b(B[3]), .cin(c3),  .sum(Sum[3]), .cout(Cout));
endmodule
