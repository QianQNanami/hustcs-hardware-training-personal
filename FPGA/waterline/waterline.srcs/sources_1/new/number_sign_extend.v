`timescale 1ns / 1ps

module NumberSignExtend #(
    parameter INPUT_WIDTH = 16,
    parameter OUTPUT_WIDTH = 32
) (
    input wire [INPUT_WIDTH-1:0] Din,
    output wire [OUTPUT_WIDTH-1:0] Dout
);

    assign Dout = {{(OUTPUT_WIDTH-INPUT_WIDTH){Din[INPUT_WIDTH-1]}}, Din};

endmodule