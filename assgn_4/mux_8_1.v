`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 16:46:21
// Design Name: 
// Module Name: mux_8_1
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


module mux_8_1(sel, in, out);
    input [2:0] sel;
    input [7:0] in;
    output out;
    
    wire mo0, mo1;
    
    mux_4_1 m0 (.sel(sel[1:0]), .in(in[3:0]), .out(mo0));
    mux_4_1 m1 (.sel(sel[1:0]), .in(in[7:4]), .out(mo1));
    mux_2_1 final (.sel(sel[2]), .i0(mo0), .i1(mo1), .o(out));
    
endmodule