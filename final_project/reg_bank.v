`timescale 1ns / 1ps

module reg_bank #(parameter N = 32) (clk, read1, read2, write, dest, w_data, src1, r_data1, src2, r_data2);
    input read1, read2, write;
    input [4:0] dest, src1, src2;
    input [N-1:0] w_data;
    output [N-1:0] r_data1, r_data2;

    reg [N-1:0] reg_file [15:0];

    always @(posedge clk) begin
        reg_file[0] <= 0;
        if (write) begin
            reg_file[dest[3:0]] <= w_data;
        end
    end

    always @(negedge clk) begin
       reg_file[0] <= 0; 
       if (read1) begin
           r_data1 <= reg_file[src1[3:0]];
       end
       if (read2) begin
           r_data2 <= reg_file[src2[3:0]];
       end
    end

endmodule