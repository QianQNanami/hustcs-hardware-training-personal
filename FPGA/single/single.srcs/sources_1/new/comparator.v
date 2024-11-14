`timescale 1ns / 1ps

module Comparator #(
    parameter WIDTH = 16
) (
    input wire [WIDTH-1:0] A,
    input wire [WIDTH-1:0] B,
    output wire larger,
    output wire equal,
    output wire smaller
);
    assign larger = (A > B);
    assign equal = (A == B);
    assign smaller = (A < B);

endmodule