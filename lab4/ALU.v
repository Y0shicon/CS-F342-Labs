`include "bit32AND.v"
`include "bit32OR.v"
`include "bit32adder.v"

module ALU(a, b, Binvert, Carryin, Operation, Result, CarryOut);
  input [31:0] a, b;
  input Binvert;        // when 1 -> invert b (for subtraction)
  input Carryin;        // carry-in to adder (usually 0 for add, 1 for subtract)
  input [1:0] Operation; // 00 AND, 01 OR, 10 ADD/SUB
  output reg [31:0] Result;
  output CarryOut;

  wire [31:0] b2;
  wire [31:0] sum;
  wire cout;

  // invert b if Binvert=1
  assign b2 = b ^ {32{Binvert}};

  // 32-bit adder (a + b2 + Carryin)
  bit32adder ADDER (cout, sum, a, b2, Carryin);

  assign CarryOut = cout;

  always @(*) begin
    case (Operation)
      2'b00: Result = a & b;
      2'b01: Result = a | b;
      2'b10: Result = sum; // ADD or SUB depending on Binvert & Carryin
      default: Result = 32'h00000000;
    endcase
  end
endmodule
