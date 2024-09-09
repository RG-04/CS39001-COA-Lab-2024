`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 16:06:36
// Design Name: 
// Module Name: subr8
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


module subr8(s, borr, a, b);
    input [7:0] a, b;
    output [7:0] s;
    output borr;
    
    parameter bin = 0;
    
    bit_subr_8 subr(s, borr, a, b, bin);
    
endmodule
