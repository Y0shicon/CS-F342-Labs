// tb_addsub4.v - testbench for 4-bit adder/subtractor (exhaustive tests)
`timescale 1ns/1ps
module tb_addsub4;
    reg [3:0] A, B;
    reg S;
    wire [3:0] Result;
    wire CarryOut;

    adder_subtractor4 U(.A(A), .B(B), .S(S), .Result(Result), .CarryOut(CarryOut));

    integer i,j;
    initial begin
        $display("Time A  B  S | Result CarryOut | expected"); 
        $display("-------------------------------------------"); 
        for (i=0; i<16; i=i+1) begin
            for (j=0; j<16; j=j+1) begin
                A = i; B = j;
                for (S=0; S<2; S=S+1) begin
                    #1;
                    // compute expected as signed unsigned? Here we show unsigned wrap-around
                    integer expected;
                    expected = (S==0) ? (A + B) : (A - B);
                    $display("%0t  %2d %2d  %b |   %2d    %b   |   %0d", $time, A, B, S, Result, CarryOut, expected);
                    // check using 5-bit arithmetic for direct compare: {CarryOut, Result} should equal (S? A - B : A + B) mod 32
                    integer got;
                    got = {CarryOut, Result};
                    integer exp5;
                    if (S==0) exp5 = A + B;
                    else exp5 = (A - B) & 5'h1F; // match two's complement wrap in 5 bits
                    if (got !== exp5) $display("Mismatch at A=%0d B=%0d S=%b -> got=%0d expected=%0d", A, B, S, got, exp5);
                end
            end
        end
        $display("Adder/Subtractor test finished."); #5 $finish;
    end
endmodule
