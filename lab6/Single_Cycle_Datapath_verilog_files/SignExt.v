// FILE: SignExt.v
module SignExt(
    input  wire [15:0] imm16,
    output wire [31:0] imm32
);
    assign imm32 = {{16{imm16[15]}}, imm16};
endmodule
