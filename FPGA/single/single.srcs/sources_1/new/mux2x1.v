`timescale 1ns / 1ps

module MUX2x1 #(
    parameter DATAWIDTH = 32
) (
    input wire [DATAWIDTH-1:0] A,
    input wire [DATAWIDTH-1:0] B,
    output reg [DATAWIDTH-1:0] Dout,
    input wire Sel
);
    initial begin
        Dout = 0;
    end
    always @(*) begin
        if (Sel) begin
            Dout = B;
        end else begin
            Dout = A;
        end
    end
    
endmodule