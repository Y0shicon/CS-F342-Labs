Lab 1 Verilog files - Generated
--------------------------------
Files included:
- bcd2gray_gate.v
- bcd2gray_dataflow.v
- tb_bcd2gray.v
- comparator_behav.v
- comparator_dataflow.v
- comparator_gate.v
- tb_comparator.v
- fulladder_gate.v
- fulladder_dataflow.v
- tb_fulladder.v
- adder4bit.v
- tb_adder4bit.v
- adder_subtractor4.v
- tb_addsub4.v
- README.txt

Simulation (Icarus Verilog) examples:
1) BCD -> Gray test:
   iverilog -o bcd2gray.vvp bcd2gray_gate.v bcd2gray_dataflow.v tb_bcd2gray.v
   vvp bcd2gray.vvp

2) Comparator test:
   iverilog -o comp.vvp comparator_behav.v comparator_dataflow.v comparator_gate.v tb_comparator.v
   vvp comp.vvp

3) Full adder test:
   iverilog -o fa.vvp fulladder_gate.v fulladder_dataflow.v tb_fulladder.v
   vvp fa.vvp

4) 4-bit adder test (uses fulladder_gate):
   iverilog -o add4.vvp fulladder_gate.v adder4bit.v tb_adder4bit.v
   vvp add4.vvp

5) Adder/Subtractor test:
   iverilog -o addsub.vvp fulladder_gate.v adder_subtractor4.v tb_addsub4.v
   vvp addsub.vvp
