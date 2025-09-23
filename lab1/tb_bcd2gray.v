// tb_bcd2gray.v - testbench for BCD->Gray modules
`timescale 1ns/1ps
module tb_bcd2gray;
    reg [3:0] bcd;
    wire [3:0] gray_gate, gray_dataflow;

    bcd2gray_gate U1(.gray(gray_gate), .bcd(bcd));
    bcd2gray_dataflow U2(.bcd(bcd), .gray(gray_dataflow));

    integer i;
    initial begin
        $display("Time  BCD  Gray_gate Gray_dataflow"); 
        $display("--------------------------------"); 
        for (i = 0; i < 10; i = i + 1) begin // test BCD 0..9
            bcd = i;
            #5;
            $display("%0t   %0d    %b        %b", $time, bcd, gray_gate, gray_dataflow);
            if (gray_gate !== gray_dataflow) begin
                $display("Mismatch at BCD=%0d: gate=%b dataflow=%b", bcd, gray_gate, gray_dataflow);
            end
        end
        $display("Test finished."); 
        #5 $finish;
    end
endmodule
