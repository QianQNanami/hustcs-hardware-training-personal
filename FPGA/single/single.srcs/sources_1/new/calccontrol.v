`timescale 1ns / 1ps

module CalcController (
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
    output wire S0,
    output wire S1,
    output wire S2,
    output wire S3
);
    assign S0 = (~F30 & ~F25 & ~F14 & ~F13 & ~F12 & ~OP6 & OP5 & OP4 & ~OP3 & ~OP2) | 
                (~F30 & ~F25 & F14 & F13 & F12 & ~OP6 & OP5 & OP4 & ~OP3 & ~OP2) | 
                (~F30 & ~F25 & ~F14 & F13 & ~F12 & ~OP6 & OP5 & OP4 & ~OP3 & ~OP2) | 
                (~F14 & ~F13 & ~F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2) | 
                (F14 & F13 & F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2) | 
                (F14 & ~F13 & ~F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2) | 
                (~F14 & F13 & ~F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2) | 
                (F30 & ~F25 & F14 & ~F13 & F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2) | 
                (~F14 & F13 & ~F12 & ~OP6 & ~OP5 & ~OP4 & ~OP3 & ~OP2) | 
                (~F14 & F13 & ~F12 & ~OP6 & OP5 & ~OP4 & ~OP3 & ~OP2) | 
                (~F14 & ~F13 & ~F12 & OP6 & OP5 & ~OP4 & ~OP3 & OP2) | 
                (F14 & ~F13 & ~F12 & ~OP6 & ~OP5 & ~OP4 & ~OP3 & ~OP2);
    assign S1 = (F30 & ~F25 & ~F14 & ~F13 & ~F12 & ~OP6 & OP5 & OP4 & ~OP3 & ~OP2) | 
                (~F30 & ~F25 & F14 & F13 & F12 & ~OP6 & OP5 & OP4 & ~OP3 & ~OP2) | 
                (~F30 & ~F25 & ~F14 & F13 & ~F12 & ~OP6 & OP5 & OP4 & ~OP3 & ~OP2) | 
                (F14 & F13 & F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2) | 
                (~F14 & F13 & ~F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2) | 
                (~F30 & ~F25 & F14 & ~F13 & F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2);
    assign S2 = (~F30 & ~F25 & ~F14 & ~F13 & ~F12 & ~OP6 & OP5 & OP4 & ~OP3 & ~OP2) | 
                (F30 & ~F25 & ~F14 & ~F13 & ~F12 & ~OP6 & OP5 & OP4 & ~OP3 & ~OP2) | 
                (~F30 & ~F25 & F14 & F13 & F12 & ~OP6 & OP5 & OP4 & ~OP3 & ~OP2) | 
                (~F30 & ~F25 & ~F14 & F13 & F12 & ~OP6 & OP5 & OP4 & ~OP3 & ~OP2) | 
                (~F14 & ~F13 & ~F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2) | 
                (F14 & F13 & F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2) | 
                (~F14 & F13 & ~F12 & ~OP6 & ~OP5 & ~OP4 & ~OP3 & ~OP2) | 
                (~F14 & F13 & ~F12 & ~OP6 & OP5 & ~OP4 & ~OP3 & ~OP2) | 
                (~F14 & ~F13 & ~F12 & OP6 & OP5 & ~OP4 & ~OP3 & OP2) | 
                (~F14 & F13 & F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2) | 
                (F14 & ~F13 & ~F12 & ~OP6 & ~OP5 & ~OP4 & ~OP3 & ~OP2) | 
                (F14 & F13 & ~F12 & OP6 & OP5 & ~OP4 & ~OP3 & ~OP2);
    assign S3 = (~F30 & ~F25 & F14 & F13 & ~F12 & ~OP6 & OP5 & OP4 & ~OP3 & ~OP2) | 
                (~F30 & ~F25 & ~F14 & F13 & ~F12 & ~OP6 & OP5 & OP4 & ~OP3 & ~OP2) | 
                (~F30 & ~F25 & ~F14 & F13 & F12 & ~OP6 & OP5 & OP4 & ~OP3 & ~OP2) | 
                (F14 & F13 & ~F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2) | 
                (F14 & ~F13 & ~F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2) | 
                (~F14 & F13 & ~F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2) | 
                (~F14 & F13 & F12 & ~OP6 & ~OP5 & OP4 & ~OP3 & ~OP2) | 
                (F14 & F13 & ~F12 & OP6 & OP5 & ~OP4 & ~OP3 & ~OP2);
endmodule