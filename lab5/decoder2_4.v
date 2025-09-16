module decoder2_4(
  output [3:0] register,    // one-hot outputs
  input [1:0] reg_no
);
  assign register =  (reg_no == 2'b00) ? 4'b0001 :
                     (reg_no == 2'b01) ? 4'b0010 :
                     (reg_no == 2'b10) ? 4'b0100 : 4'b1000;
endmodule
