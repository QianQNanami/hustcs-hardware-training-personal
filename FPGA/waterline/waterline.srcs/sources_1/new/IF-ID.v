`timescale 1ns / 1ps

module IFID (
    input CLK,
    input RST,
    input EN,
    input [31:0] PCin,
    output [31:0] PCout,
    input [31:0] PCP4in,
    output [31:0] PCP4out,
    input [31:0] IRin,
    output [31:0] IRout
);
    Locker #(
        .WIDTH(32)
    ) locker_PC (
        .CLK(CLK),
        .RST(RST),
        .EN(EN),
        .in(PCin),
        .out(PCout)
    );

    Locker #(
        .WIDTH(32)
    ) locker_PCP4 (
        .CLK(CLK),
        .RST(RST),
        .EN(EN),
        .in(PCP4in),
        .out(PCP4out)
    );

    Locker #(
        .WIDTH(32)
    ) locker_IR (
        .CLK(CLK),
        .RST(RST),
        .EN(EN),
        .in(IRin),
        .out(IRout)
    );
endmodule