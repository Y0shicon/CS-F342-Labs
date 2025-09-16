// File: data_memory_simple.v
// Simple data memory from the sheet: returns the address (useful for early testing)
module data_memory_simple(
  input [31:0] addr,
  output reg [31:0] data_out
);
  always @(*) begin
    data_out = addr;
  end
endmodule
