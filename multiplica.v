`include "mux.v"

module multiplica( //Retorna C = A*B;

    input [15:0] A, B,
    output [15:0] C

);

    assign C = A * B;

endmodule
