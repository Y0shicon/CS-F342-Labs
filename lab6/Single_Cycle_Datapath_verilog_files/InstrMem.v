// FILE: InstrMem.v
// 32 x 32-bit Instruction Memory (addressed by 5-bit word index)
module InstrMem(
    input  wire [4:0] addr,
    output reg  [31:0] instr
);
    reg [31:0] mem [0:31];

    initial begin
        // Program: sum = 0; t1 = 1; repeat 10 times: sum += t1; t1++
        // This unrolled loop computes sum(1..10) = 55 into $t0 ($8)
        mem[0]  = 32'h20080000; // addi $8, $0, 0   ; t0 = 0
        mem[1]  = 32'h20090001; // addi $9, $0, 1   ; t1 = 1
        // 10 iterations: add $8,$8,$9 ; addi $9,$9,1
        mem[2]  = 32'h01094020; mem[3]  = 32'h21290001;
        mem[4]  = 32'h01094020; mem[5]  = 32'h21290001;
        mem[6]  = 32'h01094020; mem[7]  = 32'h21290001;
        mem[8]  = 32'h01094020; mem[9]  = 32'h21290001;
        mem[10] = 32'h01094020; mem[11] = 32'h21290001;
        mem[12] = 32'h01094020; mem[13] = 32'h21290001;
        mem[14] = 32'h01094020; mem[15] = 32'h21290001;
        mem[16] = 32'h01094020; mem[17] = 32'h21290001;
        mem[18] = 32'h01094020; mem[19] = 32'h21290001;
        mem[20] = 32'h01094020; mem[21] = 32'h21290001;

        // rest zeros
        integer i;
        for (i = 22; i < 32; i = i + 1) mem[i] = 32'h00000000;
    end

    always @(*) begin
        instr = mem[addr];
    end
endmodule
