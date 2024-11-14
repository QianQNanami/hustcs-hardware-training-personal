`timescale 1ns / 1ps

module NumberZeroExtend #(
    parameter INPUT_WIDTH = 16,
    parameter OUTPUT_WIDTH = 32
) (
    input wire [INPUT_WIDTH-1:0] Din,
    output wire [OUTPUT_WIDTH-1:0] Dout
);

    assign Dout = {{(OUTPUT_WIDTH-INPUT_WIDTH){1'b0}}, Din};

endmodule