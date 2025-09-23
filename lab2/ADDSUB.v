// ADDSUB.v - 4-bit adder/subtractor using FULLADDER. M=0 -> add, M=1 -> subtract.
// Outputs 4-bit result and overflow flag V (signed overflow)
module ADDSUB(
    input  [3:0] A,
    input  [3:0] B,
    input        M,    // 0 add, 1 subtract
    output [3:0] R,
    output       V     // overflow (two's complement)
);
    wire [3:0] Bx;
    wire c0,c1,c2,c3;
    assign Bx = B ^ {4{M}}; // if M==1, invert B
    FULLADDER f0(.a(A[0]), .b(Bx[0]), .cin(M), .sum(R[0]), .cout(c0));
    FULLADDER f1(.a(A[1]), .b(Bx[1]), .cin(c0), .sum(R[1]), .cout(c1));
    FULLADDER f2(.a(A[2]), .b(Bx[2]), .cin(c1), .sum(R[2]), .cout(c2));
    FULLADDER f3(.a(A[3]), .b(Bx[3]), .cin(c2), .sum(R[3]), .cout(c3));
    // overflow for two's complement = carry into MSB XOR carry out of MSB
    assign V = c2 ^ c3;
endmodule
