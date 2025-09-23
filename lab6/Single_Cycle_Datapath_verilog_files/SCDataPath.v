// FILE: SCDataPath.v
// Top-level single-cycle datapath (simplified for lab). Exposes signals used in the provided testbench.
module SCDataPath(
    input  wire clk,
    input  wire rst
);
    // Program Counter (5-bit)
    wire [4:0] addr; // current PC (word address)
    reg  [4:0] next_addr;

    // Instruction
    wire [31:0] instr;

    // Wires for control / datapath
    wire        RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, Jump;
    wire [1:0]  ALUOp;

    // Register file interfaces
    wire [4:0]  rs = instr[25:21];
    wire [4:0]  rt = instr[20:16];
    wire [4:0]  rd = instr[15:11];
    wire [15:0] imm16 = instr[15:0];

    wire [31:0] ReadData1, ReadData2;
    wire [31:0] SignExtImm;
    wire [31:0] ALU_in2;
    wire [31:0] ALU_result;
    wire        zero;
    wire [2:0]  ALUControlSignals;

    wire [4:0] WriteReg;
    wire [31:0] WriteData;

    // Internal components
    PCReg pc_reg(.clk(clk), .rst(rst), .nextPC(next_addr), .pc(addr));
    InstrMem instrmem(.addr(addr), .instr(instr));
    ControlUnit ctrl(.opcode(instr[31:26]), .RegDst(RegDst), .ALUSrc(ALUSrc), .MemtoReg(MemtoReg),                         .RegWrite(RegWrite), .MemRead(MemRead), .MemWrite(MemWrite), .Branch(Branch),                         .ALUOp(ALUOp), .Jump(Jump));
    RegFile RegFile(.clk(clk), .rst(rst), .ReadReg1(rs), .ReadReg2(rt), .WriteReg(WriteReg),                        .WriteData(WriteData), .RegWrite(RegWrite), .ReadData1(ReadData1), .ReadData2(ReadData2));
    SignExt signext(.imm16(imm16), .imm32(SignExtImm));
    Mux2 #(.WIDTH(32)) muxALUSrc(.a(ReadData2), .b(SignExtImm), .sel(ALUSrc), .y(ALU_in2));
    ALUControl aluctrl(.ALUOp(ALUOp), .Funct(instr[5:0]), .ALUControl(ALUControlSignals));
    ALU ALU(.A(ReadData1), .B(ALU_in2), .ALUControl(ALUControlSignals), .ALUResult(ALU_result), .Zero(zero));
    DataMem datamem(.clk(clk), .MemWrite(MemWrite), .MemRead(MemRead), .Addr(ALU_result), .WriteData(ReadData2), .ReadData());

    // Write register selection
    assign WriteReg = RegDst ? rd : rt;

    // Write back selection (ALU result or Data Memory)
    // because DataMem ReadData output not captured above (we left it unnamed), reinstantiate properly
    wire [31:0] MemReadData;
    // Reinstantiate datamem correctly to get MemReadData
    DataMem datamem2(.clk(clk), .MemWrite(MemWrite), .MemRead(MemRead), .Addr(ALU_result), .WriteData(ReadData2), .ReadData(MemReadData));

    assign WriteData = MemtoReg ? MemReadData : ALU_result;

    // expose some signals used in the TB for deeper debug (as regs/wires in this module)
    // already have ALU_result, ReadData1, ReadData2, zero, RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp, Jump
    // Also expose instr and addr (pc) - they are already "instr" and "addr"
    // To allow TB to reference processor.ALU_result etc, we make them wires with same names
    wire [31:0] ALU_result_wire = ALU_result;
    // For compatibility with testbench debug prints, use these exact names
    // (testbench references: processor.ALU_result, processor.ReadData1, processor.ReadData2, processor.zero, processor.WriteReg, processor.WriteData)
    // Create aliases via `assign` so they are visible
    assign ALU_result = ALU_result_wire; // NOTE: ALU_result was declared as wire; reassign aliasing for clarity

    // PC update: simple PC + 1 (word addressing)
    always @(*) begin
        next_addr = addr + 1; // no branching implemented in this simplified path (branch logic can be added)
    end

    // For testbench compatibility, expose certain names as outputs of the module scope
    // Verilog doesn't allow direct export here, but TB accesses via instance name (processor.signal)
    // So ensure signals exist with the names used by the TB
    // We need to create some nets with the same names used in the TB
    wire [4:0] addr_alias = addr;
    // create other aliases
    // But TB uses processor.addr and processor.instr directly, which are present

endmodule
