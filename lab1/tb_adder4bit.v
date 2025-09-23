// tb_adder4bit.v - testbench for 4-bit adder (exhaustive A,B 0..15, Cin=0,1)
`timescale 1ns/1ps
module tb_adder4bit;
    reg [3:0] A, B;
    reg Cin;
    wire [3:0] Sum;
    wire Cout;

    adder4bit U(.A(A), .B(B), .Cin(Cin), .Sum(Sum), .Cout(Cout));

    integer i,j;
    initial begin
        $display("Time A  B  Cin | Sum Cout | expected (A+B+Cin)"); 
        $display("-----------------------------------------------"); 
        for (i=0; i<16; i=i+1) begin
            for (j=0; j<16; j=j+1) begin
                A = i; B = j;
                for (Cin=0; Cin<2; Cin=Cin+1) begin
                    #1;
                    $display("%0t  %2d %2d  %b  |  %2d   %b  |   %2d", $time, A, B, Cin, Sum, Cout, (A + B + Cin));
                    if ({Cout, Sum} !== (A + B + Cin)) $display("Mismatch at A=%0d B=%0d Cin=%b -> got=%0d expected=%0d", A, B, Cin, {Cout, Sum}, (A + B + Cin));
                end
            end
        end
        $display("4-bit adder test finished."); #5 $finish;
    end
endmodule
