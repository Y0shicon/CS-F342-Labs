// FILE: tb_SCDataPath.v
// Provided testbench from the lab (kept largely unchanged). Place in same directory and run with simulator.
module tb_SCDataPath;
    reg clk, rst;

    // Instantiate the datapath
    SCDataPath processor(clk, rst);

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 time units per clock cycle
    end

    // Reset sequence
    initial begin
        rst = 0;
        #12 rst = 1; // Release reset slightly after first clock edge
    end

    initial begin
        $display("Time |   PC       Instr       |   $t0     $t1     $t2     $t3     $t4");
        $display("-----------------------------------------------------------");
    end

    // Monitor key signals every cycle
    always @(posedge clk) begin
        $display("t=%0t | PC=0x%08h instr=0x%08h | t0=%h t1=%h t2=%h t3=%h t4=%h",
                 $time,
                 processor.addr,
                 processor.instr,
                 processor.RegFile.regvalues[8],
                 processor.RegFile.regvalues[9],
                 processor.RegFile.regvalues[10],
                 processor.RegFile.regvalues[11],
                 processor.RegFile.regvalues[12]);
        $display("-----------------------------------------------------------");
    end

    // Run just enough cycles to complete the program
    initial begin
        #800 $finish;
    end
endmodule
