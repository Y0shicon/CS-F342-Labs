// FILE: PCReg.v
module PCReg(
    input  wire        clk,
    input  wire        rst,
    input  wire [4:0]  nextPC,
    output reg  [4:0]  pc
);
    always @(posedge clk or posedge rst) begin
        if (rst) pc <= 5'd0;
        else pc <= nextPC;
    end
endmodule
