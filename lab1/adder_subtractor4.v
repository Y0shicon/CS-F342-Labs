// adder_subtractor4.v - 4-bit adder/subtractor using ripple-carry and 1-bit full adders
// If S=0 -> Sum = A + B
// If S=1 -> Sum = A - B  (computed as A + (~B) + 1)
module adder_subtractor4(
    input  [3:0] A,
    input  [3:0] B,
    input        S,    // 0 = add, 1 = subtract
    output [3:0] Result,
    output       CarryOut
);
    wire [3:0] B_xor;
    wire c0, c1, c2, c3;
    assign B_xor = B ^ {4{S}}; // if S==1, invert B (two's complement)
    // initial carry = S (1 for subtraction)
    fulladder_gate fa0(.a(A[0]), .b(B_xor[0]), .cin(S),   .sum(Result[0]), .cout(c0));
    fulladder_gate fa1(.a(A[1]), .b(B_xor[1]), .cin(c0),  .sum(Result[1]), .cout(c1));
    fulladder_gate fa2(.a(A[2]), .b(B_xor[2]), .cin(c1),  .sum(Result[2]), .cout(c2));
    fulladder_gate fa3(.a(A[3]), .b(B_xor[3]), .cin(c2),  .sum(Result[3]), .cout(c3));
    assign CarryOut = c3;
endmodule
