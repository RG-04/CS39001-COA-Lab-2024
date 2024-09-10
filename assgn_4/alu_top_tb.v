`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2024 15:08:12
// Design Name: 
// Module Name: alu_top_tb
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


module alu_test_tb;
  reg [5:0] a, b;
  reg [3:0] sel;
  wire [5:0] out;
  
  alu_top alu (out, a, b, sel);
 
  initial begin
    a = 30;
    b = 10;
    sel = 0;
    #2
    $display("%d + %d = %d", a, b, out);
    a = 30;
    b = 10;
    sel = 1;
    #2
    $display("%d - %d = %d", a, b, out);
    a = 30;
    b = 10;
    sel = 2;
    #2
    $display("%d * %d = %d", a, b, out);
    a = 30;
    b = 10;
    sel = 3;
    #2
    $display("%d / %d = %d", a, b, out);
    a = 30;
    b = 10;
    sel = 4;
    #2
    $display("%b and %b = %b", a, b, out);
    a = 30;
    b = 10;
    sel = 5;
    #2
    $display("%b or %b = %b", a, b, out);
    a = 30;
    b = 10;
    sel = 6;
    #2
    $display("%b xor %b = %b", a, b, out);
    a = 30;
    b = 10;
    sel = 7;
    #2
    $display("%b not = %b", a, out);
    a = 30;
    b = 10;
    sel = 8;
    #2
    $display("%d = %d", a, out);
    a = 30;
    b = 10;
    sel = 9;
    #2
    $display("%d = %d", b, out);
    a = 6;
    b = 2;
    sel = 10;
    #2
    $display("%b sll %d = %b", a, b, out);
    a = 8'b10100000;
    b = 2;
    sel = 11;
    #2
    $display("%b srl %d = %b", a, b, out);
    a = 8'b10100000;
    b = 2;
    sel = 12;
    #2
    $display("%b sra %d = %b", a, b, out);
    a = 10;
    b = 2;
    sel = 13;
    #2
    $display("%d + 4 = %b", a, out);
    a = 10;
    b = 2;
    sel = 14;
    #2
    $display("%d - 4 = %b", a, out);
    a = 10;
    b = 2;
    sel = 15;
    #2
    $display("%b hamm = %d", a, out);
   
  end
endmodule
