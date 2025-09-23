// tb_compar_signed.v - testbench for signed comparator (Exercise-2 testcases)
`timescale 1ns/1ps
module tb_compar_signed;
    reg [3:0] A;
    reg [3:0] B;
    wire signA, signB;
    wire AgtB, AeqB, AltB;
    compar uut(.A(A), .B(B), .signA(signA), .signB(signB), .AgtB(AgtB), .AeqB(AeqB), .AltB(AltB));

    initial begin
        $display("Time A    B    signedA signedB | AgtB AeqB AltB"); 
        A = 4'b0000; B = 4'b0000; #1; $display("%0t %b %b %0d %0d |   %b    %b    %b", $time, A, B, $signed(A), $signed(B), AgtB, AeqB, AltB);
        A = 4'b1000; B = 4'b1011; #1; $display("%0t %b %b %0d %0d |   %b    %b    %b", $time, A, B, $signed(A), $signed(B), AgtB, AeqB, AltB);
        A = 4'b0010; B = 4'b0111; #1; $display("%0t %b %b %0d %0d |   %b    %b    %b", $time, A, B, $signed(A), $signed(B), AgtB, AeqB, AltB);
        A = 4'b0101; B = 4'b1111; #1; $display("%0t %b %b %0d %0d |   %b    %b    %b", $time, A, B, $signed(A), $signed(B), AgtB, AeqB, AltB);
        $display("Comparator signed tests finished."); #5 $finish;
    end
endmodule
