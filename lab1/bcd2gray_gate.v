// bcd2gray_gate.v
// Gate-level BCD (4-bit) to Gray code converter
module bcd2gray_gate(
    output [3:0] gray,
    input  [3:0] bcd
);
    // Gray = b ^ (b >> 1)
    // g3 = b3
    // g2 = b3 ^ b2
    // g1 = b2 ^ b1
    // g0 = b1 ^ b0
    xor (gray[3], bcd[3], 1'b0); // gray[3] = bcd[3]
    xor (gray[2], bcd[3], bcd[2]);
    xor (gray[1], bcd[2], bcd[1]);
    xor (gray[0], bcd[1], bcd[0]);
endmodule
