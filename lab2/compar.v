// compar.v - signed 4-bit comparator (behavioral) using signa as helper
module compar(
    input  [3:0] A,
    input  [3:0] B,
    output       signA,
    output       signB,
    output reg   AgtB,
    output reg   AeqB,
    output reg   AltB
);
    wire sA, sB;
    signa forA(.neg(sA), .A(A));
    signa forB(.neg(sB), .A(B));
    assign signA = sA;
    assign signB = sB;

    // Use signed comparison
    always @(*) begin
        if ($signed(A) > $signed(B)) begin AgtB = 1; AeqB = 0; AltB = 0; end
        else if ($signed(A) == $signed(B)) begin AgtB = 0; AeqB = 1; AltB = 0; end
        else begin AgtB = 0; AeqB = 0; AltB = 1; end
    end
endmodule
