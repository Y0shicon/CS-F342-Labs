// tb_adders.v - simple testbench for 8-bit and 32-bit adders (sample tests)
`timescale 1ns/1ps
module tb_adders;
    reg [7:0] A8, B8;
    reg       Cin8;
    wire [7:0] Sum8;
    wire Cout8;

    adder8 U8(.A(A8), .B(B8), .Cin(Cin8), .Sum(Sum8), .Cout(Cout8));

    reg [31:0] A32, B32;
    reg        Cin32;
    wire [31:0] Sum32;
    wire Cout32;
    adder32_from8 U32(.A(A32), .B(B32), .Cin(Cin32), .Sum(Sum32), .Cout(Cout32));

    initial begin
        $display("8-bit adder tests:"); 
        A8 = 8'd15; B8 = 8'd20; Cin8 = 0; #1;
        $display("A=%0d B=%0d Cin=%b -> Sum=%0d Cout=%b", A8, B8, Cin8, Sum8, Cout8);
        A8 = 8'd200; B8 = 8'd100; Cin8 = 1; #1;
        $display("A=%0d B=%0d Cin=%b -> Sum=%0d Cout=%b", A8, B8, Cin8, Sum8, Cout8);

        $display("\n32-bit adder tests:"); 
        A32 = 32'h0000FFFF; B32 = 32'h00000001; Cin32 = 0; #1;
        $display("A=%h B=%h Cin=%b -> Sum=%h Cout=%b", A32, B32, Cin32, Sum32, Cout32);
        A32 = 32'h7FFFFFFF; B32 = 32'h00000001; Cin32 = 0; #1;
        $display("A=%h B=%h Cin=%b -> Sum=%h Cout=%b", A32, B32, Cin32, Sum32, Cout32);

        $display("Adder tests finished."); #5 $finish;
    end
endmodule
