`timescale 1ns / 1ps

module RegFile (
    input wire [31:0] Din,
    input wire Clk,
    input wire WE,
    input wire [4:0] WAddr,
    input wire [4:0] R1Addr,
    input wire [4:0] R2Addr,
    output wire [31:0] R1,
    output wire [31:0] R2
);

    reg [31:0] registers [0:31];
    always @(posedge Clk) begin
        if (WE) begin
            registers[WAddr] <= Din;
        end
        registers[0] <= 0;
    end

    assign R1 = registers[R1Addr];
    assign R2 = registers[R2Addr];

endmodule