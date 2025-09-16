module ALUcontrol(ALUOp1, ALUOp2, Funct, ALUControl);
  input ALUOp1, ALUOp2;
  input [3:0] Funct; // 4 LSBs of function field (as per lab sheet)
  output reg [2:0] ALUControl;

  always @(*) begin
    // default
    ALUControl = 3'b000;
    // ALUOp = 00 -> ADD
    if ({ALUOp1, ALUOp2} == 2'b00) begin
      ALUControl = 3'b010; // add
    end
    // ALUOp = 01 -> SUB (for beq)
    else if ({ALUOp1, ALUOp2} == 2'b01) begin
      ALUControl = 3'b110; // sub
    end
    // ALUOp = 10 -> R-type, use Funct
    else if ({ALUOp1, ALUOp2} == 2'b10) begin
      case (Funct)
        4'b0000: ALUControl = 3'b010; // add
        4'b0010: ALUControl = 3'b110; // sub
        4'b0100: ALUControl = 3'b000; // and
        4'b0101: ALUControl = 3'b001; // or
        default: ALUControl = 3'b010; // safe default ADD
      endcase
    end
    else begin
      ALUControl = 3'b010;
    end
  end
endmodule
