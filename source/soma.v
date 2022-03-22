module half_adder (
    input  [0:0] A, B,
    output [0:0] S, C
);
 
    assign S = A ^ B;
    assign C = A & B;
    
endmodule

module full_adder (
    input  A, B, Cin,
    output Soma, Cout
);
 
    wire Carry_1, Carry_2, Soma_1; 
    half_adder U1 (A, B, Soma_1, Carry_1);
    half_adder U2 (Cin, Soma_1, Soma, Carry_2);
    or           U3 (Cout, Carry_1, Carry_2);
    endmodule

module soma(

    input [15:0] A, B,
    output [15:0]C,
    output [0:0] overflow

); 

    wire [15:0] D;
    assign overflow = D[14] ^ D[15];

    full_adder S0(A[0],B[0],1'b0,C[0],D[0]);
    full_adder S1(A[1],B[1],D[0],C[1],D[1]);
    full_adder S2(A[2],B[2],D[1],C[2],D[2]);
    full_adder S3(A[3],B[3],D[2],C[3],D[3]);
    full_adder S4(A[4],B[4],D[3],C[4],D[4]);
    full_adder S5(A[5],B[5],D[4],C[5],D[5]);
    full_adder S6(A[6],B[6],D[5],C[6],D[6]);
    full_adder S7(A[7],B[7],D[6],C[7],D[7]);
    full_adder S8(A[8],B[8],D[7],C[8],D[8]);
    full_adder S9(A[9],B[9],D[8],C[9],D[9]);
    full_adder S10(A[10],B[10],D[9],C[10],D[10]);
    full_adder S11(A[11],B[11],D[10],C[11],D[11]);
    full_adder S12(A[12],B[12],D[11],C[12],D[12]);
    full_adder S13(A[13],B[13],D[12],C[13],D[13]);
    full_adder S14(A[14],B[14],D[13],C[14],D[14]);
    full_adder S15(A[15],B[15],D[14],C[15],D[15]);

endmodule
