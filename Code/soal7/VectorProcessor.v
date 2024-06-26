module Processor (
    input clk,
    input [8:0] addr,
    input [31:0] data_in,
    input write_enable,
    input reg_write_enable,
    input [2:0] sel_reg_write,
    input [2:0] sel_reg_read1,
    input [2:0] sel_reg_read2,
    output reg [511:0] A1,
    output reg [511:0] A2,
    output reg [511:0] A3,
    output reg [511:0] A4,
    output reg [31:0] data_out
);

// Instantiate modules
RegisterFile regfile (
    .clk(clk),
    .sel_reg_write(sel_reg_write),
    .sel_reg_read1(sel_reg_read1),
    .sel_reg_read2(sel_reg_read2),
    .data_in(data_in),
    .reg_write_enable(reg_write_enable),
    .A1(A1),
    .A2(A2),
    .A3(A3),
    .A4(A4)
);

MathUnit mathunit (
    .clk(clk),
    .A1(A1),
    .A2(A2),
    .A3(A3),
    .A4(A4)
);

Memory memory (
    .clk(clk),
    .addr(addr),
    .data_in(data_in),
    .write_enable(write_enable),
    .data_out(data_out)
);

endmodule

