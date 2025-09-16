module ANDarray(RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp2, Op);
  input [5:0] Op;
  output RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp2;

  wire Rformat, lw, sw, beq;

  assign Rformat = (Op == 6'b000000);
  assign lw      = (Op == 6'b100011); // lw opcode 35
  assign sw      = (Op == 6'b101011); // sw opcode 43
  assign beq     = (Op == 6'b000100); // beq opcode 4

  assign RegDst  = Rformat;
  assign ALUSrc  = lw | sw;
  assign MemtoReg= lw;
  assign RegWrite= Rformat | lw;
  assign MemRead = lw;
  assign MemWrite= sw;
  assign Branch  = beq;
  // ALUOp bits: {ALUOp1, ALUOp2} where:
  // R-format -> 10, lw/sw -> 00 (add), beq -> 01 (subtract)
  assign ALUOp1  = Rformat; // MSB
  assign ALUOp2  = beq;     // LSB
endmodule
