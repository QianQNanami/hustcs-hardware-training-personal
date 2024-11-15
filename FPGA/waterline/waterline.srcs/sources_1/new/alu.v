`timescale 1ns / 1ps

module myALU (
    input wire [31:0] A,
    input wire [31:0] B,
    input wire [3:0] AluOPS,
    output wire ALUequal,
    output wire ALUless,
    output reg [31:0] Result
);
    reg [31:0] Result2;
    initial begin
        Result = 0;
        Result2 = 0;
    end
    always @(*) begin
        case (AluOPS)
            4'b0000: begin
                Result = A << B[4:0];
                Result2 = 0;
            end
            4'b0001: begin
                Result = $signed(A) >>> B[4:0];
                Result2 = 0;
            end
            4'b0010: begin
                Result = A >> B[4:0];
                Result2 = 0;
            end
            4'b0011: begin
                {Result2, Result} = A * B;
            end
            4'b0100: begin
                Result = A / B;
                Result2 = A % B;
            end
            4'b0101: begin
                Result = A + B;
                Result2 = 0;
            end
            4'b0110: begin
                Result = A - B;
                Result2 = 0;
            end
            4'b0111: begin
                Result = A & B;
                Result2 = 0;
            end
            4'b1000: begin
                Result = A | B;
                Result2 = 0;
            end
            4'b1001: begin
                Result = A ^ B;
                Result2 = 0;
            end
            4'b1010: begin
                Result = ~(A | B);
                Result2 = 0;
            end
            4'b1011: begin
                Result = ($signed(A) < $signed(B)) ? 1 : 0;
                Result2 = 0;
            end
            4'b1100: begin
                Result = (A < B) ? 1 : 0;
                Result2 = 0;
            end
            default: begin
                Result = 0;
                Result2 = 0;
            end
        endcase
    end

    assign ALUequal = (A == B);
    assign ALUless = (A < B);

endmodule