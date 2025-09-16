module mux2to1_gate (a,b,s,f);
    input a,b,s;
    output f;
    wire c,d,e;
    not n1(e,s);// e=~s
    and a1(c,a,s);
    and a2(d,b,e);
    or o1(f,c,d);
endmodule

// module mux2to1_df (a,b,s,f);
//     input a,b,s;
//     output f;
//     assign f = s ? a : b;
// endmodule

// module mux2to1_beh(a,b,s,f);
//     input a,b,s;
//     output f;
//     reg f;
//     always@(s or a or b)
//     if(s==1) f = a;
//     else f = b;
// endmodule