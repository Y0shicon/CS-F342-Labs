// tb_fadder.v - testbench for FADDER (1-bit) - exhaustive
`timescale 1ns/1ps
module tb_fadder;
    reg x,y,z;
    wire s,c;
    integer i;
    FADDER U(.s(s), .c(c), .x(x), .y(y), .z(z));
    initial begin
        $display("Time x y z | s c"); 
        $display("----------------"); 
        for (i=0; i<8; i=i+1) begin
            {x,y,z} = i; #1;
            $display("%0t  %b %b %b | %b %b", $time, x, y, z, s, c);
        end
        $display("FADDER test finished."); #5 $finish;
    end
endmodule
