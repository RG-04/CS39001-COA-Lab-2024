`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 16:57:32
// Design Name: 
// Module Name: shift_right_log
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


module shift_right_log #(parameter N = 8)(out, a, b);
    input [N-1 : 0] a, b;
    output [N-1 :0] out;

    wire [N-1:0][$clog2(N)-1:0] level_mux_out;
    wire [N-2-$clog2(N):0] or_out;

    or or0 (or_out[N-2-$clog2(N)], b[N-1], b[N-2]);
    
    genvar i, j, k, l;
    generate
        for (k = (N-3); k >= $clog2(N); k = k - 1) begin: or_gen
            or orgate (or_out[k-$clog2(N)], or_out[k-$clog2(N)+1], b[k]);
        end

        for (i = 0; i < $clog2(N); i = i + 1) begin: level_decider_loop
            for (j = 0; j < N; j = j + 1) begin: level_mux_gen
                mux_2_1 muxl (.sel(b[i]), .i0(i == 0 ? a[j] : level_mux_out[i-1][j]), .i1(j < (N - (1 << i)) ? level_mux_out[i-1][j + (1 << i)] : 0), .out(level_mux_out[i][j]));
            end
        end

        for (l = 0; l < 8; l = l + 1) begin: mux_level_3_gen
            mux_2_1 muxlf (.sel(or_out[0]), .i0(level_mux_out[$clog2(N)-1][l]), .i1(0), .out(out[l]));
        end
    endgenerate
    
endmodule
