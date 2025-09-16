module tb_main_control;
  reg [5:0] Op;
  wire RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp2;

  ANDarray ctrl(RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp2, Op);

  initial begin
    $display("Op     RegDst ALUSrc MemtoReg RegWrite MemRead MemWrite Branch ALUOp1 ALUOp2");
    Op = 6'b000000; #10 $display("%b  %b      %b      %b       %b      %b      %b      %b      %b     %b", Op, RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp2); // R-format
    Op = 6'b100011; #10 $display("%b  %b      %b      %b       %b      %b      %b      %b      %b     %b", Op, RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp2); // lw
    Op = 6'b101011; #10 $display("%b  %b      %b      %b       %b      %b      %b      %b      %b     %b", Op, RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp2); // sw
    Op = 6'b000100; #10 $display("%b  %b      %b      %b       %b      %b      %b      %b      %b     %b", Op, RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp2); // beq
    $finish;
  end
endmodule
