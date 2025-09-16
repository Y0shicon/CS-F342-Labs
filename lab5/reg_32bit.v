module reg_32bit(
  output reg [31:0] q,
  input [31:0] d,
  input clk,
  input reset    // active-low reset
);

  always @(posedge clk or negedge reset) begin
    if (!reset)
      q <= 32'b0;
    else
      q <= d;
  end

endmodule
