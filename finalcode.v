//Controller module
module convolution(A,B,X,Y,C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,C14,C15,clock,ldS1,ldS2,sel1,sel2,sel3,sel4,sel5,sel6,sel7,sel8,sel9,sel10,sel11,sel12,
sel13,sel14,sel15,add1,add2,add3,add4,add5,add6,add7,add8,add9,add10,add11,add12,add13);
input clock,ldS1,ldS2,sel1,sel2,sel3,sel4,sel5,sel6,sel7,sel8,sel9,sel10,sel11,sel12,
sel13,sel14,sel15,add1,add2,add3,add4,add5,add6,add7,add8,add9,add10,add11,add12,add13;
input [63:0]X;
input [63:0]Y;
output[63:0]A;//Loaded sample
output[63:0]B;//Loaded sample
output [18:0] C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,C14,C15;//Convoluted output
wire [7:0] A0,A1,A2,A3,A4,A5,A6,A7;
wire [7:0] B0,B1,B2,B3,B4,B5,B6,B7;
wire [15:0]Z1,Z2,Z3,Z4,Z5,Z6,Z7,Z8,Z9,Z10,Z11,Z12,Z13,Z14,Z15,Z16,Z17,Z18,Z19,Z20,Z21,Z22,Z23,Z24,Z25,Z26,Z27,Z28,Z29,Z30,Z31,Z32,Z33,
Z34,Z35,Z36,Z37,Z38,Z39,Z40,Z41,Z42,Z43,Z44,Z45,Z46,Z47,Z48,Z49,Z50,Z51,Z52,Z53,Z54,Z55,Z56,Z57,Z58,Z59,Z60,Z61,Z62,Z63,Z64;
assign A0=A[7:0];
assign A1=A[15:8];
assign A2=A[23:16];
assign A3=A[31:24];
assign A4=A[39:32];
assign A5=A[47:40];
assign A6=A[55:48];
assign A7=A[63:56];

assign B0=B[7:0];
assign B1=B[15:8];
assign B2=B[23:16];
assign B3=B[31:24];
assign B4=B[39:32];
assign B5=B[47:40];
assign B6=B[55:48];
assign B7=B[63:56];
//Call modules to load samples
LOAD S1 (A,X,ldS1);
LOAD S2 (B,Y,ldS2);

//Call Booth multiplier module and adder module to produce desired convoluted output

MULOUT1 M1(Z1,A7,B7,clock,sel1);
CONOUT1 CON1(C1,Z1);
MULOUT2 M2(Z2,Z3,A7,A6,B7,B6,clock,sel2);
CONOUT2 C0N2(C2,Z2,Z3,add1);
MULOUT3 M3(Z4,Z5,Z6,A7,A6,A5,B7,B6,B5,clock,sel3);
CONOUT3 CON3(C3,Z4,Z5,Z6,add2);
MULOUT4 M4(Z7,Z8,Z9,Z10,A7,A6,A5,A4,B7,B6,B5,B4,clock,sel4);
CONOUT4 CON4(C4,Z7,Z8,Z9,Z10,add3);
MULOUT5 M5(Z11,Z12,Z13,Z14,Z15,A7,A6,A5,A4,A3,B7,B6,B5,B4,B3,clock,sel5);
CONOUT5 CON5(C5,Z11,Z12,Z13,Z14,Z15,add4);
MULOUT6 M6(Z16,Z17,Z18,Z19,Z20,Z21,A7,A6,A5,A4,A3,A2,B7,B6,B5,B4,B3,B2,clock,sel6);
CONOUT6 CON6(C6,Z16,Z17,Z18,Z19,Z20,Z21,add5);
MULOUT7 M7(Z22,Z23,Z24,Z25,Z26,Z27,Z28,A7,A6,A5,A4,A3,A2,A1,B7,B6,B5,B4,B3,B2,B1,clock,sel7);
CONOUT7 CON7(C7,Z22,Z23,Z24,Z25,Z26,Z27,Z28,add6);
MULOUT8 M8(Z29,Z30,Z31,Z32,Z33,Z34,Z35,Z36,A7,A6,A5,A4,A3,A2,A1,A0,B7,B6,B5,B4,B3,B2,B1,B0,clock,sel8);
CONOUT8 CON8(C8,Z29,Z30,Z31,Z32,Z33,Z34,Z35,Z36,add7);
MULOUT9 M9(Z37,Z38,Z39,Z40,Z41,Z42,Z43,A6,A5,A4,A3,A2,A1,A0,B6,B5,B4,B3,B2,B1,B0,clock,sel9);
CONOUT9 CON9(C9,Z37,Z38,Z39,Z40,Z41,Z42,Z43,add8);
MULOUT10 M10(Z44,Z45,Z46,Z47,Z48,Z49,A5,A4,A3,A2,A1,A0,B5,B4,B3,B2,B1,B0,clock,sel10);
CONOUT10 CON10(C10,Z44,Z45,Z46,Z47,Z48,Z49,add9);
MULOUT11 M11(Z50,Z51,Z52,Z53,Z54,A4,A3,A2,A1,A0,B4,B3,B2,B1,B0,clock,sel11);
CONOUT11 CON11(C11,Z50,Z51,Z52,Z53,Z54,add10);
MULOUT12 M12(Z55,Z56,Z57,Z58,A3,A2,A1,A0,B3,B2,B1,B0,clock,sel12);
CONOUT12 CON12(C12,Z55,Z56,Z57,Z58,add11);
MULOUT13 M13(Z59,Z60,Z61,A2,A1,A0,B2,B1,B0,clock,sel13);
CONOUT13 CON13(C13,Z59,Z60,Z61,add12);
MULOUT14 M14(Z62,Z63,A1,A0,B1,B0,clock,sel14);
CONOUT14 CON14(C14,Z62,Z63,add13);
MULOUT15 M15(Z64,A0,B0,clock,sel15);
CONOUT15 CON15(C15,Z64);
endmodule


//Load Data
module LOAD(data_out,data_in,lds);
input signed [63:0] data_in;
input lds;
output reg signed [63:0] data_out;
always@(posedge lds)
begin
data_out<=data_in;
end
endmodule



module MULOUT1 (Z1,A7,B7,clock,sel1);
input clock,sel1;
input [7:0]A7,B7;
output signed [15:0]Z1;
BoothMulti multiply1(Z1,A7,B7,clock,sel1);
endmodule

module CONOUT1(C1,Z1);
input [15:0]Z1;
output signed [18:0]C1;
assign C1=Z1;
endmodule

module MULOUT2 (Z2,Z3,A7,A6,B7,B6,clock,sel2);
input clock,sel2;
input [7:0]A7,A6,B7,B6;
output signed [15:0]Z2,Z3;
BoothMulti multiply2(Z2,A7,B6,clock,sel2);
BoothMulti multiply3(Z3,A6,B7,clock,sel2);
endmodule

module CONOUT2(C2,Z2,Z3,add);
input add;
input [15:0]Z2,Z3;
output signed [18:0]C2;
assign C2 = (add) ? (Z2 + Z3) : 16'hxxxx;
endmodule

module MULOUT3 (Z4,Z5,Z6,A7,A6,A5,B7,B6,B5,clock,sel3);
input clock,sel3;
input [7:0]A7,A6,A5,B7,B6,B5;
output signed [15:0]Z4,Z5,Z6;
BoothMulti multiply4(Z4,A7,B5,clock,sel3);
BoothMulti multiply5(Z5,A6,B6,clock,sel3);
BoothMulti multiply6(Z6,A5,B7,clock,sel3);
endmodule

module CONOUT3(C3,Z4,Z5,Z6,add);
input add;
input [15:0]Z4,Z5,Z6;
output  signed [18:0]C3;
assign C3 = (add) ? (Z4+Z5+Z6) : 16'hxxxx;
endmodule

module MULOUT4(Z7,Z8,Z9,Z10,A7,A6,A5,A4,B7,B6,B5,B4,clock,sel4);
input clock,sel4;
input [7:0]A7,A6,A5,A4,B7,B6,B5,B4;
output signed [15:0]Z7,Z8,Z9,Z10;
BoothMulti multiply7(Z7,A7,B4,clock,sel4);
BoothMulti multiply8(Z8,A6,B5,clock,sel4);
BoothMulti multiply9(Z9,A5,B6,clock,sel4);
BoothMulti multiply10(Z10,A4,B7,clock,sel4);
endmodule

module CONOUT4(C4,Z7,Z8,Z9,Z10,add);
input add;
input [15:0]Z7,Z8,Z9,Z10;
output  signed [18:0]C4;
assign C4 = (add) ? (Z7+Z8+Z9+Z10) : 16'hxxxx;
endmodule

module MULOUT5(Z11,Z12,Z13,Z14,Z15,A7,A6,A5,A4,A3,B7,B6,B5,B4,B3,clock,sel5);
input clock,sel5;
input [7:0]A7,A6,A5,A4,A3,B7,B6,B5,B4,B3;
output signed [15:0]Z11,Z12,Z13,Z14,Z15;
BoothMulti multiply11(Z11,A7,B3,clock,sel5);
BoothMulti multiply12(Z12,A6,B4,clock,sel5);
BoothMulti multiply13(Z13,A5,B5,clock,sel5);
BoothMulti multiply14(Z14,A4,B6,clock,sel5);
BoothMulti multiply15(Z15,A3,B7,clock,sel5);
endmodule

module CONOUT5(C5,Z11,Z12,Z13,Z14,Z15,add);
input add;
input [15:0]Z11,Z12,Z13,Z14,Z15;
output  signed [18:0]C5;
assign C5 = (add) ? (Z11+Z12+Z13+Z14+Z15) : 16'hxxxx;
endmodule

module MULOUT6(Z16,Z17,Z18,Z19,Z20,Z21,A7,A6,A5,A4,A3,A2,B7,B6,B5,B4,B3,B2,clock,sel6);
input clock,sel6;
input [7:0]A7,A6,A5,A4,A3,A2,B7,B6,B5,B4,B3,B2;
output signed [15:0]Z16,Z17,Z18,Z19,Z20,Z21;
BoothMulti multiply16(Z16,A7,B2,clock,sel6);
BoothMulti multiply17(Z17,A6,B3,clock,sel6);
BoothMulti multiply18(Z18,A5,B4,clock,sel6);
BoothMulti multiply19(Z19,A4,B5,clock,sel6);
BoothMulti multiply20(Z20,A3,B6,clock,sel6);
BoothMulti multiply21(Z21,A2,B7,clock,sel6);
endmodule

module CONOUT6(C6,Z16,Z17,Z18,Z19,Z20,Z21,add);
input add;
input [15:0]Z16,Z17,Z18,Z19,Z20,Z21;
output  signed [18:0]C6;
assign C6= (add) ? (Z16+Z17+Z18+Z19+Z20+Z21) : 16'hxxxx;
endmodule

module MULOUT7(Z22,Z23,Z24,Z25,Z26,Z27,Z28,A7,A6,A5,A4,A3,A2,A1,B7,B6,B5,B4,B3,B2,B1,clock,sel7);
input clock,sel7;
input [7:0]A7,A6,A5,A4,A3,A2,A1,B7,B6,B5,B4,B3,B2,B1;
output signed [15:0]Z22,Z23,Z24,Z25,Z26,Z27,Z28;
BoothMulti multiply22(Z22,A7,B1,clock,sel7);
BoothMulti multiply23(Z23,A6,B2,clock,sel7);
BoothMulti multiply24(Z24,A5,B3,clock,sel7);
BoothMulti multiply25(Z25,A4,B4,clock,sel7);
BoothMulti multiply26(Z26,A3,B5,clock,sel7);
BoothMulti multiply27(Z27,A2,B6,clock,sel7);
BoothMulti multiply28(Z28,A1,B7,clock,sel7);
endmodule

module CONOUT7(C7,Z22,Z23,Z24,Z25,Z26,Z27,Z28,add);
input add;
input [15:0]Z22,Z23,Z24,Z25,Z26,Z27,Z28;
output  signed [18:0]C7;
assign C7= (add) ? (Z22+Z23+Z24+Z25+Z26+Z27+Z28) : 16'hxxxx;
endmodule

module MULOUT8(Z29,Z30,Z31,Z32,Z33,Z34,Z35,Z36,A7,A6,A5,A4,A3,A2,A1,A0,B7,B6,B5,B4,B3,B2,B1,B0,clock,sel8);
input clock,sel8;
input [7:0]A7,A6,A5,A4,A3,A2,A1,A0,B7,B6,B5,B4,B3,B2,B1,B0;
output signed [15:0]Z29,Z30,Z31,Z32,Z33,Z34,Z35,Z36;
BoothMulti multiply29(Z29,A7,B0,clock,sel8);
BoothMulti multiply30(Z30,A6,B1,clock,sel8);
BoothMulti multiply31(Z31,A5,B2,clock,sel8);
BoothMulti multiply32(Z32,A4,B3,clock,sel8);
BoothMulti multiply33(Z33,A3,B4,clock,sel8);
BoothMulti multiply34(Z34,A2,B5,clock,sel8);
BoothMulti multiply35(Z35,A1,B6,clock,sel8);
BoothMulti multiply36(Z36,A0,B7,clock,sel8);
endmodule

module CONOUT8(C8,Z29,Z30,Z31,Z32,Z33,Z34,Z35,Z36,add);
input add;
input [15:0]Z29,Z30,Z31,Z32,Z33,Z34,Z35,Z36;
output  signed [18:0]C8;
assign C8= (add) ? (Z29+Z30+Z31+Z32+Z33+Z34+Z35+Z36) : 16'hxxxx;
endmodule

module MULOUT9(Z37,Z38,Z39,Z40,Z41,Z42,Z43,A6,A5,A4,A3,A2,A1,A0,B6,B5,B4,B3,B2,B1,B0,clock,sel9);
input clock,sel9;
input [7:0]A6,A5,A4,A3,A2,A1,A0,B6,B5,B4,B3,B2,B1,B0;
output signed [15:0]Z37,Z38,Z39,Z40,Z41,Z42,Z43;
BoothMulti multiply37(Z37,A6,B0,clock,sel9);
BoothMulti multiply38(Z38,A5,B1,clock,sel9);
BoothMulti multiply39(Z39,A4,B2,clock,sel9);
BoothMulti multiply40(Z40,A3,B3,clock,sel9);
BoothMulti multiply41(Z41,A2,B4,clock,sel9);
BoothMulti multiply42(Z42,A1,B5,clock,sel9);
BoothMulti multiply43(Z43,A0,B6,clock,sel9);
endmodule

module CONOUT9(C9,Z37,Z38,Z39,Z40,Z41,Z42,Z43,add);
input add;
input [15:0]Z37,Z38,Z39,Z40,Z41,Z42,Z43;
output  signed [18:0]C9;
assign C9= (add) ? (Z37+Z38+Z39+Z40+Z41+Z42+Z43) : 16'hxxxx;
endmodule

module MULOUT10(Z44,Z45,Z46,Z47,Z48,Z49,A5,A4,A3,A2,A1,A0,B5,B4,B3,B2,B1,B0,clock,sel10);
input clock,sel10;
input [7:0]A5,A4,A3,A2,A1,A0,B5,B4,B3,B2,B1,B0;
output signed [15:0]Z44,Z45,Z46,Z47,Z48,Z49;
BoothMulti multiply44(Z44,A5,B0,clock,sel10);
BoothMulti multiply45(Z45,A4,B1,clock,sel10);
BoothMulti multiply46(Z46,A3,B2,clock,sel10);
BoothMulti multiply47(Z47,A2,B3,clock,sel10);
BoothMulti multiply48(Z48,A1,B4,clock,sel10);
BoothMulti multiply49(Z49,A0,B5,clock,sel10);
endmodule

module CONOUT10(C10,Z44,Z45,Z46,Z47,Z48,Z49,add);
input add;
input [15:0]Z44,Z45,Z46,Z47,Z48,Z49;
output  signed [18:0]C10;
assign C10= (add) ? (Z44+Z45+Z46+Z47+Z48+Z49) : 16'hxxxx;
endmodule

module MULOUT11(Z50,Z51,Z52,Z53,Z54,A4,A3,A2,A1,A0,B4,B3,B2,B1,B0,clock,sel11);
input clock,sel11;
input [7:0]A4,A3,A2,A1,A0,B4,B3,B2,B1,B0;
output signed [15:0]Z50,Z51,Z52,Z53,Z54;
BoothMulti multiply50(Z50,A4,B0,clock,sel11);
BoothMulti multiply51(Z51,A3,B1,clock,sel11);
BoothMulti multiply52(Z52,A2,B2,clock,sel11);
BoothMulti multiply53(Z53,A1,B3,clock,sel11);
BoothMulti multiply54(Z54,A0,B4,clock,sel11);
endmodule

module CONOUT11(C11,Z50,Z51,Z52,Z53,Z54,add);
input add;
input [15:0]Z50,Z51,Z52,Z53,Z54;
output  signed [18:0]C11;
assign C11 = (add) ? (Z50+Z51+Z52+Z53+Z54) : 16'hxxxx;
endmodule

module MULOUT12(Z55,Z56,Z57,Z58,A3,A2,A1,A0,B3,B2,B1,B0,clock,sel12);
input clock,sel12;
input [7:0]A3,A2,A1,A0,B3,B2,B1,B0;
output signed [15:0]Z55,Z56,Z57,Z58;
BoothMulti multiply55(Z55,A3,B0,clock,sel12);
BoothMulti multiply56(Z56,A2,B1,clock,sel12);
BoothMulti multiply57(Z57,A1,B2,clock,sel12);
BoothMulti multiply58(Z58,A0,B3,clock,sel12);
endmodule

module CONOUT12(C12,Z55,Z56,Z57,Z58,add);
input add;
input [15:0]Z55,Z56,Z57,Z58;
output  signed [18:0]C12;
assign C12 = (add) ? (Z55+Z56+Z57+Z58) : 16'hxxxx;
endmodule

module MULOUT13 (Z59,Z60,Z61,A2,A1,A0,B2,B1,B0,clock,sel13);
input clock,sel13;
input [7:0]A2,A1,A0,B2,B1,B0;
output signed [15:0]Z59,Z60,Z61;
BoothMulti multiply59(Z59,A2,B0,clock,sel13);
BoothMulti multiply60(Z60,A1,B1,clock,sel13);
BoothMulti multiply61(Z61,A0,B2,clock,sel13);
endmodule

module CONOUT13(C13,Z59,Z60,Z61,add);
input add;
input [15:0]Z59,Z60,Z61;
output  signed [18:0]C13;
assign C13 = (add) ? (Z59+Z60+Z61) : 16'hxxxx;
endmodule

module MULOUT14 (Z62,Z63,A1,A0,B1,B0,clock,sel14);
input clock,sel14;
input [7:0]A1,A0,B1,B0;
output signed [15:0]Z62,Z63;
BoothMulti multiply62(Z62,A1,B0,clock,sel14);
BoothMulti multiply63(Z63,A0,B1,clock,sel14);
endmodule

module CONOUT14(C14,Z62,Z63,add);
input add;
input [15:0]Z62,Z63;
output signed [18:0]C14;
assign C14 = (add) ? (Z62 + Z63) : 16'hxxxx;
endmodule

module MULOUT15(Z64,A0,B0,clock,sel15);
input clock,sel15;
input [7:0]A0,B0;
output signed [15:0]Z64;
BoothMulti multiply1(Z64,A0,B0,clock,sel15);
endmodule

module CONOUT15(C15,Z64);
input [15:0]Z64;
output signed [18:0]C15;
assign C15=Z64;
endmodule

//Booth multiplier module
module Boothmultiplier(ldA,ldQ,ldM,clrA,clrQ,clrff,sftA,sftQ,addsub,decr,ldcnt,data_Q,data_M,clk,q0,qm1,eqz,Out);
input ldA,ldQ,ldM,ldcnt,clrA,clrQ,clrff,decr,sftA,sftQ,addsub,clk;
input signed [7:0] data_Q,data_M;
output  q0,qm1,eqz;
wire [7:0] A,M,Q,Z;
wire  [3:0] count;
output signed [15:0] Out;
assign Out={A,Q};
assign eqz=~|count;
assign q0=Q[0];
dff QM1 (qm1,Q[0],clk,clrff);
shiftreg AR (A,Z,A[7],clk,ldA,clrA,sftA);
shiftreg QR (Q,data_Q,A[0],clk,ldQ,clrQ,sftQ);

PIPO MR (M,data_M,clk,ldM);
ALU AS(Z,A,M,addsub);
counter CN(count,decr,ldcnt,clk);
endmodule

module shiftreg(data_out,data_in,s_in,clk,ld,clr,sft);
input s_in,clk,ld,clr,sft;
input [7:0] data_in;
output reg [7:0] data_out;
always@(posedge clk)
begin 
if(clr) data_out<=0;
else if(ld)
data_out<=data_in;
else if(sft)
data_out<={s_in,data_out[7:1]};
end
endmodule


module PIPO(data_out,data_in,clk,load);
input [7:0] data_in;
input load,clk;
output reg[7:0] data_out;
always@(posedge clk)
if(load) data_out<=data_in;
endmodule

module dff(q,d,clk,clr);
input d,clk,clr;
output reg q;
always@(posedge clk)
if(clr)q<=0;
else q<=d;
endmodule

module ALU(out,in1,in2,addsub);
input [7:0] in1,in2;
input addsub;
output reg [7:0] out;
always@(*)
begin
if(addsub==0) out=in1-in2;
else out=in1+in2;
end
endmodule

module counter(data_out,decr,ldcnt,clk);
input decr,clk,ldcnt;
output reg [3:0] data_out;
always @(posedge clk)
begin
if(ldcnt) data_out<=4'b1000;
else if(decr) data_out<=data_out-1;
end
endmodule

module controller_1(ldA,clrA,sftA,ldQ,clrQ,sftQ,ldM,clrff,addsub,sel,decr,ldcnt,clk,q0,qm1,eqz);
input clk,q0,qm1,eqz,sel;
output reg ldA,clrA,sftA,ldQ,clrQ,sftQ,ldM,clrff,addsub,decr,ldcnt;
reg [2:0] state;
parameter S0=3'b000,S1=3'b001,S2=3'b010,S3=3'b011,S4=3'b100,S5=3'b101,S6=3'b110;
always @(posedge clk)
begin
case(state)
S0: if(sel)state<=S1;
S1: state<=S2;
S2: #2 if({q0,qm1}==2'b01) state<=S3;
    else if ({q0,qm1}==2'b10) state<=S4;
	 else state<=S5;
S3: state<=S5;
S4: state<=S5;
S5: #2 if(({q0,qm1}==2'b01)&&!eqz) state<=S3;
    else if(({q0,qm1}==2'b10)&&!eqz)state<=S4;
	 else if(eqz) state<=S6;
S6: state<=S6;
default:state<=S0;
endcase
end

always @(state) begin
        ldA = 0; clrA = 0; sftA = 0;
        ldQ = 0; clrQ = 0; sftQ = 0;
        ldM = 0; clrff = 0; addsub = 0;
        decr = 0; ldcnt = 0; 

        case (state)
            S0: begin clrA = 1; clrQ = 1; clrff = 1; end
            S1: begin clrA = 1; clrff = 1; ldcnt = 1; ldM = 1; end
            S2: begin ldQ = 1; end
				S3:begin ldA = 1; addsub = 1; end
            S4: begin ldA = 1; addsub = 0; end
            S5: begin sftA = 1; sftQ = 1; decr = 1; end
            S6: begin 
				end
				default:begin clrA=0;sftA=0;ldQ=0;sftQ=0;end
        endcase
    end
endmodule

module BoothMulti(Out,data_Q,data_M,clk,sel);
input signed [7:0] data_Q,data_M;
input clk,sel;
output signed [15:0] Out;
generate
begin
Boothmultiplier DP(ldA,ldQ,ldM,clrA,clrQ,clrff,sftA,sftQ,addsub,decr,ldcnt,data_Q,data_M,clk,q0,qm1,eqz,Out);
controller_1 CP(ldA,clrA,sftA,ldQ,clrQ,sftQ,ldM,clrff,addsub,sel,decr,ldcnt,clk,q0,qm1,eqz);
end
endgenerate

endmodule
//Controller
module controller(ldS1,ldS2,sel1,sel2,sel3,sel4,sel5,sel6,sel7,sel8,sel9,sel10,sel11,sel12,
sel13,sel14,sel15,add1,add2,add3,add4,add5,add6,add7,add8,add9,add10,add11,add12,add13,done,clock,start);
input clock,start;
output reg ldS1,ldS2,sel1,sel2,sel3,sel4,sel5,sel6,sel7,sel8,sel9,sel10,sel11,sel12,
sel13,sel14,sel15,add1,add2,add3,add4,add5,add6,add7,add8,add9,add10,add11,add12,add13,done;
reg[4:0]state;
parameter S0=5'b00000,S1=5'b00001,S2=5'b00010,S3=5'b00011,S4=5'b00100,S5=5'b00101,S6=5'b00110,S7=5'b00111,S8=5'b01000,
S9=5'b01001,S10=5'b01010,S11=5'b01011,S12=5'b01100,S13=5'b01101,S14=5'b01110,S15=5'b01111,S16=5'b10000;
always @(posedge clock)
begin
case(state)
S0: if(start)state<=S1;
S1: state<=S2;
S2: state<=S3;
S3: state<=S4;
S4: state<=S5;
S5: state<=S6;
S6: state<=S7;
S7: state<=S8;
S8: state<=S9;
S9: state<=S10;
S10: state<=S11;
S11: state<=S12;
S12: state<=S13;
S13: state<=S14;
S14: state<=S15;
S15: state<=S16;
S16: state<=S16;


default:state<=S0;
endcase
end

always@(state)
begin
case(state)
S0:begin ldS1=0;ldS2=0;sel1=0;sel2=0;done=0;end
S1:begin ldS1=1;ldS2=1;sel1=0;sel2=0;done=0;end
S2:begin sel1=1;ldS1=0;ldS2=0;done=0;end
S3:begin sel2=1;sel1=0;#1 add1=1;done=0;end
S4:begin sel3=1;sel1=0;sel2=0;#1 add2=1;done=0;end
S5:begin sel4=1;sel1=0;sel2=0;sel3=0;#1 add3=1;done=0;end
S6:begin sel5=1;sel1=0;sel2=0;sel3=0;sel4=0;#1 add4=1;done=0;end
S7:begin sel6=1;sel1=0;sel2=0;sel3=0;sel4=0;sel5=0;#1 add5=1;done=0;end
S8:begin sel7=1;sel1=0;sel2=0;sel3=0;sel4=0;sel5=0;sel6=0;#1 add6=1;done=0;end
S9:begin sel8=1;sel1=0;sel2=0;sel3=0;sel4=0;sel5=0;sel6=0;sel7=0;#1 add7=1;done=0;end
S10:begin sel9=1;sel1=0;sel2=0;sel3=0;sel4=0;sel5=0;sel6=0;sel7=0;sel8=0;#1 add8=1;done=0;end
S11:begin sel10=1;sel1=0;sel2=0;sel3=0;sel4=0;sel5=0;sel6=0;sel7=0;sel8=0;sel9=0;#1 add9=1;done=0;end
S12:begin sel11=1;sel1=0;sel2=0;sel3=0;sel4=0;sel5=0;sel6=0;sel7=0;sel8=0;sel9=0;sel10=0;#1 add10=1;done=0;end
S13:begin sel12=1;sel1=0;sel2=0;sel3=0;sel4=0;sel5=0;sel6=0;sel7=0;sel8=0;sel9=0;sel10=0;sel11=0;#1 add11=1;done=0;end
S14:begin sel13=1;sel1=0;sel2=0;sel3=0;sel4=0;sel5=0;sel6=0;sel7=0;sel8=0;sel9=0;sel10=0;sel11=0;sel12=0;#1 add12=1;done=0;end
S15:begin sel14=1;sel1=0;sel2=0;sel3=0;sel4=0;sel5=0;sel6=0;sel7=0;sel8=0;sel9=0;sel10=0;sel11=0;sel12=0;sel13=0;#1 add13=1; done=0;end
S16:begin sel15=1;sel1=0;sel2=0;sel3=0;sel4=0;sel5=0;sel6=0;sel7=0;sel8=0;sel9=0;sel10=0;sel11=0;sel12=0;sel13=0;sel14=0;done=1;end
default:begin ldS1=0;ldS2=0;done=0;end
endcase
end
endmodule

