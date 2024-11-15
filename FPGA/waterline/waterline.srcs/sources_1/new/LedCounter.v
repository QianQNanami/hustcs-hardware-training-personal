`timescale 1ns / 1ps

module LedCounter (
    input CLK,
    output reg [7:0] AN
);
    reg [2:0] id;

    initial begin
        id = 7;
        AN = 8'b11111111;
    end

    always @(posedge CLK) begin
        if (id == 0) begin
            id <= 7;
        end else begin
            id <= id - 1;
        end

        case(id)
            7: AN <= 8'b01111111;
            6: AN <= 8'b10111111;
            5: AN <= 8'b11011111;
            4: AN <= 8'b11101111;
            3: AN <= 8'b11110111;
            2: AN <= 8'b11111011;
            1: AN <= 8'b11111101;
            0: AN <= 8'b11111110;
            default: AN <= 8'b11111111;
        endcase
    end

endmodule