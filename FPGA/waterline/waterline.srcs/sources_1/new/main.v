`timescale 1ns / 1ps

module RedirectedFiveStagedPipelinedCPU (
    input CLK,
    input Go,
    output [31:0] LedData,
    output [31:0] IF_PC,
    output [31:0] IF_IR,
    output [31:0] RDin,
    output [31:0] MDin,
    output MemWrite,
    output RegWrite
);

    wire [31:0] IF_PCP4, PCnext;
    wire halt, ENS, RESETS, load;

    assign RESETS = 0;
    assign ENS = ~halt;

    Register #(
        .WIDTH(32)
    ) register_PC (
        .Clk(CLK),
        .WE(~(load | halt)),
        .RST(RESETS),
        .Din(PCnext),
        .Dout(IF_PC)
    );
    Adder #(
        .WIDTH(32)
    ) adder_IF_PCP4 (
        .A(IF_PC),
        .B(32'h4),
        .result(IF_PCP4)
    );
    InstructionROM rom (
        .Addr(IF_PC[11:2]),
        .Data(IF_IR)
    );

    wire [31:0] ID_PC, ID_PCP4, ID_IR;
    IFID IF_ID (
        .CLK(CLK),
        .RST(EX_branch),
        .EN(~(halt | load)),
        .PCin(IF_PC),
        .PCout(ID_PC),
        .PCP4in(IF_PCP4),
        .PCP4out(ID_PCP4),
        .IRin(IF_IR),
        .IRout(ID_IR)
    );

    wire ID_JAL, ID_JALR, ID_URET, ID_LBU, ID_BLTU, ID_BEQ, ID_BNE, ID_MemToReg;
    wire ID_MemWrite, ID_AluSrcB, ID_RegWrite, ID_Stype, ID_ecall;
    wire [3:0] ID_AluOP;
    wire [1:0] ID_RSGO, ID_RTGO;
    wire RSU, RTU;
    HardwiredController hardwired (
        .OP_CODE(ID_IR[6:2]),
        .Funct({ID_IR[30], ID_IR[25], ID_IR[14:12]}),
        .IR21(ID_IR[21]),
        .ALU_OP(ID_AluOP),
        .MemToReg(ID_MemToReg),
        .BLTU(ID_BLTU),
        .MemWrite(ID_MemWrite),
        .ALU_SRC(ID_AluSrcB),
        .LBU(ID_LBU),
        .CSC(),
        .RSread(RSU),
        .RegWrite(ID_RegWrite),
        .RTread(RTU),
        .S_type(ID_Stype),
        .BEQ(ID_BEQ),
        .BNE(ID_BNE),
        .JALR(ID_JALR),
        .JAL(ID_JAL),
        .uret(ID_URET),
        .ecall(ID_ecall)
    );

    wire [4:0] RS_id, RT_id;
    MUX2x1 #(
        .DATAWIDTH(5)
    ) mux2x1_R1_wire (
        .A(ID_IR[19:15]),
        .B(5'h11),
        .Dout(RS_id),
        .Sel(ID_ecall)
    );
    MUX2x1 #(
        .DATAWIDTH(5)
    ) mux2x1_R2_wire (
        .A(ID_IR[24:20]),
        .B(5'h0a),
        .Dout(RT_id),
        .Sel(ID_ecall)
    );

    wire [4:0] ID_Wid;
    assign ID_Wid = ID_IR[11:7];

    wire [31:0] ID_Imm;
    wire [11:0] mux_imm_result;
    MUX2x1 #(
        .DATAWIDTH(12)
    ) mux2x1_imm (
        .A(ID_IR[31:20]),
        .B({ID_IR[31:25], ID_IR[11:7]}),
        .Dout(mux_imm_result),
        .Sel(ID_Stype)
    );
    NumberSignExtend #(
        .INPUT_WIDTH(12),
        .OUTPUT_WIDTH(32)
    ) number_sign_extend_imm (
        .Din(mux_imm_result),
        .Dout(ID_Imm)
    );

    wire [31:0] number_sign_extend_beaddr_result, left_shifter_BEADDR_result;
    wire [31:0] ID_BEADDR, ID_JALADDR;
    NumberSignExtend #(
        .INPUT_WIDTH(12),
        .OUTPUT_WIDTH(32)
    ) number_sign_extend_BEADDR (
        .Din({ID_IR[31], ID_IR[7], ID_IR[30:25], ID_IR[11:8]}),
        .Dout(number_sign_extend_beaddr_result)
    );
    LeftShifter left_shifter_BEADDR (
        .Data(number_sign_extend_beaddr_result),
        .Shift(1),
        .Result(left_shifter_BEADDR_result)
    );
    Adder #(
        .WIDTH(32)
    ) adder_ID_BEADDR (
        .A(left_shifter_BEADDR_result),
        .B(ID_PC),
        .result(ID_BEADDR)
    );

    wire [31:0] number_sign_extend_jaladdr_result, left_shifter_JALADDR_result;
    NumberSignExtend #(
        .INPUT_WIDTH(20),
        .OUTPUT_WIDTH(32)
    ) number_sign_extend_JALADDR (
        .Din({ID_IR[31], ID_IR[19:12], ID_IR[20], ID_IR[30:21]}),
        .Dout(number_sign_extend_jaladdr_result)
    );
    LeftShifter left_shifter_JALADDR (
        .Data(number_sign_extend_jaladdr_result),
        .Shift(1),
        .Result(left_shifter_JALADDR_result)
    );
    Adder #(
        .WIDTH(32)
    ) adder_ID_JALADDR (
        .A(left_shifter_JALADDR_result),
        .B(ID_PC),
        .result(ID_JALADDR)
    );

    wire [31:0] ID_R1, ID_R2;
    wire [4:0] WB_Wid;
    wire WB_RegWrite;
    RegFile regfile (
        .Din(RDin),
        .Clk(CLK),
        .WE(WB_RegWrite),
        .WAddr(WB_Wid),
        .R1Addr(RS_id),
        .R2Addr(RT_id),
        .R1(ID_R1),
        .R2(ID_R2)
    ); 

    wire [31:0] EX_R1, EX_R2, EX_PC, EX_IR, EX_PCP4, EX_Imm, EX_BEADDR, EX_JALADDR;
    wire EX_RegWrite, EX_MemToReg, EX_MemWrite, EX_AluSrcB, EX_ecall;
    wire EX_Stype, EX_BEQ, EX_BNE, EX_JAL, EX_JALR, EX_LBU, EX_BLTU;
    wire [4:0] EX_Wid;
    wire [3:0] EX_Aluop;
    wire [1:0] EX_RSGO, EX_RTGO;
    wire [31:0] EX_R1_val, EX_R2_val;

    IDEX ID_EX (
        .CLK(CLK),
        .RST(EX_branch | load),
        .EN(ENS),
        .RegWritein(ID_RegWrite),
        .RegWriteout(EX_RegWrite),
        .MemToRegin(ID_MemToReg),
        .MemToRegout(EX_MemToReg),
        .MemWritein(ID_MemWrite),
        .MemWriteout(EX_MemWrite),
        .ALUopin(ID_AluOP),
        .ALUopout(EX_Aluop),
        .ALUSrcin(ID_AluSrcB),
        .ALUSrcout(EX_AluSrcB),
        .ecallin(ID_ecall),
        .ecallout(EX_ecall),
        .Stypein(ID_Stype),
        .Stypeout(EX_Stype),
        .BEQin(ID_BEQ),
        .BEQout(EX_BEQ),
        .BNEin(ID_BNE),
        .BNEout(EX_BNE),
        .JALin(ID_JAL),
        .JALout(EX_JAL),
        .JALRin(ID_JALR),
        .JALRout(EX_JALR),
        .LBUin(ID_LBU),
        .LBUout(EX_LBU),
        .BLTUin(ID_BLTU),
        .BLTUout(EX_BLTU),
        .R1in(ID_R1),
        .R1out(EX_R1_val),
        .R2in(ID_R2),
        .R2out(EX_R2_val),
        .Widin(ID_Wid),
        .Widout(EX_Wid),
        .Immin(ID_Imm),
        .Immout(EX_Imm),
        .BEADDRin(ID_BEADDR),
        .BEADDRout(EX_BEADDR),
        .PCin(ID_PC),
        .PCout(EX_PC),
        .PCP4in(ID_PCP4),
        .PCP4out(EX_PCP4),
        .JALADDRin(ID_JALADDR),
        .JALADDRout(EX_JALADDR),
        .IRin(ID_IR),
        .IRout(EX_IR),
        .RSGOin(ID_RSGO),
        .RTGOin(ID_RTGO),
        .RSGOout(EX_RSGO),
        .RTGOout(EX_RTGO)
    );

    wire [31:0] ALUB, ALUA;
    MUX4x2 #(
        .DATAWIDTH(32)
    ) mux4x1_ALUA (
        .A(EX_R1_val),
        .B(RDin),
        .C(MEM_ALUOUT),
        .D(32'h0),
        .Dout(EX_R1),
        .Sel(EX_RSGO)
    );
    MUX4x2 #(
        .DATAWIDTH(32)
    ) mux4x1_ALUB (
        .A(EX_R2_val),
        .B(RDin),
        .C(MEM_ALUOUT),
        .D(32'h0),
        .Dout(EX_R2),
        .Sel(EX_RTGO)
    );
    assign ALUA = EX_R1;
    MUX2x1 #(
        .DATAWIDTH(32)
    ) mux2x1_ALUB (
        .A(EX_R2),
        .B(EX_Imm),
        .Dout(ALUB),
        .Sel(EX_AluSrcB)
    );

    wire EX_ALUequal, EX_ALUless, EX_BE, EX_JUMP, EX_branch;
    wire [31:0] EX_Result;
    myALU alu (
        .A(ALUA),
        .B(ALUB),
        .AluOPS(EX_Aluop),
        .ALUequal(EX_ALUequal),
        .ALUless(EX_ALUless),
        .Result(EX_Result)
    );
    assign EX_BE = (EX_ALUequal & EX_BEQ) | (~EX_ALUequal & EX_BNE) | (EX_ALUless & EX_BLTU);
    assign EX_JUMP = EX_JAL | EX_JALR;
    assign EX_branch = EX_BE | EX_JUMP;

    wire [31:0] j1_result, j2_result;
    MUX2x1 #(
        .DATAWIDTH(32)
    ) mux2x1_j1 (
        .A(IF_PCP4),
        .B(EX_BEADDR),
        .Dout(j1_result),
        .Sel(EX_BE)
    );
    MUX2x1 #(
        .DATAWIDTH(32)
    ) mux2x1_j2 (
        .A(j1_result),
        .B(EX_JALADDR),
        .Dout(j2_result),
        .Sel(EX_JAL)
    );
    MUX2x1 #(
        .DATAWIDTH(32)
    ) mux2x1_j3 (
        .A(j2_result),
        .B(EX_Result),
        .Dout(PCnext),
        .Sel(EX_JALR)
    );

    wire [31:0] MEM_PC, MEM_IR, MEM_PCP4, MEM_BEADDR, MEM_JALADDR, MEM_ALUOUT;
    wire [31:0] MEM_R1, MEM_R2, MEM_Imm, MEM_Result;
    wire [4:0] MEM_Wid;
    wire MEM_BE;
    wire MEM_RegWrite, MEM_MemToReg, MEM_MemWrite, MEM_AluSrcB, MEM_ecall;
    wire MEM_Stype, MEM_BEQ, MEM_BNE, MEM_JAL, MEM_JALR, MEM_LBU, MEM_BLTU;
    wire [3:0] MEM_Aluop;
    EXMEM EX_MEM (
        .CLK(CLK),
        .EN(ENS),
        .RST(RESETS),
        .RegWritein(EX_RegWrite),
        .RegWriteout(MEM_RegWrite),
        .MemtoRegin(EX_MemToReg),
        .MemtoRegout(MEM_MemToReg),
        .MemWritein(EX_MemWrite),
        .MemWriteout(MEM_MemWrite),
        .ALUopin(EX_Aluop),
        .ALUopout(MEM_Aluop),
        .ALUSrcin(EX_AluSrcB),
        .ALUSrcout(MEM_AluSrcB),
        .ecallin(EX_ecall),
        .ecallout(MEM_ecall),
        .Stypein(EX_Stype),
        .Stypeout(MEM_Stype),
        .BEQin(EX_BEQ),
        .BEQout(MEM_BEQ),
        .BNEin(EX_BNE),
        .BNEout(MEM_BNE),
        .JALin(EX_JAL),
        .JALout(MEM_JAL),
        .JALRin(EX_JALR),
        .JALRout(MEM_JALR),
        .LBUin(EX_LBU),
        .LBUout(MEM_LBU),
        .BLTUin(EX_BLTU),
        .BLTUout(MEM_BLTU),
        .R1in(EX_R1),
        .R1out(MEM_R1),
        .R2in(EX_R2),
        .R2out(MEM_R2),
        .Widin(EX_Wid),
        .Widout(MEM_Wid),
        .Immin(EX_Imm),
        .Immout(MEM_Imm),
        .BEADDRin(EX_BEADDR),
        .BEADDRout(MEM_BEADDR),
        .PCin(EX_PC),
        .PCout(MEM_PC),
        .PCP4in(EX_PCP4),
        .PCP4out(MEM_PCP4),
        .JALADDRin(EX_JALADDR),
        .JALADDRout(MEM_JALADDR),
        .BEin(EX_BE),
        .BEout(MEM_BE),
        .ALUResultin(EX_Result),
        .ALUResultout(MEM_ALUOUT),
        .IRin(EX_IR),
        .IRout(MEM_IR)
    );

    wire [31:0] MEM_MEMout;
    assign MDin = MEM_R2;
    RAM ram (
        .Clk(CLK),
        .str(MEM_MemWrite),
        .Addr(MEM_ALUOUT[11:2]),
        .Din(MDin),
        .Dout(MEM_MEMout)
    );

    wire [7:0] mux_memout_result;
    wire [31:0] number_zero_extend_MEMout_result, MEM_Mem;
    MUX4x2 #(
        .DATAWIDTH(8)
    ) mux4x1_MEMout (
        .A(MEM_MEMout[7:0]),
        .B(MEM_MEMout[15:8]),
        .C(MEM_MEMout[23:16]),
        .D(MEM_MEMout[31:24]),
        .Dout(mux_memout_result),
        .Sel(MEM_ALUOUT[1:0])
    );
    NumberZeroExtend #(
        .INPUT_WIDTH(8),
        .OUTPUT_WIDTH(32)
    ) number_zero_extend_MEMout (
        .Din(mux_memout_result),
        .Dout(number_zero_extend_MEMout_result)
    );
    MUX2x1 #(
        .DATAWIDTH(32)
    ) mux2x1_MEMout (
        .A(MEM_MEMout),
        .B(number_zero_extend_MEMout_result),
        .Dout(MEM_Mem),
        .Sel(MEM_LBU)
    );

    wire WB_MemToReg, WB_MemWrite, WB_ALUSrcB, WB_BE;
    wire [3:0] WB_Aluop;
    wire WB_ecall, WB_Stype, WB_BEQ, WB_BNE, WB_JAL, WB_JALR, WB_LBU, WB_BLTU;
    wire [31:0] WB_PC, WB_PCP4, WB_BEADDR, WB_JALADDR, WB_ALUResult;
    wire [31:0] WB_IR, WB_Mem;
    wire [31:0] WB_R1, WB_R2;
    MEMWB MEM_WB (
        .CLK(CLK),
        .EN(ENS),
        .RST(RESETS),
        .RegWritein(MEM_RegWrite),
        .RegWriteout(WB_RegWrite),
        .MemtoRegin(MEM_MemToReg),
        .MemtoRegout(WB_MemToReg),
        .MemWritein(MEM_MemWrite),
        .MemWriteout(WB_MemWrite),
        .ALUopin(MEM_Aluop),
        .ALUopout(WB_Aluop),
        .ALUSrcin(MEM_AluSrcB),
        .ALUSrcout(WB_ALUSrcB),
        .ecallin(MEM_ecall),
        .ecallout(WB_ecall),
        .Stypein(MEM_Stype),
        .Stypeout(WB_Stype),
        .BEQin(MEM_BEQ),
        .BEQout(WB_BEQ),
        .BNEin(MEM_BNE),
        .BNEout(WB_BNE),
        .JALin(MEM_JAL),
        .JALout(WB_JAL),
        .JALRin(MEM_JALR),
        .JALRout(WB_JALR),
        .LBUin(MEM_LBU),
        .LBUout(WB_LBU),
        .BLTUin(MEM_BLTU),
        .BLTUout(WB_BLTU),
        .IRin(MEM_IR),
        .IRout(WB_IR),
        .Widin(MEM_Wid),
        .Widout(WB_Wid),
        .Memin(MEM_Mem),
        .Memout(WB_Mem),
        .BEADDRin(MEM_BEADDR),
        .BEADDRout(WB_BEADDR),
        .PCin(MEM_PC),
        .PCout(WB_PC),
        .PCP4in(MEM_PCP4),
        .PCP4out(WB_PCP4),
        .JALADDRin(MEM_JALADDR),
        .JALADDRout(WB_JALADDR),
        .BEin(MEM_BE),
        .BEout(WB_BE),
        .ALUResultin(MEM_ALUOUT),
        .ALUResultout(WB_ALUResult),
        .R1in(MEM_R1),
        .R1out(WB_R1),
        .R2in(MEM_R2),
        .R2out(WB_R2)
    );

    wire WB_JALSignal;
    assign WB_JALSignal = WB_JAL | WB_JALR;

    wire [31:0] mux2x1_WB_1_result;
    MUX2x1 #(
        .DATAWIDTH(32)
    ) mux2x1_WB_1 (
        .A(WB_ALUResult),
        .B(WB_Mem),
        .Dout(mux2x1_WB_1_result),
        .Sel(WB_MemToReg)
    );
    MUX2x1 #(
        .DATAWIDTH(32)
    ) mux2x1_WB_2 (
        .A(mux2x1_WB_1_result),
        .B(WB_PCP4),
        .Dout(RDin),
        .Sel(WB_JALSignal)
    );

    wire [15:0] TotalCycle;
    Counter counter (
        .Clk(CLK),
        .WE(~WB_ecall),
        .Count(TotalCycle)
    );

    wire comparator_equal;
    Comparator #(
        .WIDTH(32)
    ) comparator (
        .A(WB_R1),
        .B(32'h22),
        .larger(),
        .equal(comparator_equal),
        .smaller()
    );
    assign halt = ~comparator_equal & WB_ecall & ~Go;

    Register #(
        .WIDTH(32)
    ) register_LED (
        .Clk(CLK),
        .WE(comparator_equal & WB_ecall),
        .RST(1'b0),
        .Din(WB_R2),
        .Dout(LedData)
    );

    assign MemWrite = MEM_MemWrite;
    assign RegWrite = WB_RegWrite;

    RedirectedJudger redirectedJudger (
        .RSread(RSU),
        .RTread(RTU),
        .RS(RS_id),
        .RT(RT_id),
        .EX_reg(EX_RegWrite),
        .MEM_reg(MEM_RegWrite),
        .EX_Wid(EX_Wid),
        .MEM_Wid(MEM_Wid),
        .EX_mtr(EX_MemToReg),
        .load(load),
        .RSGO(ID_RSGO),
        .RTGO(ID_RTGO)
    );
endmodule
