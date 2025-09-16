module d_ff(
  output reg q,
  input d,
  input clk,
  input reset   // active-low: reset when reset == 0
);

  always @(posedge clk or negedge reset) begin
    if (!reset)
      q <= 1'b0;
    else
      q <= d;
  end

endmodule
