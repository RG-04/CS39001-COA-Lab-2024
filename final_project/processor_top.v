`timescale 1ns/1ps

module processor_top #(parameter N = 32) (clk, rst);

    input clk, rst;

    wire [N-1:0] NPC, PC, PC_INP;
    wire [N-1:0] IR;
    wire [N-1:0] sgn_extend;
    wire [N-1:0] A, B, ALU_OUT;

    wire [N-1:0] MEM_OUT;

    wire [N-1:0] regWrData;
    wire [4:0] regWrDest;

    // control signals
    wire [2:0] brOp;
    wire [3:0] aluOp;
    wire [1:0] regISel;
    wire BSel, wrRegSel, memRd, memWr, regWr, regRd, sgnExt, isMV, incPC;

    // Control Unit
    control #(N) control_unit (clk, rst, IR[31:26], IR[3:0], brOp, aluOp, BSel, wrRegSel, memRd, memWr, regWr, regRd, regISel, sgnExt, isMV, incPC);

    // Program Counter
    program_counter #(N) pc_block (clk, rst, 1, PC, PC_INP);
    program_counter_inc #(N) pc_inc (clk, PC, NPC);

    // Sign Extend Unit
    wire [N-1:0] sgn_extend_16, sgn_extend_26;
    sgn_extend #(N, 16) sgn_extend_unit (IR[15:0], sgn_extend_16);
    sgn_extend #(N, 26) sgn_extend_unit_2 (IR[25:0], sgn_extend_26);
    assign sgn_extend = sgnExt ? sgn_extend_26 : sgn_extend_16;

    // Regbank
    reg_bank #(N) reg_bank_unit (clk, regRd, regRd, regWr, regWrDest, regWrData, IR[25:21], A, IR[20:16], B);
    // Selecting the write destination register
    assign regWrDest = wrRegSel ? IR[15:11] : IR[20:16];

    // Selecting the Inputs to the ALU
    wire [N-1:0] A_input, B_input;
    assign A_input = (|brOp) ? PC : A;
    assign B_input = BSel ? B : sgn_extend;

    // ALU
    alu_top #(N) alu_unit (ALU_OUT, A_input, B_input, aluOp);


    // Branch Unit
    wire branch;
    cond_branch #(N) branch_unit (A_input, brOp, branch);
    assign PC_INP = branch ? ALU_OUT : NPC;

    // Write back Unit
    wire muxsel;
    assign muxsel = isMV ? ALU_OUT[0] : regISel[0];
    wire [N-1:0] l1_mux_out_1, l1_mux_out_2;
    assign l1_mux_out_1 = muxsel ? MEM_OUT : ALU_OUT;
    assign l1_mux_out_2 = muxsel ? A : B;
    assign regWrData = regISel[1] ? l1_mux_out_2 : l1_mux_out_1;

    // Memory Unit
    // TO DO: Implement the memory unit using BRAM
    // TO DO: Implement the instruction memory using BRAM

endmodule