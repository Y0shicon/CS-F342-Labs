Single-cycle datapath Verilog files for Lab Sheet 6.
Files:
 - InstrMem.v
 - RegFile.v
 - ALU.v
 - ControlUnit.v
 - ALUControl.v
 - DataMem.v
 - SignExt.v
 - Shifter.v
 - Adder.v
 - Mux2.v
 - PCReg.v
 - SCDataPath.v
 - tb_SCDataPath.v

To simulate: use your preferred Verilog simulator (Icarus Verilog, ModelSim, etc.).
Example (Icarus):
  iverilog -o scdatapath.vvp InstrMem.v RegFile.v ALU.v ControlUnit.v ALUControl.v DataMem.v SignExt.v Shifter.v Adder.v Mux2.v PCReg.v SCDataPath.v tb_SCDataPath.v\n  vvp scdatapath.vvp
