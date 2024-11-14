`timescale 1ns / 1ps

module SingleCycleCPU (
    input Go,
    input CLK,
    output [31:0] LedData,
    output [31:0] PC,
    output [31:0] IR,
    output [31:0] MDin,
    output [31:0] RDin,
    output MemWrite,
    output RegWrite
);

    wire [31:0] PCADDR, PCP4;
    wire [3:0] AluOPS;
    wire halt, JALS, JALRS, URETS, LBUS, BLTUS, BEQS, BNES, MemToRegS, AluSrcBS;
    wire RSread, RTread, CSC, Stype, ecall;
    wire [4:0] R1_wire, R2_wire;
    
    Register #(.WIDTH(32)) register_PC(
        .Din(PCADDR),
        .Dout(PC),
        .Clk(CLK),
        .WE(~halt),
        .RST(1'b0)
    );
    InstructionROM ROM_instruction(
        .Addr(PC[11:2]),
        .Data(IR)
    );
    Adder #(.WIDTH(32)) adder1(
        .A(PC),
        .B(32'h4),
        .result(PCP4)
    );
    HardwiredController hardwired(
        .IR21(IR[21]),
        .OP_CODE(IR[6:2]),
        .Funct({IR[30], IR[25], IR[14:12]}),
        .ALU_OP(AluOPS),
        .MemToReg(MemToRegS),
        .BLTU(BLTUS),
        .MemWrite(MemWrite),
        .ALU_SRC(AluSrcBS),
        .LBU(LBUS),
        .CSC(CSC),
        .RSread(RSread),
        .RegWrite(RegWrite),
        .RTread(RTread),
        .S_type(Stype),
        .BEQ(BEQS),
        .BNE(BNES),
        .JALR(JALRS),
        .JAL(JALS),
        .uret(URETS),
        .ecall(ecall)
    );
    MUX2x1 #(.DATAWIDTH(5)) muxR1(
        .A(IR[19:15]),
        .B(5'h11),
        .Dout(R1_wire),
        .Sel(ecall)
    );
    MUX2x1 #(.DATAWIDTH(5)) muxR2(
        .A(IR[24:20]),
        .B(5'h0a),
        .Dout(R2_wire),
        .Sel(ecall)
    );
    wire [31:0] R1, R2;
    RegFile regfile(
        .Din(RDin),
        .Clk(CLK),
        .WE(RegWrite),
        .WAddr(IR[11:7]),
        .R1Addr(R1_wire),
        .R2Addr(R2_wire),
        .R1(R1),
        .R2(R2)
    );
    wire [11:0] muxB1result;
    MUX2x1 #(.DATAWIDTH(12)) muxB1(
        .A(IR[31:20]),
        .B({IR[31:25], IR[11:7]}),
        .Dout(muxB1result),
        .Sel(Stype)
    );
    wire [31:0] B1;
    NumberSignExtend #(
        .INPUT_WIDTH(12),
        .OUTPUT_WIDTH(32)
    ) signextendB1 (
        .Din(muxB1result),
        .Dout(B1)
    );
    wire [31:0] signextendBEresult;
    NumberSignExtend #(
        .INPUT_WIDTH(12),
        .OUTPUT_WIDTH(32)
    ) signextendBE (
        .Din({IR[31], IR[7], IR[30:25], IR[11:8]}),
        .Dout(signextendBEresult)
    );

    wire [31:0] signextendJALresult;
    NumberSignExtend #(
        .INPUT_WIDTH(20),
        .OUTPUT_WIDTH(32)
    ) signextendJAL (
        .Din({IR[31], IR[19:12], IR[20], IR[30:21]}),
        .Dout(signextendJALresult)
    );

    wire [31:0] shifter_BE_result, shifter_JAL_result;

    LeftShifter shifter_BE(
        .Data(signextendBEresult),
        .Shift(5'h01),
        .Result(shifter_BE_result)
    );
    LeftShifter shifter_JAL(
        .Data(signextendJALresult),
        .Shift(5'h01),
        .Result(shifter_JAL_result)
    );

    wire [31:0] BEADDR, JALADDR;
    Adder #(.WIDTH(32)) adder_BE(
        .A(shifter_BE_result),
        .B(PC),
        .result(BEADDR)
    );
    Adder #(.WIDTH(32)) adder_JAL(
        .A(shifter_JAL_result),
        .B(PC),
        .result(JALADDR)
    );

    wire [31:0] ALUB;

    MUX2x1 #(.DATAWIDTH(32)) mux_AluB(
        .A(R2),
        .B(B1),
        .Dout(ALUB),
        .Sel(AluSrcBS)
    );

    wire [31:0] ALURet;
    wire ALUequal, ALUless;
    myALU alu(
        .A(R1),
        .B(ALUB),
        .AluOPS(AluOPS),
        .Result(ALURet),
        .ALUequal(ALUequal),
        .ALUless(ALUless)
    );
    
    assign MDin = R2;

    wire [31:0] MEMOUT;
    RAM ram(
        .Addr(ALURet[11:2]),
        .Din(MDin),
        .Dout(MEMOUT),
        .Clk(CLK),
        .str(MemWrite)
    );
    wire [7:0] mux_MEMOUT_result;
    MUX4x2 #(.DATAWIDTH(8)) mux_MEMOUT(
        .A(MEMOUT[7:0]),
        .B(MEMOUT[15:8]),
        .C(MEMOUT[23:16]),
        .D(MEMOUT[31:24]),
        .Dout(mux_MEMOUT_result),
        .Sel(ALURet[1:0])
    );
    wire [31:0] zeroextend_lbu_result;
    NumberZeroExtend #(
        .INPUT_WIDTH(8),
        .OUTPUT_WIDTH(32)
    ) zeroextend_lbu(
        .Din(mux_MEMOUT_result),
        .Dout(zeroextend_lbu_result)
    );
    wire [31:0] mux_lbus_result;
    MUX2x1 #(.DATAWIDTH(32)) mux_lbus(
        .A(MEMOUT),
        .B(zeroextend_lbu_result),
        .Dout(mux_lbus_result),
        .Sel(LBUS)
    );
    wire [31:0] mux_MemToRegS_result;
    MUX2x1 #(.DATAWIDTH(32)) mux_MemToRegS(
        .A(ALURet),
        .B(mux_lbus_result),
        .Dout(mux_MemToRegS_result),
        .Sel(MemToRegS)
    );
    wire JALSign;
    assign JALSign = JALS | JALRS;
    MUX2x1 #(.DATAWIDTH(32)) mux_JAL(
        .A(mux_MemToRegS_result),
        .B(PCP4),
        .Dout(RDin),
        .Sel(JALSign)
    );

    wire [31:0] mux_BES_result, mux_JALS_result;
    wire BES;
    assign BES = (ALUequal & BEQS) | (~ALUequal & BNES) | (ALUless & BLTUS);
    
    MUX2x1 #(.DATAWIDTH(32)) mux_BES(
        .A(PCP4),
        .B(BEADDR),
        .Dout(mux_BES_result),
        .Sel(BES)
    );
    MUX2x1 #(.DATAWIDTH(32)) mux_JALS(
        .A(mux_BES_result),
        .B(JALADDR),
        .Dout(mux_JALS_result),
        .Sel(JALS)
    );
    MUX2x1 #(.DATAWIDTH(32)) mux_JALRS(
        .A(mux_JALS_result),
        .B(ALURet),
        .Dout(PCADDR),
        .Sel(JALRS)
    );

    wire [15:0] TotalCycle;
    Counter #(.WIDTH(16)) TotalCycleCounter(
        .Clk(CLK),
        .WE(~ecall),
        .Count(TotalCycle)
    );

    wire comparatorR122_result;
    Comparator #(.WIDTH(32)) comparatorR122(
        .A(R1),
        .B(32'h22),
        .equal(comparatorR122_result),
        .larger(),
        .smaller()
    );

    MUX2x1 #(.DATAWIDTH(1)) mux_Go(
        .A(~comparatorR122_result & ecall),
        .B(1'b0),
        .Dout(halt),
        .Sel(Go)
    );
    
    Register #(.WIDTH(32)) LedRegister(
        .Din(R2),
        .Dout(LedData),
        .Clk(CLK),
        .WE(comparatorR122_result & ecall),
        .RST(1'b0)
    );

endmodule