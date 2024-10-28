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
    reg [3:0] reg_addr;
    wire [15:0] reg_data_output;
    processor_top #(32) proc(clk, rst, 1'b0, reg_addr, reg_data_output);
    
    initial begin
        $monitor("reg_data_output = %b at time %d", reg_data_output, $time);
        clk = 0;
        rst = 1;
        #2
        rst = 0;
        reg_addr = 4'd10;
        #1000
        $finish;
    end
    
    always begin
        #5
        clk = ~clk;
    end
    
endmodule
