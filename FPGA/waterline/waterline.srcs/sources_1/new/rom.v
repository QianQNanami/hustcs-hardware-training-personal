`timescale 1ns / 1ps

module InstructionROM (
    input wire [9:0] Addr,
    output wire [31:0] Data
);
    reg [31:0] mem [0:1023];
    initial begin
        $readmemh("D:/LiuBainian/Project/HardwareCourseDesign/single-cycle-test.hex", mem, 0, 1023);
    end
    assign Data = mem[Addr];
endmodule