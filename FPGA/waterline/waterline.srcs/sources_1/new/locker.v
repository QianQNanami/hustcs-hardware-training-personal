`timescale 1ns / 1ps

module Locker #(
    parameter WIDTH = 32
) (
    input CLK,
    input RST,
    input EN,
    input [WIDTH-1:0] in,
    output [WIDTH-1:0] out
);
    wire temp;
    MUX2x1 #(
        .WIDTH(WIDTH)
    ) mux (
        .A(in),
        .B(0),
        .Sel(RST),
        .Dout(temp)
    );
    Register #(
        .WIDTH(WIDTH)
    ) reg (
        .Clk(CLK),
        .RST(1'b0),
        .EN(EN),
        .Din(temp),
        .Dout(out)
    );
endmodule