`timescale 1ns / 1ps

module Locker #(
    parameter WID = 32
) (
    input CLK,
    input RST,
    input EN,
    input [WID-1:0] in,
    output [WID-1:0] out
);
    wire [WID-1:0] temp;
    MUX2x1 #(
        .DATAWIDTH(WID)
    ) mux (
        .A(in),
        .B(0),
        .Sel(RST),
        .Dout(temp)
    );
    Register #(
        .WIDTH(WID)
    ) regi (
        .Clk(CLK),
        .RST(1'b0),
        .WE(EN),
        .Din(temp),
        .Dout(out)
    );
endmodule