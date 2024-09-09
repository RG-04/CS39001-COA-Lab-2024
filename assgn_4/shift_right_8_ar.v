`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 16:57:32
// Design Name: 
// Module Name: shift_right_8_ar
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


module shift_right_8_ar(a, b, out);
    input [7 : 0] a, b;
    output [7 :0] out;

    wire [7:0] mux_out;
    wire [3:0] or_out;

    or or0 (or_out[3], b[7], b[6]);
   
    genvar i, j, k;
    generate
        for (j = 5; i > 2; j = j - 1) begin: or_gen
            or orgate (or_out[j-3], or_out[j-2], b[j]);
        end
        for (i = 0; i < 8; i = i + 1) begin : mux_gen
            mux_8_1 mux (
                .sel(b[2:0]), 
                .in({
                    (i < 1) ? a[7] : a[i+7],
                    (i < 2) ? a[7] : a[i+6],
                    (i < 3) ? a[7] : a[i+5],
                    (i < 4) ? a[7] : a[i+4],
                    (i < 5) ? a[7] : a[i+3],
                    (i < 6) ? a[7] : a[i+2],
                    (i < 7) ? a[7] : a[i+1],
                    a[i]                      // Original bits
                }),
                .out(mux_out[i])
            );
        end
        for (k = 0; k < 8; k = k + 1) begin: mux_gen_2
            mux_2_1 mux2 (.sel(or_out[0]), .i0(mux_out[i]), .i1(a[7]), .out(out[i]));
        end
    endgenerate
    
endmodule
