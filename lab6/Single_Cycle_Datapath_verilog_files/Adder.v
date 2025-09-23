// FILE: Adder.v
module Adder(
    input  wire [31:0] A,
    input  wire [31:0] B,
    output wire [31:0] Sum
);
    assign Sum = A + B;
endmodule
