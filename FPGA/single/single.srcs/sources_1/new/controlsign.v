`timescale 1ns / 1ps

module ControlSignalGen (
    input wire OP2,
    input wire OP3,
    input wire OP4,
    input wire OP5,
    input wire OP6,
    input wire F12,
    input wire F13,
    input wire F14,
    input wire F25,
    input wire F30,
    output wire MemToReg,
    output wire BLTU,
    output wire MemWrite,
    output wire ALU_SRC,
    output wire LBU,
    output wire CSC,
    output wire RSread,
    output wire RegWrite,
    output wire ecall,
    output wire S_Type,
    output wire BEQ,
    output wire BNE,
    output wire JALR,
    output wire JAL,
    output wire RTread
);
    assign MemToReg = (~F14 & F13 & ~F12 & ~OP6 & ~OP5 & ~OP4 & ~OP3 & ~OP2) | 
                      (F14 & ~F13 & ~F12 & ~OP6 & ~OP5 & ~OP4 & ~OP3 & ~OP2);
    assign MemWrite = ~F14 & F13 & ~F12 & ~OP6 & OP5 & ~OP4 & ~OP3 & ~OP2;
    assign ALU_SRC = (~F14 & ~F13 & ~F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2) | 
                     (F14 & F13 & F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2) | 
                     (F14 & F13 & ~F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2) | 
                     (F14 & ~F13 & ~F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2) | 
                     (~F14 & F13 & ~F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2) | 
                     (~F30 & ~F25 & ~F14 & ~F13 & F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2) | 
                     (~F30 & ~F25 & F14 & ~F13 & F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2) | 
                     (F30 & ~F25 & F14 & ~F13 & F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2) | 
                     (~F14 & F13 & ~F12 & ~OP6 & ~OP5 & ~OP4 & ~OP3 & ~OP2) | 
                     (~F14 & F13 & ~F12 & ~OP6 & OP5 & ~OP4 & ~OP3 & ~OP2) | 
                     (~F14 & ~F13 & ~F12 & OP6 & OP5 & ~OP4 & ~OP3 & OP2) | 
                     (~F14 & F13 & F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2) | 
                     (F14 & ~F13 & ~F12 & ~OP6 & ~OP5 & ~OP4 & ~OP3 & ~OP2);
    assign RegWrite = (~F30 & ~F25 & ~F14 & ~F13 & ~F12 & ~OP6 & OP5 & OP4 & ~OP3 & ~OP2) | 
                      (F30 & ~F25 & ~F14 & ~F13 & ~F12 & ~OP6 & OP5 & OP4 & ~OP3 & ~OP2) | 
                      (~F30 & ~F25 & F14 & F13 & F12 & ~OP6 & OP5 & OP4 & ~OP3 & ~OP2) | 
                      (~F30 & ~F25 & F14 & F13 & ~F12 & ~OP6 & OP5 & OP4 & ~OP3 & ~OP2) | 
                      (~F30 & ~F25 & ~F14 & F13 & ~F12 & ~OP6 & OP5 & OP4 & ~OP3 & ~OP2) | 
                      (~F30 & ~F25 & ~F14 & F13 & F12 & ~OP6 & OP5 & OP4 & ~OP3 & ~OP2) | 
                      (~F14 & ~F13 & ~F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2) | 
                      (F14 & F13 & F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2) | 
                      (F14 & F13 & ~F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2) | 
                      (F14 & ~F13 & ~F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2) | 
                      (~F14 & F13 & ~F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2) | 
                      (~F30 & ~F25 & ~F14 & ~F13 & F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2) | 
                      (~F30 & ~F25 & F14 & ~F13 & F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2) | 
                      (F30 & ~F25 & F14 & ~F13 & F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2) | 
                      (~F14 & F13 & ~F12 & ~OP6 & ~OP5 & ~OP4 & ~OP3 & ~OP2) | 
                      (OP6 & OP5 & ~OP4 & OP3 & OP2) | 
                      (~F14 & ~F13 & ~F12 & OP6 & OP5 & ~OP4 & ~OP3 & OP2) | 
                      (~F30 & ~F25 & ~F14 & ~F13 & F12 & ~OP6 & OP5 & OP4 & ~OP3 & ~OP2) | 
                      (~F14 & F13 & F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2) | 
                      (F14 & ~F13 & ~F12 & ~OP6 & ~OP5 & ~OP4 & ~OP3 & ~OP2);
    assign ecall = ~F30 & ~F25 & ~F14 & ~F13 & ~F12 & OP6 & OP5 & OP4 & ~OP3 & ~OP2;
    assign S_Type = ~F14 & F13 & ~F12 & ~OP6 & OP5 & ~OP4 & ~OP3 & ~OP2;
    assign BEQ = ~F14 & ~F13 & ~F12 & OP6 & OP5 & ~OP4 & ~OP3 & ~OP2;
    assign BNE = ~F14 & ~F13 & F12 & OP6 & OP5 & ~OP4 & ~OP3 & ~OP2;
    assign JAL = OP6 & OP5 & ~OP4 & OP3 & OP2;
    assign JALR = ~F14 & ~F13 & ~F12 & OP6 & OP5 & ~OP4 & ~OP3 & OP2;
    assign LBU = F14 & ~F13 & ~F12 & ~OP6 & ~OP5 & ~OP4 & ~OP3 & ~OP2;
    assign BLTU = F14 & F13 & ~F12 & OP6 & OP5 & ~OP4 & ~OP3 & ~OP2;
    assign RSread = (~F30 & ~F25 & ~F14 & ~F13 & ~F12 & ~OP6 & OP5 & OP4 & ~OP3 & ~OP2) | 
                    (F30 & ~F25 & ~F14 & ~F13 & ~F12 & ~OP6 & OP5 & OP4 & ~OP3 & ~OP2) | 
                    (~F30 & ~F25 & F14 & F13 & F12 & ~OP6 & OP5 & OP4 & ~OP3 & ~OP2) | 
                    (~F30 & ~F25 & F14 & F13 & ~F12 & ~OP6 & OP5 & OP4 & ~OP3 & ~OP2) | 
                    (~F30 & ~F25 & ~F14 & F13 & ~F12 & ~OP6 & OP5 & OP4 & ~OP3 & ~OP2) | 
                    (~F30 & ~F25 & ~F14 & F13 & F12 & ~OP6 & OP5 & OP4 & ~OP3 & ~OP2) | 
                    (~F14 & ~F13 & ~F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2) | 
                    (F14 & F13 & F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2) | 
                    (F14 & F13 & ~F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2) | 
                    (F14 & ~F13 & ~F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2) | 
                    (~F14 & F13 & ~F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2) | 
                    (~F30 & ~F25 & ~F14 & ~F13 & F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2) | 
                    (~F30 & ~F25 & F14 & ~F13 & F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2) | 
                    (F30 & ~F25 & F14 & ~F13 & F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2) | 
                    (~F14 & F13 & ~F12 & ~OP6 & ~OP5 & ~OP4 & ~OP3 & ~OP2) | 
                    (~F14 & F13 & ~F12 & ~OP6 & OP5 & ~OP4 & ~OP3 & ~OP2) | 
                    (~F30 & ~F25 & ~F14 & ~F13 & ~F12 & OP6 & OP5 & OP4 & ~OP3 & ~OP2) | 
                    (~F14 & ~F13 & ~F12 & OP6 & OP5 & ~OP4 & ~OP3 & ~OP2) | 
                    (~F14 & ~F13 & F12 & OP6 & OP5 & ~OP4 & ~OP3 & ~OP2) | 
                    (~F14 & ~F13 & ~F12 & OP6 & OP5 & ~OP4 & ~OP3 & OP2) | 
                    (F14 & F13 & ~F12 & OP6 & OP5 & OP4 & ~OP3 & ~OP2) | 
                    (F14 & F13 & F12 & OP6 & OP5 & OP4 & ~OP3 & ~OP2) | 
                    (~F30 & ~F25 & ~F14 & ~F13 & F12 & ~OP6 & OP5 & OP4 & ~OP3 & ~OP2) | 
                    (~F14 & F13 & F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2) | 
                    (F14 & ~F13 & ~F12 & ~OP6 & ~OP5 & ~OP4 & ~OP3 & ~OP2) | 
                    (F14 & F13 & ~F12 & OP6 & OP5 & ~OP4 & ~OP3 & ~OP2);
    assign RTread = (~F30 & ~F25 & ~F14 & ~F13 & ~F12 & ~OP6 & OP5 & OP4 & ~OP3 & ~OP2) | 
                    (F30 & ~F25 & ~F14 & ~F13 & ~F12 & ~OP6 & OP5 & OP4 & ~OP3 & ~OP2) | 
                    (~F30 & ~F25 & F14 & F13 & F12 & ~OP6 & OP5 & OP4 & ~OP3 & ~OP2) | 
                    (~F30 & ~F25 & F14 & F13 & ~F12 & ~OP6 & OP5 & OP4 & ~OP3 & ~OP2) | 
                    (~F30 & ~F25 & ~F14 & F13 & ~F12 & ~OP6 & OP5 & OP4 & ~OP3 & ~OP2) | 
                    (~F30 & ~F25 & ~F14 & F13 & F12 & ~OP6 & OP5 & OP4 & ~OP3 & ~OP2) | 
                    (~F14 & F13 & ~F12 & ~OP6 & OP5 & ~OP4 & ~OP3 & ~OP2) | 
                    (~F30 & ~F25 & ~F14 & ~F13 & ~F12 & OP6 & OP5 & OP4 & ~OP3 & ~OP2) | 
                    (~F14 & ~F13 & ~F12 & OP6 & OP5 & ~OP4 & ~OP3 & ~OP2) | 
                    (~F14 & ~F13 & F12 & OP6 & OP5 & ~OP4 & ~OP3 & ~OP2) | 
                    (~F30 & ~F25 & ~F14 & ~F13 & F12 & ~OP6 & OP5 & OP4 & ~OP3 & ~OP2) | 
                    (F14 & F13 & ~F12 & OP6 & OP5 & ~OP4 & ~OP3 & ~OP2);
    assign CSC = (F14 & F13 & ~F12 & OP6 & OP5 & OP4 & ~OP3 & ~OP2) |
                 (F14 & F13 & F12 & OP6 & OP5 & OP4 & ~OP3 & ~OP2);

endmodule