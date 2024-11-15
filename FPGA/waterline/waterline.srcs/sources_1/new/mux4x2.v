`timescale 1ns / 1ps

module MUX4x2 #(
    parameter DATAWIDTH = 32
) (
    input wire [DATAWIDTH-1:0] A,
    input wire [DATAWIDTH-1:0] B,
    input wire [DATAWIDTH-1:0] C,
    input wire [DATAWIDTH-1:0] D,
    output reg [DATAWIDTH-1:0] Dout,
    input wire [1:0] Sel
);
    initial begin
        Dout = 0;
    end
    always @(*) begin
        case (Sel)
            2'b00: Dout = A;
            2'b01: Dout = B;
            2'b10: Dout = C;
            2'b11: Dout = D;
            default: Dout = {DATAWIDTH{1'b0}};
        endcase
    end

endmodule