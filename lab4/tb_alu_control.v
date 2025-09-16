module tb_alu_control;
  reg ALUOp1, ALUOp2;
  reg [3:0] Funct;
  wire [2:0] ALUControl;

  ALUcontrol uut(ALUOp1, ALUOp2, Funct, ALUControl);

  initial begin
    $display("ALUOp1 ALUOp2 Funct ALUControl");
    // lw/sw -> ALUOp = 00 -> add
    ALUOp1 = 0; ALUOp2 = 0; Funct = 4'bxxxx; #5 $display("  %b      %b    -    %b", ALUOp1, ALUOp2, ALUControl);
    // beq -> ALUOp = 01 -> sub
    ALUOp1 = 0; ALUOp2 = 1; #5 $display("  %b      %b    -    %b", ALUOp1, ALUOp2, ALUControl);
    // R-type add (funct low4 0000)
    ALUOp1 = 1; ALUOp2 = 0; Funct = 4'b0000; #5 $display("  %b      %b   %b   %b", ALUOp1, ALUOp2, Funct, ALUControl);
    // R-type sub
    Funct = 4'b0010; #5 $display("  %b      %b   %b   %b", ALUOp1, ALUOp2, Funct, ALUControl);
    // R-type and
    Funct = 4'b0100; #5 $display("  %b      %b   %b   %b", ALUOp1, ALUOp2, Funct, ALUControl);
    // R-type or
    Funct = 4'b0101; #5 $display("  %b      %b   %b   %b", ALUOp1, ALUOp2, Funct, ALUControl);
    $finish;
  end
endmodule
