`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 16:49:40
// Design Name: 
// Module Name: bus_mux_16_1
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


module bus_mux_16_1(sel, in, out);
    input [3:0] sel;
    input [15:0][7:0] in;
    output [7:0] out;
    
    mux_16_1 m0 (.sel(sel), .in(in[0]), .out(out[0]));
    mux_16_1 m1 (.sel(sel), .in(in[1]), .out(out[1]));
    mux_16_1 m2 (.sel(sel), .in(in[2]), .out(out[2]));
    mux_16_1 m3 (.sel(sel), .in(in[3]), .out(out[3]));
    mux_16_1 m4 (.sel(sel), .in(in[4]), .out(out[4]));
    mux_16_1 m5 (.sel(sel), .in(in[5]), .out(out[5]));
    mux_16_1 m6 (.sel(sel), .in(in[6]), .out(out[6]));
    mux_16_1 m7 (.sel(sel), .in(in[7]), .out(out[7]));
    
endmodule
