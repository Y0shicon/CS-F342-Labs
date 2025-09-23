// FILE: Shifter.v
// shift left by 2 (used for branch address calc)
module Shifter(
    input  wire [31:0] in,
    output wire [31:0] out
);
    assign out = {in[29:0], 2'b00};
endmodule
