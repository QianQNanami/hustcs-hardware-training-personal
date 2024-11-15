`timescale 1ns / 1ps

module testbench;

    reg CLK;
    reg [15:0] SW;
    wire [7:0] SEG;
    wire [7:0] AN;
    wire [15:0] LED;

    Nexys4DDR uut (
        .clk(CLK),
        .SW(SW),
        .SEG(SEG),
        .AN(AN),
        .LED(LED)
    );

    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK;
    end

    initial begin
        SW = 16'b0;
        
        #10000000;

        $finish;
    end
//    initial begin
//        $monitor("Time: %0t | CLK: %b | SW: %b | Go: %b | LedData: %h", $time, CLK, SW, LedData);
//    end

endmodule