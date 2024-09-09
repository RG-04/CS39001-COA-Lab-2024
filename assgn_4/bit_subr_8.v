`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 16:41:45
// Design Name: 
// Module Name: bit_subr_8
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


module bit_subr_8(s, borr, a, b, bin);
	input [7:0] a, b;
	input bin;
	output [7:0] s;
	output borr;
	
	wire [6:0] borrow;
	
	full_subr fs0 (s[0], borrow[0], a[0], b[0], bin);
	full_subr fs1 (s[1], borrow[1], a[1], b[1], borrow[0]);
	full_subr fs2 (s[2], borrow[2], a[2], b[2], borrow[1]);
	full_subr fs3 (s[3], borrow[3], a[3], b[3], borrow[2]);
	full_subr fs4 (s[4], borrow[4], a[4], b[4], borrow[3]);
	full_subr fs5 (s[5], borrow[5], a[5], b[5], borrow[4]);
	full_subr fs6 (s[6], borrow[6], a[6], b[6], borrow[5]);
	full_subr fs7 (s[7], borr, a[7], b[7], borrow[6]);
endmodule