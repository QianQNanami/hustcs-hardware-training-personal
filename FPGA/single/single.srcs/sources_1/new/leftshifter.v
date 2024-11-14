`timescale 1ns / 1ps

module LeftShifter(
    input [31:0] Data,
    input [4:0] Shift,
    output [31:0] Result
);
    assign Result = Data << Shift;
endmodule