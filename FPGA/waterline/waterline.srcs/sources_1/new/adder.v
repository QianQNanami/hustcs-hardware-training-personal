`timescale 1ns / 1ps

module Adder #(
    WIDTH = 32
) (
    input wire [WIDTH-1:0] A,
    input wire [WIDTH-1:0] B,
    output wire [WIDTH-1:0] result
);
    wire cin;
    assign {cin, result} = A + B;
endmodule