`timescale 1ns/1ps

module data_mem #(parameter BRAM_ADDR_WIDTH = 10, BRAM_DATA_WIDTH = 32) (clk, addr, wr_n, rd_n, bram_data_in, bram_data_out);

    input clk, wr_n, rd_n;
    input [BRAM_ADDR_WIDTH-1:0] addr;
    input [BRAM_DATA_WIDTH-1:0] bram_data_in;
    output reg [BRAM_DATA_WIDTH-1:0] bram_data_out;

    reg [BRAM_DATA_WIDTH-1:0] mem [(1<<BRAM_ADDR_WIDTH)-1:0];

    initial begin
        $loadmemb("data.mem", mem, 0, (1<<BRAM_ADDR_WIDTH)-1);
        for (int i = 0; i < (1<<BRAM_ADDR_WIDTH); i = i + 1) begin
            $monitor("mem[%d] = %d at %d", i, mem[i], $time);
        end
    end

    always @(posedge clk) begin
        if (wr_n == 1'b0) mem[(addr)] <= bram_data_in;
        if (rd_n == 1'b0) bram_data_out <= mem[addr];
    end

endmodule