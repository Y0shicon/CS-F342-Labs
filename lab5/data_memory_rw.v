// File: data_memory_rw.v
// 32-word data memory with synchronous write and combinational read.
// Ports: clk, MemRead, MemWrite, addr, WriteData -> DataOut
module data_memory_rw(
  input clk,
  input MemRead,
  input MemWrite,
  input [31:0] addr,
  input [31:0] WriteData,
  output reg [31:0] DataOut
);

  reg [31:0] mem [31:0];
  wire [4:0] index = addr[6:2]; // word-aligned index

  always @(posedge clk) begin
    if (MemWrite) begin
      mem[index] <= WriteData;
    end
  end

  always @(*) begin
    if (MemRead)
      DataOut = mem[index];
    else
      DataOut = 32'b0;
  end

endmodule
