`timescale 1ns / 1ps

module Nexys4DDR (
    input clk,
    input [15:0] SW,
    output [7:0] SEG,
    output [7:0] AN,
    output [15:0] LED
);
    // On the Nexys4 DDR, the SW[15] is the leftmost switch
    // Use SW[15:10] to select the data to display
    // SW[15]: PC
    // SW[14]: IR
    // SW[13]: MDin
    // SW[12]: RDin
    // SW[11]: MemWrite
    // SW[10]: RegWrite
    // If none or multiple switches are on, display the LedData
    // Use SW[0] for button Go
    assign LED = SW;
    wire Go, CLKCPU, CLKLED;
    assign Go = SW[0];
    wire [31:0] LedData, PC, IR;
    ClockDivider #(
        .N(100_000_000)
    ) clk_divide(
        .clk(clk),
        .clk_N(CLKCPU)
    );

    ClockDivider #(
        .N(1000)
    ) clk_divide_led(
        .clk(clk),
        .clk_N(CLKLED)
    );

    LedCounter led_counter(
        .CLK(CLKLED),
        .AN(AN)
    );
    wire [31:0] RDin, MDin;
    wire MemWrite, RegWrite;
    SingleCycleCPU cpu(
        .Go(Go),
        .CLK(CLKCPU),
        .LedData(LedData),
        .PC(PC),
        .IR(IR),
        .MDin(MDin),
        .RDin(RDin),
        .MemWrite(MemWrite),
        .RegWrite(RegWrite)
    );

    reg [3:0] LedSplitData;
    initial begin
        LedSplitData = 4'b0000;
    end
    
    reg [31:0] DataToDisplay;
    always @(*) begin
        case(SW[15:10])
            6'b100000: DataToDisplay = PC;
            6'b010000: DataToDisplay = IR;
            6'b001000: DataToDisplay = MDin;
            6'b000100: DataToDisplay = RDin;
            6'b000010: DataToDisplay = {31'b0, MemWrite};
            6'b000001: DataToDisplay = {31'b0, RegWrite};
            default: DataToDisplay = LedData;
        endcase
    end


    always @(*) begin
        case(AN)
            8'b01111111: LedSplitData = DataToDisplay[31:28];
            8'b10111111: LedSplitData = DataToDisplay[27:24];
            8'b11011111: LedSplitData = DataToDisplay[23:20];
            8'b11101111: LedSplitData = DataToDisplay[19:16];
            8'b11110111: LedSplitData = DataToDisplay[15:12];
            8'b11111011: LedSplitData = DataToDisplay[11:8];
            8'b11111101: LedSplitData = DataToDisplay[7:4];
            8'b11111110: LedSplitData = DataToDisplay[3:0];
            default: LedSplitData = 4'b0000;
        endcase
    end
    DisplayNumber display_number(
        .number(LedSplitData),
        .SEG(SEG)
    );
endmodule