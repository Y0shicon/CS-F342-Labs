// tb_mux16.v - testbench for mux16to1
`timescale 1ns/1ps
module tb_mux16;
    reg [15:0] in;
    reg [3:0] sel;
    wire out;

    mux16to1 uut(.out(out), .in(in), .sel(sel));

    integer i;
    initial begin
        $display("Time sel in(one-hot) -> out"); 
        for (i = 0; i < 16; i = i + 1) begin
            sel = i;
            in = 16'b0;
            in[i] = 1'b1; // one-hot at position i
            #1;
            $display("%0t  %b   %b -> %b", $time, sel, in, out);
        end
        $display("Mux16 test finished."); #5 $finish;
    end
endmodule
