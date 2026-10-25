`timescale 1ns/1ps

module testbench;

    reg clk;
    reg we;
    reg [3:0] addr;
    reg [7:0] din;

    wire [7:0] ram_data;
    wire [7:0] rom_data;

    memory_model uut (
        .clk(clk),
        .we(we),
        .addr(addr),
        .din(din),
        .ram_data(ram_data),
        .rom_data(rom_data)
    );

    always #5 clk = ~clk;

    initial begin
        clk  = 0;
        we   = 0;
        addr = 0;
        din  = 0;

        // Write data to RAM address 3
        @(negedge clk);
        addr = 4'd3;
        din  = 8'hA5;
        we   = 1;

        @(negedge clk);
        we = 0;

        // Read back data from RAM address 3
        @(negedge clk);
        $display("RAM address 3 = %h", ram_data);

        // Read ROM address 3
        $display("ROM address 3 = %h", rom_data);

        if (ram_data !== 8'hA5)
            $display("RAM TEST FAILED");
        else
            $display("RAM TEST PASSED");

        if (rom_data !== 8'h43)
            $display("ROM TEST FAILED");
        else
            $display("ROM TEST PASSED");

        $finish;
    end

endmodule