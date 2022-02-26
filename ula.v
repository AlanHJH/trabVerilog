`include "soma.v"
`include "multiplica.v"

module ula(        
    input [15:0] A,B,
    input [0:0] SEL,
    output [15:0] C,
    output [0:0] overflow
);
    wire [15:0] D,E;
    wire [0:0] F,G;
    soma s0(A,B,D,overflow);
    multiplica m0(A,B,E);
    mux2x1_16b mux0(D,E,SEL,C);
endmodule
