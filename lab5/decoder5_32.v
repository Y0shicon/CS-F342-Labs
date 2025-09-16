// File: decoder5_32.v
// 5-to-32 decoder: input reg_no (5-bit) -> 32-bit one-hot output
module decoder5_32(
  input [4:0] reg_no,
  output reg [31:0] onehot
);

  integer i;
  always @(*) begin
    onehot = 32'b0;
    onehot[reg_no] = 1'b1;   // safe behavioral one-hot generation
  end

endmodule
