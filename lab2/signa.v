// signa.v - module to get sign bit (neg) of a 4-bit number
module signa(output reg neg, input [3:0] A);
    always @(*) begin
        if (A[3] == 1'b1) neg = 1'b1;
        else neg = 1'b0;
    end
endmodule
