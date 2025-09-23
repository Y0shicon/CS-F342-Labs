Lab Sheet 2 - Verilog files generated

Files included:
- mux4to1_gate.v
- mux16to1.v
- tb_mux16.v
- DECODER.v
- FADDER.v
- tb_fadder.v
- fulladder1.v
- adder8.v
- adder32_from8.v
- tb_adders.v
- signa.v
- compar.v
- tb_compar_signed.v
- FULLADDER_behav.v
- ADDSUB.v
- tb_addsub4_ex3.v
- README.txt

Simulation:
Use iverilog/vvp to simulate. Examples:
  iverilog -o tb_mux16.vvp mux4to1_gate.v mux16to1.v tb_mux16.v
  vvp tb_mux16.vvp

  iverilog -o fadder.vvp DECODER.v FADDER.v tb_fadder.v
  vvp fadder.vvp

  iverilog -o compar.vvp signa.v compar.v tb_compar_signed.v
  vvp compar.vvp

  iverilog -o addsub.vvp FULLADDER_behav.v ADDSUB.v tb_addsub4_ex3.v
  vvp addsub.vvp
