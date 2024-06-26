module TestVectorProcessor;

// Inputs
reg clk;
reg [8:0] addr;
reg [31:0] data_in;
reg write_enable;
reg reg_write_enable;
reg [2:0] sel_reg_write;
reg [2:0] sel_reg_read1;
reg [2:0] sel_reg_read2;

// Outputs
wire [511:0] A1;
wire [511:0] A2;
wire [511:0] A3;
wire [511:0] A4;
wire [31:0] data_out;

// Instantiate the processor
VectorProcessor dut (
    .clk(clk),
    .addr(addr),
    .data_in(data_in),
    .write_enable(write_enable),
    .reg_write_enable(reg_write_enable),
    .sel_reg_write(sel_reg_write),
    .sel_reg_read1(sel_reg_read1),
    .sel_reg_read2(sel_reg_read2),
    .A1(A1),
    .A2(A2),
    .A3(A3),
    .A4(A4),
    .data_out(data_out)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Test stimulus
initial begin
    // Test case 1: Load data into register A1 from memory
    addr = 0;
    data_in = 32'hAABBCCDD;
    write_enable = 1;
    reg_write_enable = 1;
    sel_reg_write = 0;
    sel_reg_read1 = 0;
    sel_reg_read2 = 1;
    #10;

    // Test case 2: Perform multiplication and store results in A3 and A4
    addr = 1;
    data_in = 32'h11223344;
    write_enable = 1;
    reg_write_enable = 1;
    sel_reg_write = 1;
    sel_reg_read1 = 0;
    sel_reg_read2 = 1;
    #10;

    // Add more test cases as needed...

    // End simulation
    $stop;
end

endmodule

