`timescale 1ns / 1ps

module Register #(
    parameter WIDTH = 32
) (
    input wire [WIDTH-1:0] Din,
    output wire [WIDTH-1:0] Dout,
    input wire Clk,
    input wire WE,
    input wire RST
);
    
    reg [WIDTH-1:0] reg_data;
    initial begin
        reg_data = 0;
    end
    always @(posedge Clk) begin
        if (RST) begin
            reg_data <= 0;
        end else if (WE) begin
            reg_data <= Din;
        end
        
    end
    assign Dout = reg_data;
endmodule