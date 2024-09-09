`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:31:13 08/14/2024 
// Design Name: 
// Module Name:    subr_N
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module subr_N #(parameter N = 8)(s, borr, a, b);
	input [N-1:0] a, b;
	output [N-1:0] s;
	output borr;
	
	wire [N-2:0] borrow;

    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin: full_adder_gen
            full_subr fs (.s(s[i]), .borr(i == N-1 ? borr : borrow[i]), .a(a[i]), .b(b[i]), .bin(i == 0 ? 0 : borrow[i-1]));
        end
    endgenerate
	
endmodule
