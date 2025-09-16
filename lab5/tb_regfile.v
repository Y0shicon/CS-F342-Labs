// File: tb_RegFile.v
`timescale 1ns/1ps
module tb_RegFile;
  reg clk, reset;
  reg [4:0] ReadReg1, ReadReg2;
  reg [31:0] WriteData;
  reg [4:0] WriteReg;
  reg RegWrite;
  wire [31:0] ReadData1, ReadData2;

  RegFile UUT(
    .clk(clk),
    .reset(reset),
    .ReadReg1(ReadReg1),
    .ReadReg2(ReadReg2),
    .WriteData(WriteData),
    .WriteReg(WriteReg),
    .RegWrite(RegWrite),
    .ReadData1(ReadData1),
    .ReadData2(ReadData2)
  );

  // clock
  initial begin
    clk = 1'b0;
    forever #5 clk = ~clk; // 10ns period
  end

  initial begin
    // initialize
    reset = 1'b0; RegWrite = 0; WriteData = 0; WriteReg = 0;
    ReadReg1 = 5'd0; ReadReg2 = 5'd0;
    #20;        // keep reset low for a couple cycles
    reset = 1'b1;

    // Write values into registers 1..5 sequentially
    #10;
    RegWrite = 1'b1;
    WriteReg = 5'd1; WriteData = 32'h0000_0001; #10; // write at rising edge
    WriteReg = 5'd2; WriteData = 32'h0000_0002; #10;
    WriteReg = 5'd3; WriteData = 32'hDEAD_BEEF; #10;
    WriteReg = 5'd4; WriteData = 32'hCAFEBABE; #10;
    WriteReg = 5'd5; WriteData = 32'h0000_0100; #10;
    RegWrite = 1'b0;

    // Read back a couple of registers
    #10;
    ReadReg1 = 5'd1; ReadReg2 = 5'd3; #5;
    $display("Read1 (r1) = %h, Read2 (r3) = %h", ReadData1, ReadData2);

    // Try write to r0 (should remain zero)
    RegWrite = 1'b1; WriteReg = 5'd0; WriteData = 32'hFFFF_FFFF; #10; RegWrite = 0;
    ReadReg1 = 5'd0; #5;
    $display("Read r0 (should be 0) = %h", ReadData1);

    // Random reads
    ReadReg1 = 5'd4; ReadReg2 = 5'd5; #5;
    $display("r4 = %h, r5 = %h", ReadData1, ReadData2);

    #20 $finish;
  end

endmodule
