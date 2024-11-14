`timescale 1ns / 1ps

module Nexys4DDR (
    input clk,
    input [15:0] SW,
    output [7:0] SEG,
    output [7:0] AN,
    output [15:0] LED
);
    // Use SW[15] for breakpoint 1
    // Use SW[14] for breakpoint 2
    // Use SW[13] for breakpoint 3
    // Use SW[0] for Go
    assign LED = SW;
    wire Go, CLKCPU, CLKLED;
    assign Go = SW[0];
    wire [31:0] LedData;

    ClockDivider #(
        .N(4)
    ) clk_divide(
        .clk(clk),
        .clk_N(CLKCPU)
    );

    ClockDivider #(
        .N(4)
    ) clk_divide_led(
        .clk(clk),
        .clk_N(CLKLED)
    );

    LedCounter led_counter(
        .CLK(CLKLED),
        .AN(AN)
    );

    // assign AN = 8'b00000001;

    SingleCycleCPU cpu(
        .Go(Go),
        .CLK(CLKCPU),
        .LedData(LedData)
    );
    reg [3:0] LedSplitData;
    initial begin
        LedSplitData = 4'b0000;
    end
    
    always @(*) begin
        case(AN)
            8'b01111111: LedSplitData = LedData[31:28];
            8'b10111111: LedSplitData = LedData[27:24];
            8'b11011111: LedSplitData = LedData[23:20];
            8'b11101111: LedSplitData = LedData[19:16];
            8'b11110111: LedSplitData = LedData[15:12];
            8'b11111011: LedSplitData = LedData[11:8];
            8'b11111101: LedSplitData = LedData[7:4];
            8'b11111110: LedSplitData = LedData[3:0];
            default: LedSplitData = 4'b0000;
        endcase
    end
    DisplayNumber display_number(
        .number(LedSplitData),
        .SEG(SEG)
    );
endmodule