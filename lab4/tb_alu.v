`include "ALU.v"

module tbALU();
  reg Binvert, Carryin;
  reg [1:0] Operation;
  reg [31:0] a, b;
  wire [31:0] Result;
  wire CarryOut;

  // instantiate ALU (ordered port list as the sheet's testbench expects)
  ALU U1(a, b, Binvert, Carryin, Operation, Result, CarryOut);

  initial begin
    $display("Time Op Binv Cin   a               b               Result         CarryOut");
    a = 32'ha5a5a5a5;
    b = 32'h5a5a5a5a;
    Operation = 2'b00; Binvert = 1'b0; Carryin = 1'b0; // AND
    #100 $display("%0t  %b   %b    %b  %h %h %h %b", $time, Operation, Binvert, Carryin, a, b, Result, CarryOut);
    #0  Operation = 2'b01; // OR
    #100 $display("%0t  %b   %b    %b  %h %h %h %b", $time, Operation, Binvert, Carryin, a, b, Result, CarryOut);
    #0  Operation = 2'b10; // ADD
    Binvert = 1'b0; Carryin = 1'b0;
    #100 $display("%0t  %b   %b    %b  %h %h %h %b", $time, Operation, Binvert, Carryin, a, b, Result, CarryOut);
    #0 Binvert = 1'b1; Carryin = 1'b1; // SUB (a - b)
    #100 $display("%0t  %b   %b    %b  %h %h %h %b", $time, Operation, Binvert, Carryin, a, b, Result, CarryOut);
    #200 $finish;
  end
endmodule
