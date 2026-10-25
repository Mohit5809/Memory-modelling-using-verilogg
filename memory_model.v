module memory_model (
    input  wire       clk,
    input  wire       we,
    input  wire [3:0] addr,
    input  wire [7:0] din,
    output reg  [7:0] ram_data,
    output wire [7:0] rom_data
);

    // 16 x 8-bit RAM
    reg [7:0] ram [0:15];

    // 16 x 8-bit ROM
    reg [7:0] rom [0:15];

    integer i;

    // Initialize ROM with example data
    initial begin
        rom[0]  = 8'h10;
        rom[1]  = 8'h21;
        rom[2]  = 8'h32;
        rom[3]  = 8'h43;
        rom[4]  = 8'h54;
        rom[5]  = 8'h65;
        rom[6]  = 8'h76;
        rom[7]  = 8'h87;
        rom[8]  = 8'h98;
        rom[9]  = 8'hA9;
        rom[10] = 8'hBA;
        rom[11] = 8'hCB;
        rom[12] = 8'hDC;
        rom[13] = 8'hED;
        rom[14] = 8'hFE;
        rom[15] = 8'h0F;
    end

    // Synchronous RAM write and read
    always @(posedge clk) begin
        if (we)
            ram[addr] <= din;

        ram_data <= ram[addr];
    end

    // Combinational ROM read
    assign rom_data = rom[addr];

endmodule