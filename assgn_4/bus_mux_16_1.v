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


module bus_mux_16_1 #(parameter N = 8)(sel, in, out);
    input [3:0] sel;
    input [15:0] in [N-1:0];
    output [N-1:0] out;
    
    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : mux_gen
            mux_16_1 m (.sel(sel), .in(in[i]), .out(out[i]));
        end
    endgenerate
    
endmodule
