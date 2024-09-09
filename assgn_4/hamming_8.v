`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 16:57:32
// Design Name: 
// Module Name: hamming_8
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module hamming_8(a, out);
    input [7:0] a;
    output [7:0] out;

    wire [6:0] xor_0;
    xor x0 (xor_0[6], a[7], a[6])
    genvar i;
    generate
        for (i = 5; i >= 0; i = i + 1) begin: xor_0_gen
            xor x(xor_0[i], xor_0[i+1], a[i]);
        end
    endgenerate
endmodule