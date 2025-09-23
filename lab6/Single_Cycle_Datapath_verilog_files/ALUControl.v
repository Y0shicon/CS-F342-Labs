// FILE: ALUControl.v
module ALUControl(
    input  wire [1:0] ALUOp,
    input  wire [5:0] Funct,
    output reg  [2:0] ALUControl
);
    always @(*) begin
        case (ALUOp)
            2'b00: ALUControl = 3'b010; // ADD (for lw, sw, addi)
            2'b01: ALUControl = 3'b110; // SUB (for beq)
            2'b10: begin // R-type -> use Funct
                case (Funct)
                    6'h20: ALUControl = 3'b010; // add
                    6'h22: ALUControl = 3'b110; // sub
                    6'h24: ALUControl = 3'b000; // and
                    6'h25: ALUControl = 3'b001; // or
                    6'h2A: ALUControl = 3'b111; // slt
                    default: ALUControl = 3'b010;
                endcase
            end
            default: ALUControl = 3'b010;
        endcase
    end
endmodule
