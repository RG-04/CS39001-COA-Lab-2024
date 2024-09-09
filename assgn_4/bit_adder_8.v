`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:31:13 08/14/2024 
// Design Name: 
// Module Name:    bit_adder_8
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

module bit_adder_8(s, c, a, b, cin);
	input [7:0] a, b;
	input cin;
	output [7:0] s;
	output c;
	
	wire [6:0] carry;
	
	full_adder fa0 (s[0], carry[0], a[0], b[0], cin);
	full_adder fa1 (s[1], carry[1], a[1], b[1], carry[0]);
	full_adder fa2 (s[2], carry[2], a[2], b[2], carry[1]);
	full_adder fa3 (s[3], carry[3], a[3], b[3], carry[2]);
	full_adder fa4 (s[4], carry[4], a[4], b[4], carry[3]);
	full_adder fa5 (s[5], carry[5], a[5], b[5], carry[4]);
	full_adder fa6 (s[6], carry[6], a[6], b[6], carry[5]);
	full_adder fa7 (s[7], c, a[7], b[7], carry[6]);
endmodule
