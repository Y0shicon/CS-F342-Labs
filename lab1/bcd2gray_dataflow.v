// bcd2gray_dataflow.v
// Dataflow BCD to Gray converter (continuous assignment)
module bcd2gray_dataflow(
    input  [3:0] bcd,
    output [3:0] gray
);
    assign gray = bcd ^ (bcd >> 1);
endmodule
