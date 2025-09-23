// mux4to1_gate.v - gate-level 4:1 multiplexer
module mux4to1_gate(
    output out,
    input  [3:0] in,   // in[3] is MSB, in[0] is LSB
    input  [1:0] sel   // sel[1]=MSB, sel[0]=LSB
);
    wire nsel1, nsel0;
    wire a1, a2, a3, a4;
    not (nsel1, sel[1]);
    not (nsel0, sel[0]);
    and (a1, in[0], nsel1, nsel0); // sel=00 -> in[0]
    and (a2, in[1], nsel1, sel[0]); // sel=01 -> in[1]
    and (a3, in[2], sel[1], nsel0); // sel=10 -> in[2]
    and (a4, in[3], sel[1], sel[0]); // sel=11 -> in[3]
    or  (out, a1, a2, a3, a4);
endmodule
