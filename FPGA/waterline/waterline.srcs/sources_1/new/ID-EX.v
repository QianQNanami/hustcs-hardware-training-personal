`timescale 1ns / 1ps

module IDEX (
    input CLK,
    input EN,
    input RST,
    input RegWritein,
    output RegWriteout,
    input MemToRegin,
    output MemToRegout,
    input MemWritein,
    output MemWriteout,
    input [3:0] ALUopin,
    output [3:0] ALUopout,
    input ALUSrcin,
    output ALUSrcout,
    input ecallin,
    output ecallout,
    input Stypein,
    output Stypeout,
    input BEQin,
    output BEQout,
    input BNEin,
    output BNEout,
    input JALin,
    output JALout,
    input JALRin,
    output JALRout,
    input LBUin,
    output LBUout,
    input BLTUin,
    output BLTUout,
    input [31:0] R1in,
    output [31:0] R1out,
    input [31:0] R2in,
    output [31:0] R2out,
    input [4:0] Widin,
    output [4:0] Widout,
    input [31:0] Immin,
    output [31:0] Immout,
    input [31:0] BEADDRin,
    output [31:0] BEADDRout,
    input [31:0] PCin,
    output [31:0] PCout,
    input [31:0] PCP4in,
    output [31:0] PCP4out,
    input [31:0] JALADDRin,
    output [31:0] JALADDRout,
    input [31:0] IRin,
    output [31:0] IRout,
    input [1:0] RSGOin,
    output [1:0] RSGOout,
    input [1:0] RTGOin,
    output [1:0] RTGOout
);
    Locker #(
        .WID(1)
    ) locker_RegWrite (
        .CLK(CLK),
        .RST(RST),
        .EN(EN),
        .in(RegWritein),
        .out(RegWriteout)
    );

    Locker #(
        .WID(1)
    ) locker_MemToReg (
        .CLK(CLK),
        .RST(RST),
        .EN(EN),
        .in(MemToRegin),
        .out(MemToRegout)
    );

    Locker #(
        .WID(1)
    ) locker_MemWrite (
        .CLK(CLK),
        .RST(RST),
        .EN(EN),
        .in(MemWritein),
        .out(MemWriteout)
    );

    Locker #(
        .WID(4)
    ) locker_ALUop (
        .CLK(CLK),
        .RST(RST),
        .EN(EN),
        .in(ALUopin),
        .out(ALUopout)
    );

    Locker #(
        .WID(1)
    ) locker_ALUSrc (
        .CLK(CLK),
        .RST(RST),
        .EN(EN),
        .in(ALUSrcin),
        .out(ALUSrcout)
    );

    Locker #(
        .WID(1)
    ) locker_ecall (
        .CLK(CLK),
        .RST(RST),
        .EN(EN),
        .in(ecallin),
        .out(ecallout)
    );

    Locker #(
        .WID(1)
    ) locker_Stype (
        .CLK(CLK),
        .RST(RST),
        .EN(EN),
        .in(Stypein),
        .out(Stypeout)
    );

    Locker #(
        .WID(1)
    ) locker_BEQ (
        .CLK(CLK),
        .RST(RST),
        .EN(EN),
        .in(BEQin),
        .out(BEQout)
    );

    Locker #(
        .WID(1)
    ) locker_BNE (
        .CLK(CLK),
        .RST(RST),
        .EN(EN),
        .in(BNEin),
        .out(BNEout)
    );

    Locker #(
        .WID(1)
    ) locker_JAL (
        .CLK(CLK),
        .RST(RST),
        .EN(EN),
        .in(JALin),
        .out(JALout)
    );

    Locker #(
        .WID(1)
    ) locker_JALR (
        .CLK(CLK),
        .RST(RST),
        .EN(EN),
        .in(JALRin),
        .out(JALRout)
    );

    Locker #(
        .WID(1)
    ) locker_LBU (
        .CLK(CLK),
        .RST(RST),
        .EN(EN),
        .in(LBUin),
        .out(LBUout)
    );

    Locker #(
        .WID(1)
    ) locker_BLTU (
        .CLK(CLK),
        .RST(RST),
        .EN(EN),
        .in(BLTUin),
        .out(BLTUout)
    );

    Locker #(
        .WID(32)
    ) locker_R1 (
        .CLK(CLK),
        .RST(RST),
        .EN(EN),
        .in(R1in),
        .out(R1out)
    );

    Locker #(
        .WID(32)
    ) locker_R2 (
        .CLK(CLK),
        .RST(RST),
        .EN(EN),
        .in(R2in),
        .out(R2out)
    );

    Locker #(
        .WID(5)
    ) locker_Wid (
        .CLK(CLK),
        .RST(RST),
        .EN(EN),
        .in(Widin),
        .out(Widout)
    );

    Locker #(
        .WID(32)
    ) locker_Imm (
        .CLK(CLK),
        .RST(RST),
        .EN(EN),
        .in(Immin),
        .out(Immout)
    );

    Locker #(
        .WID(32)
    ) locker_BEADDR (
        .CLK(CLK),
        .RST(RST),
        .EN(EN),
        .in(BEADDRin),
        .out(BEADDRout)
    );

    Locker #(
        .WID(32)
    ) locker_PC (
        .CLK(CLK),
        .RST(RST),
        .EN(EN),
        .in(PCin),
        .out(PCout)
    );

    Locker #(
        .WID(32)
    ) locker_PCP4 (
        .CLK(CLK),
        .RST(RST),
        .EN(EN),
        .in(PCP4in),
        .out(PCP4out)
    );

    Locker #(
        .WID(32)
    ) locker_JALADDR (
        .CLK(CLK),
        .RST(RST),
        .EN(EN),
        .in(JALADDRin),
        .out(JALADDRout)
    );

    Locker #(
        .WID(32)
    ) locker_IR (
        .CLK(CLK),
        .RST(RST),
        .EN(EN),
        .in(IRin),
        .out(IRout)
    );

    Locker #(
        .WID(2)
    ) locker_RSGO (
        .CLK(CLK),
        .RST(RST),
        .EN(EN),
        .in(RSGOin),
        .out(RSGOout)
    );

    Locker #(
        .WID(2)
    ) locker_RTGO (
        .CLK(CLK),
        .RST(RST),
        .EN(EN),
        .in(RTGOin),
        .out(RTGOout)
    );

endmodule