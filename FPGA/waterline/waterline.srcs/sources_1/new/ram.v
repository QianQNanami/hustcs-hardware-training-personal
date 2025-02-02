`timescale 1ns / 1ps

module RAM (
    input wire [9:0] Addr,
    input wire [31:0] Din,
    input wire Clk,
    input wire str,
    output wire [31:0] Dout
);
    reg [31:0] mem [0:1023];

    always @(posedge Clk) begin
        if (str) begin
            mem[Addr] <= Din;
        end
    end
    
    assign Dout = mem[Addr];

endmodule