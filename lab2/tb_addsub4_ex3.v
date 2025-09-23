// tb_addsub4_ex3.v - testbench for ADDSUB (Exercise-3)
`timescale 1ns/1ps
module tb_addsub4_ex3;
    reg [3:0] A, B;
    reg M;
    wire [3:0] R;
    wire V;
    ADDSUB uut(.A(A), .B(B), .M(M), .R(R), .V(V));
    initial begin
        $display("Time A B M | R V (signed A B R)"); 
        A = 4'd3; B = 4'd2; M = 0; #1; $display("%0t %b %b %b | %b %b (%0d %0d %0d)", $time, A, B, M, R, V, $signed(A), $signed(B), $signed(R));
        A = 4'b0111; B = 4'b0001; M = 0; #1; // 7+1 -> overflow?
        $display("%0t %b %b %b | %b %b (%0d %0d %0d)", $time, A, B, M, R, V, $signed(A), $signed(B), $signed(R));
        A = 4'b0111; B = 4'b1001; M = 1; #1; // 7 - (-7) = 14 -> overflow
        $display("%0t %b %b %b | %b %b (%0d %0d %0d)", $time, A, B, M, R, V, $signed(A), $signed(B), $signed(R));
        A = 4'b1000; B = 4'b1000; M = 0; #1; // -8 + -8 = -16 -> overflow
        $display("%0t %b %b %b | %b %b (%0d %0d %0d)", $time, A, B, M, R, V, $signed(A), $signed(B), $signed(R));
        $display("ADDSUB tests finished."); #5 $finish;
    end
endmodule
