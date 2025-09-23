// tb_comparator.v - testbench to validate all comparator implementations
`timescale 1ns/1ps
module tb_comparator;
    reg [3:0] A, B;
    wire gt_b, eq_b, lt_b;
    wire gt_d, eq_d, lt_d;
    wire gt_g, eq_g, lt_g;

    comparator_behav U_beh(.A(A), .B(B), .A_gt_B(gt_b), .A_eq_B(eq_b), .A_lt_B(lt_b));
    comparator_dataflow U_d(.A(A), .B(B), .A_gt_B(gt_d), .A_eq_B(eq_d), .A_lt_B(lt_d));
    comparator_gate U_g(.A(A), .B(B), .A_gt_B(gt_g), .A_eq_B(eq_g), .A_lt_B(lt_g));

    integer i,j;
    initial begin
        $display("Time A B | beh(gt eq lt) | data(gt eq lt) | gate(gt eq lt)"); 
        $display("------------------------------------------------------------"); 
        for (i=0; i<16; i=i+1) begin
            for (j=0; j<16; j=j+1) begin
                A = i; B = j; #1;
                $display("%0t  %2d %2d |   %b  %b  %b   |   %b  %b  %b    |   %b  %b  %b", $time, A, B, gt_b, eq_b, lt_b, gt_d, eq_d, lt_d, gt_g, eq_g, lt_g);
                // simple check
                if ((gt_b !== gt_d) || (eq_b !== eq_d) || (lt_b !== lt_d)) $display("Mismatch between beh and data for A=%0d B=%0d", A, B);
                if ((gt_b !== gt_g) || (eq_b !== eq_g) || (lt_b !== lt_g)) $display("Mismatch between beh and gate for A=%0d B=%0d", A, B);
            end
        end
        $display("Comparator test finished."); #5 $finish;
    end
endmodule
