module VectorProcessor (
    input clk,
    input [8:0] addr,
    input [31:0] data_in,
    input write_enable,
    input burst_enable,
    input [3:0] burst_length,
    input reg_write_enable,
    input [1:0] sel_reg_write,
    input [1:0] sel_reg_read1,
    input [1:0] sel_reg_read2,
    input [1:0] operation,  // Control signal for selecting add or multiply
    output [511:0] A1,
    output [511:0] A2,
    output [511:0] A3,
    output [511:0] A4,
    output [31:0] data_out
);

// Instantiate RegisterFile
RegisterFile regfile (
    .clk(clk),
    .sel_reg_write(sel_reg_write),
    .sel_reg_read1(sel_reg_read1),
    .sel_reg_read2(sel_reg_read2),
    .data_in({480'b0, data_in}),  // Zero extend data_in to 512 bits
    .reg_write_enable(reg_write_enable),
    .A1(A1),
    .A2(A2),
    .A3(A3),
    .A4(A4)
);

// Instantiate MathUnit
MathUnit mathunit (
    .clk(clk),
    .A1(A1),
    .A2(A2),
    .operation(operation),
    .A3(A3),
    .A4(A4)
);

// Instantiate Memory
Memory memory (
    .clk(clk),
    .addr(addr),
    .data_in(data_in),
    .write_enable(write_enable),
    .burst_enable(burst_enable),
    .burst_length(burst_length),
    .data_out(data_out)
);

endmodule

