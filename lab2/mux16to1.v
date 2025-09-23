// mux16to1.v - hierarchical 16:1 multiplexer built from four 4:1 muxes and one 4:1 mux
module mux16to1(
    output out,
    input  [15:0] in,   // in[15]...in[0]
    input  [3:0] sel    // sel[3]=MSB ... sel[0]=LSB
);
    wire [3:0] mid; // outputs of first-level muxes
    // lower two select bits select inside 4:1, upper two select which group
    mux4to1_gate m0(mid[0], in[3:0],   sel[1:0]);
    mux4to1_gate m1(mid[1], in[7:4],   sel[1:0]);
    mux4to1_gate m2(mid[2], in[11:8],  sel[1:0]);
    mux4to1_gate m3(mid[3], in[15:12], sel[1:0]);
    mux4to1_gate mtop(out, mid, sel[3:2]);
endmodule
