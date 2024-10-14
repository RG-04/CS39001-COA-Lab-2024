`timescale 1ns/1ps

module hamming8(out, a);
    input [7:0] a;
    output [7:0] out;

    wire [7:0] sum_temp;
    wire [7:0] sum_1_temp;
    wire [7:0] sum_2_temp;
    wire [7:0] sum_3_temp;
    wire [1:0] carry_temp, carry_1_temp, carry_2_temp, carry_3_temp, carry_fin;
    wire [5:0] sum_temp_2;
    wire [5:0] sum_1_temp_2;
    wire [5:0] sum_2_temp_2;
    wire [5:0] sum_3_temp_2;

    assign out[7:4] = 4'b0;

    genvar i, j;
    generate
        for (i = 0; i < 4; i = i + 1) begin: base_gen_0
            half_adder ha(sum_temp[2*i], sum_temp[2*i+1], a[2*i], a[2*i+1]);
            half_adder ha1(sum_1_temp[2*i], sum_1_temp[2*i+1], a[2*i], a[2*i+1]);
            half_adder ha2(sum_2_temp[2*i], sum_2_temp[2*i+1], a[2*i], a[2*i+1]);
            half_adder ha3(sum_3_temp[2*i], sum_3_temp[2*i+1], a[2*i], a[2*i+1]);
        end
        for (j = 0; j < 2; j = j + 1) begin: base_gen_1
            half_adder ha10(sum_temp_2[3*j], carry_temp[j], sum_temp[4*j], sum_temp[4*j +2]);
            full_adder fa0(sum_temp_2[3*j+1], sum_temp_2[3*j+2], sum_temp[4*j+1], sum_temp[4*j+3], carry_temp[j]);
            half_adder ha11(sum_1_temp_2[3*j], carry_1_temp[j], sum_1_temp[4*j], sum_1_temp[4*j +2]);
            full_adder fa1(sum_1_temp_2[3*j+1], sum_1_temp_2[3*j+2], sum_1_temp[4*j+1], sum_1_temp[4*j+3], carry_1_temp[j]);
            half_adder ha12(sum_2_temp_2[3*j], carry_2_temp[j], sum_2_temp[4*j], sum_2_temp[4*j +2]);
            full_adder fa2(sum_2_temp_2[3*j+1], sum_2_temp_2[3*j+2], sum_2_temp[4*j+1], sum_2_temp[4*j+3], carry_2_temp[j]);
            half_adder ha13(sum_3_temp_2[3*j], carry_3_temp[j], sum_3_temp[4*j], sum_3_temp[4*j +2]);
            full_adder fa3(sum_3_temp_2[3*j+1], sum_3_temp_2[3*j+2], sum_3_temp[4*j+1], sum_3_temp[4*j+3], carry_3_temp[j]);
        end
    endgenerate

    half_adder ha_fin(out[0], carry_fin[0], sum_temp_2[0], sum_temp_2[3]);
    full_adder fa_fin(out[1], carry_fin[1], sum_temp_2[1], sum_temp_2[4], carry_fin[0]);
    full_adder fa_fin_2(out[2], out[3], sum_temp_2[2], sum_temp_2[5], carry_fin[1]);
endmodule