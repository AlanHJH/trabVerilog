`include "bloco_operacional.v"
`include "bloco_controle.v"


module testbench;

reg clk = 0;
wire wire_clk;
assign wire_clk = clk;

reg [0:0] START, RST;
wire [0:0] LX,LS,LH,H,finished;
wire [1:0] M0,M1,M2;

reg [7:0] X;
reg [15:0] A,B,C;
wire [0:0] Overflow;
wire [15:0] Resultado;


reg [0:0] auxOverflow = 1'b0;


bloco_controle BC0(START,RST,wire_clk,LX,LS,LH,H,finished,M0,M1,M2);
bloco_operacional BO0(X,A,B,C,clk,LX,LS,LH,H,M0,M1,M2, Overflow, Resultado);

always #1 begin
     clk <= ~clk;
     if (Overflow) begin
          auxOverflow <= 1'b1;
     end
end

always @(posedge finished) begin
     if (auxOverflow) begin
          $display ("Overflow!");
     end
end

initial begin
     $dumpvars;

     START = 1'b1;
     X <= 8'b11111110; A <= 16'b0000000000000001; B <= 16'b0000000000000100; C = 16'b0000000000000101;
     #15;
     RST = 1'b1;

     $finish;
end
endmodule