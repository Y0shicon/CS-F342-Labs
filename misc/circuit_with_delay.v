// Top-level module
module stimrct;
    reg A, B, C;
    wire x, y, e;

    // Instantiate the circuit with delay module
    circuit_with_delay cwd (
        A,B,C,x,y
    );
    
// Initial block for test stimulus
    initial begin
        A = 1'b0; B = 1'b0; C = 1'b0;
        $monitor($time, " A=%b, B=%b, C=%b, e=%b, x=%b, y=%b", A, B, C, e, x, y);
        #100 A = 1'b1; B = 1'b1; C = 1'b1;
        #100 $finish;
    end
endmodule

// Module definition for circuit_with_delay
module circuit_with_delay(input A, input B, input C, output x, output y);
    wire e;

    // Internal logic
    // assign #30 e = A & B;      // AND gate with delay
    // assign #10 d2 = B | C;      // OR gate with delay
    // assign #10 x = d1 ^ d2;     // XOR gate with delay
    // assign #10 y = ~d1;         // NOT gate with delay
    // assign #10 e = d1 & d2;     // AND gate with delay
    assign #30 e = A & B;
    assign #10 y = -C;
    assign #20 x = e | y;
endmodule
