`timescale 1ns / 1ps

module HardwiredController (
    input wire [4:0] OP_CODE,
    input wire [4:0] Funct,
    input wire IR21,
    output wire [3:0] ALU_OP,
    output wire MemToReg,
    output wire BLTU,
    output wire MemWrite,
    output wire ALU_SRC,
    output wire LBU,
    output wire CSC,
    output wire RSread,
    output wire RegWrite,
    output wire RTread,
    output wire S_type,
    output wire BEQ,
    output wire BNE,
    output wire JALR,
    output wire JAL,
    output wire uret,
    output wire ecall
);
    CalcController calc_controller(
        .OP2(OP_CODE[0]),
        .OP3(OP_CODE[1]),
        .OP4(OP_CODE[2]),
        .OP5(OP_CODE[3]),
        .OP6(OP_CODE[4]),
        .F12(Funct[0]),
        .F13(Funct[1]),
        .F14(Funct[2]),
        .F25(Funct[3]),
        .F30(Funct[4]),
        .S0(ALU_OP[0]),
        .S1(ALU_OP[1]),
        .S2(ALU_OP[2]),
        .S3(ALU_OP[3])
    );
    wire ecall_output;
    ControlSignalGen control_signal_gen(
        .OP2(OP_CODE[0]),
        .OP3(OP_CODE[1]),
        .OP4(OP_CODE[2]),
        .OP5(OP_CODE[3]),
        .OP6(OP_CODE[4]),
        .F12(Funct[0]),
        .F13(Funct[1]),
        .F14(Funct[2]),
        .F25(Funct[3]),
        .F30(Funct[4]),
        .MemToReg(MemToReg),
        .BLTU(BLTU),
        .MemWrite(MemWrite),
        .ALU_SRC(ALU_SRC),
        .LBU(LBU),
        .CSC(CSC),
        .RSread(RSread),
        .RegWrite(RegWrite),
        .ecall(ecall_output),
        .S_Type(S_type),
        .BEQ(BEQ),
        .BNE(BNE),
        .JALR(JALR),
        .JAL(JAL),
        .RTread(RTread)
    );
    assign uret = IR21 & ecall_output;
    assign ecall = ~IR21 & ecall_output;
endmodule