`timescale 1ns/1ps

module display_output #(parameter N = 32) (clk, reg_data, reg_data_output);
    input clk;
    input [N-1:0] reg_data;
    output reg [(N / 2) - 1:0] reg_data_output;

    reg state;
    reg next_state;

    always @(posedge clk) begin
        state <= next_state;
    end

    always @(state) begin
        if (state == 0) begin
            reg_data_output = reg_data[N-1:N/2];
            next_state = 1;
        end
        else begin
            reg_data_output = reg_data[N/2-1:0];
            next_state = 0;
        end
    end
endmodule