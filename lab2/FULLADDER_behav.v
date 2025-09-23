// FULLADDER_behav.v - behavioral full adder (Exercise-3)
module FULLADDER(
    input  a,
    input  b,
    input  cin,
    output reg sum,
    output reg cout
);
    always @(*) begin
        {cout, sum} = a + b + cin;
    end
endmodule
