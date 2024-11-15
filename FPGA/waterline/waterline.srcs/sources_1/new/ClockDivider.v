`timescale 1ns / 1ps

module ClockDivider #(
    parameter N = 100_000_000
) (
    input clk,
    output reg clk_N
);
    reg [31:0] counter;
    initial begin
        counter = 0;
        clk_N = 0;
    end
    always @(posedge clk) begin 
        counter<=counter+1;                      
        if(counter>=(N/2)-1) begin
            clk_N<=~clk_N;
            counter<=0;
        end
    end                          
endmodule
