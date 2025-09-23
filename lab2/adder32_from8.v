// adder32_from8.v - 32-bit adder built from four 8-bit adders (ripple carry)
module adder32_from8(
    input  [31:0] A,
    input  [31:0] B,
    input         Cin,
    output [31:0] Sum,
    output        Cout
);
    wire c8, c16, c24;
    adder8 a0(.A(A[7:0]),   .B(B[7:0]),   .Cin(Cin), .Sum(Sum[7:0]),   .Cout(c8));
    adder8 a1(.A(A[15:8]),  .B(B[15:8]),  .Cin(c8),  .Sum(Sum[15:8]),  .Cout(c16));
    adder8 a2(.A(A[23:16]), .B(B[23:16]), .Cin(c16), .Sum(Sum[23:16]), .Cout(c24));
    adder8 a3(.A(A[31:24]), .B(B[31:24]), .Cin(c24), .Sum(Sum[31:24]), .Cout(Cout));
endmodule
