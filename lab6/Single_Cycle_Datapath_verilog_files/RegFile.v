// FILE: RegFile.v
// 32 registers x 32-bit. Read ports combinational; write on posedge clk if RegWrite.
module RegFile(
    input  wire        clk,
    input  wire        rst,
    input  wire [4:0]  ReadReg1,
    input  wire [4:0]  ReadReg2,
    input  wire [4:0]  WriteReg,
    input  wire [31:0] WriteData,
    input  wire        RegWrite,
    output wire [31:0] ReadData1,
    output wire [31:0] ReadData2
);
    reg [31:0] regvalues [0:31];
    integer idx;

    // Initialize registers to zero on reset
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (idx = 0; idx < 32; idx = idx + 1)
                regvalues[idx] <= 32'h00000000;
            // Optionally preset registers for debugging/testing
        end else begin
            if (RegWrite && WriteReg != 0)
                regvalues[WriteReg] <= WriteData;
        end
    end

    assign ReadData1 = regvalues[ReadReg1];
    assign ReadData2 = regvalues[ReadReg2];

endmodule
