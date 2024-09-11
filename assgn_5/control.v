`timescale 1ns / 1ps

module control (clk, active, sel);
    integer N = 32;
    input clk, active;
    input [2:0] sel;

    wire [N-1:0] w_data;

    reg read1, read2, write;
    reg [2:0] dest, src1, src2, sel_alu;

    wire [N-1:0] r_data1, r_data2;

    reg_bank #(N) rb (.clk(clk), .read1(read1), .read2(read2), .write(write), .dest(dest), .w_data(w_data), .src1(src1), .r_data1(r_data1), .src2(src2), .r_data2(r_data2));

    alu_top #(N) alu (.out(w_data), .a(r_data1), .b(r_data2), .sel(sel_alu));
    
    always @(sel) begin
        if(!active) begin
            read1 = 0;
            read2 = 0;
            write = 0;
        end
        else begin
            read1 = 1;
            read2 = 1;
            write = 1;
        end

        case(sel)
            3'b000: begin
                src1 = 3'd2;
                src2 = 3'd3;
                dest = 3'd1;
                sel_alu = 3'd0;
            end
            3'b001: begin
                src1 = 3'd1;
                src2 = 3'd5;
                dest = 3'd4;
                sel_alu = 3'd1;
            end
            3'b010: begin
                src1 = 3'd1;
                src2 = 3'd2;
                dest = 3'd2;
                sel_alu = 3'd10;
            end
            3'b011: begin
                src1 = 3'd1;
                src2 = 3'd2;
                dest = 3'd7;
                sel_alu = 3'd11;
            end
            3'b100: begin
                src1 = 3'd1;
                src2 = 3'd2;
                dest = 3'd6;
                sel_alu = 3'd2;
            end
            3'b101: begin
                src1 = 3'd1;
                src2 = 3'd2;
                dest = 3'd1;
                sel_alu = 3'd5;
            end
            3'b110: begin
                src1 = 3'd2;
                src2 = 3'd0;
                dest = 3'd3;
                sel_alu = 3'd8;
            end
            3'b111: begin
                src1 = 3'd0;
                src2 = 3'd0;
                dest = 3'd6;
                sel_alu = 3'd8;
            end
    end

endmodule