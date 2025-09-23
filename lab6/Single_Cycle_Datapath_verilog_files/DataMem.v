// FILE: DataMem.v
module DataMem(
    input  wire        clk,
    input  wire        MemWrite,
    input  wire        MemRead,
    input  wire [31:0] Addr,
    input  wire [31:0] WriteData,
    output reg  [31:0] ReadData
);
    reg [31:0] mem [0:31];
    integer i;
    initial begin
        for (i = 0; i < 32; i = i + 1) mem[i] = 32'h00000000;
    end

    always @(posedge clk) begin
        if (MemWrite) mem[Addr[4:0]] <= WriteData;
    end

    always @(*) begin
        if (MemRead) ReadData = mem[Addr[4:0]];
        else ReadData = 32'h00000000;
    end
endmodule
