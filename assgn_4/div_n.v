`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 16:10:32
// Design Name: 
// Module Name: div8
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


module div_n #(parameter N = 8)(s, a, b);
    input [N-1:0] a, b;
    output [N-1:0] s;
    
    assign s = a / b;
endmodule
