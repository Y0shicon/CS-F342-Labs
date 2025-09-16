// File: reg_32bit_we.v
// 32-bit register with synchronous write enable (preferred for full regfile)
module reg_32bit_we(
  output reg [31:0] q,
  input [31:0] d,
  input clk,
  input reset,        // active-low
  input write_enable  // synchronous enable
);

  always @(posedge clk or negedge reset) begin
    if (!reset)
      q <= 32'b0;
    else if (write_enable)
      q <= d;
  end

endmodule
