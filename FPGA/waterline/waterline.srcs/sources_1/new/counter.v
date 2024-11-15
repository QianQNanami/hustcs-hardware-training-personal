`timescale 1ns / 1ps

module Counter #(
    parameter WIDTH = 16
) (
    input wire Clk,
    input wire WE,
    output wire [WIDTH-1:0] Count
);
    reg [WIDTH-1:0] count_reg;
    
    initial begin
        count_reg = 0;
    end

    always @(posedge Clk) begin
        if (WE) begin
            if (count_reg == (1 << WIDTH) - 1) begin
                count_reg <= 0;
            end else begin
                count_reg <= count_reg + 1;
            end
        end
    end
    assign Count = count_reg;

endmodule