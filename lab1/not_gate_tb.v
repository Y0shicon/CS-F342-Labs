`timescale 1ns/1ps

module tb;
    reg a;
    wire y;

    // instantiate DUT
    not_gate uut (
        .a(a),
        .y(y)
    );

    initial begin
        // VCD dump setup
        $dumpfile("not_gate.vcd");
        $dumpvars(0, tb); // dump entire hierarchy under tb

        // simple stimulus
        a = 0;
        #10;
        a = 1;
        #10;
        a = 0;
        #10;

        // generate a few toggles
        repeat (6) begin
            #5 a = ~a;
        end

        #10;
        $display("Simulation finished: a=%b y=%b", a, y);
        $finish;
    end
endmodule
