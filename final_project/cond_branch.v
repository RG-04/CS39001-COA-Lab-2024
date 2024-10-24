`timescale 1ns/1ps

module cond_branch #(parameter N = 32) (A, cond, branch);
    input [N-1:0] A;
    input [2:0] cond;
    output reg branch;

    always @(*) begin
        case (cond)
            3'b000: branch <= 0;
            3'b100: branch <= 1;
            3'b001: branch <= A < 0;
            3'b010: branch <= A > 0;
            3'b011: branch <= A == 0;
            default: branch <= 0;
        endcase
    end

endmodule