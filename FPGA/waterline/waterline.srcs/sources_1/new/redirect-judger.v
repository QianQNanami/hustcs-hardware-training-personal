`timescale 1ns / 1ps

module RedirectedJudger (
    input RSread,
    input RTread,
    input [4:0] RS,
    input [4:0] RT,
    input EX_reg,
    input MEM_reg,
    input [4:0] EX_Wid,
    input [4:0] MEM_Wid,
    input EX_mtr,
    output load,
    output [1:0] RSGO,
    output [1:0] RTGO
);
    wire cmp1_result, cmp2_result, cmp3_result, cmp4_result;
    Comparator #(
        .WIDTH(5)
    ) cmp1 (
        .A(5'h0),
        .B(RS),
        .equal(cmp1_result),
        .larger(),
        .smaller()
    );
    Comparator #(
        .WIDTH(5)
    ) cmp2 (
        .A(RS),
        .B(EX_Wid),
        .equal(cmp2_result),
        .larger(),
        .smaller()
    );
    Comparator #(
        .WIDTH(5)
    ) cmp3 (
        .A(5'h0),
        .B(RT),
        .equal(cmp3_result),
        .larger(),
        .smaller()
    );
    Comparator #(
        .WIDTH(5)
    ) cmp4 (
        .A(RT),
        .B(EX_Wid),
        .equal(cmp4_result),
        .larger(),
        .smaller()
    );
    assign load = (RSread & EX_mtr & ~cmp1_result & cmp2_result) |
                  (RTread & EX_mtr & ~cmp3_result & cmp4_result);
    
    wire cmp5_result, cmp6_result, cmp7_result, cmp8_result;
    Comparator #(
        .WIDTH(5)
    ) cmp5 (
        .A(5'h0),
        .B(RS),
        .equal(cmp5_result),
        .larger(),
        .smaller()
    );
    Comparator #(
        .WIDTH(5)
    ) cmp6 (
        .A(RS),
        .B(EX_Wid),
        .equal(cmp6_result),
        .larger(),
        .smaller()
    );
    Comparator #(
        .WIDTH(5)
    ) cmp7 (
        .A(5'h0),
        .B(RS),
        .equal(cmp7_result),
        .larger(),
        .smaller()
    );
    Comparator #(
        .WIDTH(5)
    ) cmp8 (
        .A(RS),
        .B(MEM_Wid),
        .equal(cmp8_result),
        .larger(),
        .smaller()
    );
    wire sel1, sel2;
    assign sel2 = RSread & EX_reg & ~cmp5_result & cmp6_result;
    assign sel1 = RSread & MEM_reg & ~cmp7_result & cmp8_result;
    wire [1:0] RS_temp;
    MUX2x1 #(
        .DATAWIDTH(2)
    ) mux1 (
        .A(2'h0),
        .B(2'h1),
        .Sel(sel1),
        .Dout(RS_temp)
    );
    MUX2x1 #(
        .DATAWIDTH(2)
    ) mux2 (
        .A(RS_temp),
        .B(2'h2),
        .Sel(sel2),
        .Dout(RSGO)
    );

    wire cmp9_result, cmp10_result, cmp11_result, cmp12_result;
    Comparator #(
        .WIDTH(5)
    ) cmp9 (
        .A(5'h0),
        .B(RT),
        .equal(cmp9_result),
        .larger(),
        .smaller()
    );
    Comparator #(
        .WIDTH(5)
    ) cmp10 (
        .A(RT),
        .B(EX_Wid),
        .equal(cmp10_result),
        .larger(),
        .smaller()
    );
    Comparator #(
        .WIDTH(5)
    ) cmp11 (
        .A(5'h0),
        .B(RT),
        .equal(cmp11_result),
        .larger(),
        .smaller()
    );
    Comparator #(
        .WIDTH(5)
    ) cmp12 (
        .A(RT),
        .B(MEM_Wid),
        .equal(cmp12_result),
        .larger(),
        .smaller()
    );
    wire sel3, sel4;
    assign sel3 = RTread & MEM_reg & ~cmp11_result & cmp12_result;
    assign sel4 = RTread & EX_reg & ~cmp9_result & cmp10_result;
    wire [1:0] RT_temp;
    MUX2x1 #(
        .DATAWIDTH(2)
    ) mux3 (
        .A(2'h0),
        .B(2'h1),
        .Sel(sel3),
        .Dout(RT_temp)
    );
    MUX2x1 #(
        .DATAWIDTH(2)
    ) mux4 (
        .A(RT_temp),
        .B(2'h2),
        .Sel(sel4),
        .Dout(RTGO)
    );
endmodule