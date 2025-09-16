// File: instr_mem.v
// Instruction memory: 32 words x 32-bit. Word-aligned (addr[6:2] indexing).
module instr_mem(
  input [31:0] addr,
  output reg [31:0] instr
);

  reg [31:0] memory [31:0];

  initial begin
    // Example program (same as the sample in your lab sheet).
    memory[0]  = 32'b100011_00000_01000_0000_0000_0000_0000; // lw $t0, 0($zero)
    memory[1]  = 32'b100011_00000_01001_0000_0000_0000_0001; // lw $t1, 1($zero)
    memory[2]  = 32'b100011_00000_01100_0000_0000_0000_1011; // lw $t4, 11($zero)
    memory[3]  = 32'b000000_01001_01100_01011_00000_100010; // sub $t3, $t1, $t4
    memory[4]  = 32'b000100_01011_00000_0000_0000_0000_0110; // beq $t3,$zero,6
    memory[5]  = 32'b000000_01000_01001_01000_00000_100000; // add $t0, $t0, $t1
    memory[6]  = 32'b100011_00000_01010_0000_0000_0000_0001; // lw $t2,1($zero)
    memory[7]  = 32'b000000_01001_01010_01001_00000_100000; // add $t1,$t1,$t2
    memory[8]  = 32'b000010_00000_00000_00000_00000_000011; // j 3
    memory[9]  = 32'b000000_00000_00000_00000_00000_000000; // NOP
    memory[10] = 32'b000000_00000_00000_00000_00000_000000; // NOP
    // zero-fill the rest
    integer i;
    for (i = 11; i < 32; i = i + 1) memory[i] = 32'b0;
  end

  always @(*) begin
    instr = memory[addr[6:2]]; // word-aligned fetch
  end

endmodule
