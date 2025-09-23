// FILE: ALU.v
module ALU(
    input  wire [31:0] A,
    input  wire [31:0] B,
    input  wire [2:0]  ALUControl,
    output reg  [31:0] ALUResult,
    output wire        Zero
);
    always @(*) begin
        case (ALUControl)
            3'b000: ALUResult = A & B;           // AND
            3'b001: ALUResult = A | B;           // OR
            3'b010: ALUResult = A + B;           // ADD
            3'b110: ALUResult = A - B;           // SUB
            3'b111: ALUResult = ($signed(A) < $signed(B)) ? 32'd1 : 32'd0; // SLT
            default: ALUResult = 32'h00000000;
        endcase
    end

    assign Zero = (ALUResult == 32'h00000000);
endmodule
