// tb_fulladder.v - Testbench for 1-bit full adder (all 8 cases)
`timescale 1ns/1ps
module tb_fulladder;
    reg a, b, cin;
    wire sum_g, cout_g;
    wire sum_d, cout_d;

    fulladder_gate U1(.a(a), .b(b), .cin(cin), .sum(sum_g), .cout(cout_g));
    fulladder_dataflow U2(.a(a), .b(b), .cin(cin), .sum(sum_d), .cout(cout_d));

    integer i;
    initial begin
        $display("Time a b cin | gate(sum cout) | data(sum cout)"); 
        $display("----------------------------------------------"); 
        for (i=0; i<8; i=i+1) begin
            {a,b,cin} = i; #1;
            $display("%0t   %b %b  %b  |    %b   %b    |   %b   %b", $time, a, b, cin, sum_g, cout_g, sum_d, cout_d);
            if ((sum_g !== sum_d) || (cout_g !== cout_d)) $display("Mismatch at case %0d", i);
        end
        $display("Full adder test finished."); #5 $finish;
    end
endmodule
