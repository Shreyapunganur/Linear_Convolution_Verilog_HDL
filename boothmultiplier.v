`timescale 1ns / 1ps
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