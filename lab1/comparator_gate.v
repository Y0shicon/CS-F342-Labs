// comparator_gate.v - 4-bit comparator (gate-level)
module comparator_gate(
    input  [3:0] A,
    input  [3:0] B,
    output      A_gt_B,
    output      A_eq_B,
    output      A_lt_B
);
    wire e3, e2, e1, e0;
    wire gt3, gt2, gt1, gt0;
    wire lt3, lt2, lt1, lt0;

    // bitwise equality
    xor x3(e3, A[3], B[3]); // e3 = A3 ^ B3 (1 if different)
    xor x2(e2, A[2], B[2]);
    xor x1(e1, A[1], B[1]);
    xor x0(e0, A[0], B[0]);
    // equality = ~(e3 | e2 | e1 | e0)
    wire anydiff;
    or  od(anydiff, e3, e2, e1, e0);
    not neq(A_eq_B, anydiff);

    // greater-than logic: check from MSB to LSB
    // gt = (A3 & ~B3) | ( (A3==B3) & (A2 & ~B2) ) | ...
    wire A3_gt_B3, A2_gt_B2, A1_gt_B1, A0_gt_B0;
    and (A3_gt_B3, A[3], ~B[3]);
    and (A2_gt_B2, A[2], ~B[2]);
    and (A1_gt_B1, A[1], ~B[1]);
    and (A0_gt_B0, A[0], ~B[0]);

    wire eq3, eq2, eq1, eq0;
    not (eq3, e3); not (eq2, e2); not (eq1, e1); not (eq0, e0);

    wire t2, t1, t0;
    and (t2, eq3, A2_gt_B2);
    and (t1, eq3, eq2, A1_gt_B1);
    and (t0, eq3, eq2, eq1, A0_gt_B0);

    or (A_gt_B, A3_gt_B3, t2, t1, t0);

    // less-than symmetric (or compute as not(gt or eq) AND (some lt signals))
    wire B3_gt_A3, B2_gt_A2, B1_gt_A1, B0_gt_A0;
    and (B3_gt_A3, B[3], ~A[3]);
    and (B2_gt_A2, B[2], ~A[2]);
    and (B1_gt_A1, B[1], ~A[1]);
    and (B0_gt_A0, B[0], ~A[0]);

    wire s2, s1, s0;
    and (s2, eq3, B2_gt_A2);
    and (s1, eq3, eq2, B1_gt_A1);
    and (s0, eq3, eq2, eq1, B0_gt_A0);
    or (A_lt_B, B3_gt_A3, s2, s1, s0);
endmodule
