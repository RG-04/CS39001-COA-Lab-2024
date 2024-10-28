`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2024 05:57:54 PM
// Design Name: 
// Module Name: processor_top_tb
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


module processor_top_tb();
    reg clk, rst;
    processor_top #(32) proc(clk, rst, 1'b0);
    
    initial begin
        clk = 0;
        rst = 1;
        #2
        rst = 0;
        #1000
        $finish;
    end
    
    always begin
        #5
        clk = ~clk;
    end
    
endmodule
