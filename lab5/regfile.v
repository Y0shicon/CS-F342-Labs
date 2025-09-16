// File: RegFile.v
// Register file:
//  - 32 registers of 32-bit width (regs[0] .. regs[31])
//  - Two asynchronous read ports (ReadData1, ReadData2 are combinational)
//  - One synchronous write port (WriteData written on rising clk when RegWrite asserted)
//  - active-low reset clears all regs to 0
//  - register 0 is maintained as zero (writes to r0 ignored)
module RegFile(
  input clk,
  input reset,                 // active-low
  input [4:0] ReadReg1,
  input [4:0] ReadReg2,
  input [31:0] WriteData,
  input [4:0] WriteReg,
  input RegWrite,
  output [31:0] ReadData1,
  output [31:0] ReadData2
);

  // internal register array
  reg [31:0] regs [31:0];

  integer i;

  // asynchronous read ports - combinational
  assign ReadData1 = regs[ReadReg1];
  assign ReadData2 = regs[ReadReg2];

  // synchronous write (with decoder generating per-register enable)
  wire [31:0] write_onehot;
  decoder5_32 dec(.reg_no(WriteReg), .onehot(write_onehot));

  always @(posedge clk or negedge reset) begin
    if (!reset) begin
      for (i = 0; i < 32; i = i + 1)
        regs[i] <= 32'b0;
    end
    else begin
      // write to registers where onehot bit is set AND RegWrite asserted
      for (i = 0; i < 32; i = i + 1) begin
        if (RegWrite && write_onehot[i]) begin
          if (i == 0)
            regs[i] <= 32'b0; // register $zero is hardwired to 0 (common MIPS behavior)
          else
            regs[i] <= WriteData;
        end
      end
    end
  end

endmodule
